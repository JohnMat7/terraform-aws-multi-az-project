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