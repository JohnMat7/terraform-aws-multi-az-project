resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "pdf-uploader-vpc"
  }
}


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



resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "pdf-uploader-igw"
  }
}


resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id
  

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "pdf-uploader-route-table"
  }
}




resource "aws_route_table_association" "route_table_association" {
  for_each = {for k,v in aws_subnet.subnets :  k => v.id if v.map_public_ip_on_launch == true}

  subnet_id = each.value
  route_table_id = aws_route_table.route_table.id
}