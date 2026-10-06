# creating vpc 

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "pdf-uploader-vpc"
  }
}

# creating 6 subnets (4 private and 2 public) in 2 availability zones

resource "aws_subnet" "subnets" {
  for_each = var.subnets
  
  vpc_id = aws_vpc.main.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = {
    Name = "${each.key}_${each.value.tier}"
  }
}

# creating internet gateway for public subnets

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "pdf-uploader-igw"
  }
}

# creating route tables for public subnet

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "pdf-uploader-public-route-table"
  }
}




# creating Elastic IP for NAT Gateway

resource "aws_eip" "nat_eip" {

  domain = "vpc"
  tags = {
    Name = "pdf-uploader-nat-eip"
  }
}


# creating NAT Gateway for private subnets

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnets["frontend_az1"].id
  tags = {
    Name = "pdf-uploader-nat-gateway"
  }
  
  depends_on = [aws_internet_gateway.igw]
  
}

# creating route table for private subnets

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "pdf-uploader-private-route-table"
  }
}
# creating route table associations for public and private subnets


resource "aws_route_table_association" "route_table_association" {
  for_each = {for k,v in aws_subnet.subnets :  k => v.id if v.map_public_ip_on_launch == true}

  subnet_id = each.value
  route_table_id = aws_route_table.public_route_table.id
}





resource "aws_route_table_association" "private_route_table_association" {
  for_each = {for k,v in aws_subnet.subnets :  k => v.id if v.map_public_ip_on_launch == false}

  subnet_id = each.value
  route_table_id = aws_route_table.private_route_table.id
}


