resource "aws_instance" "ec2_instances" {
  for_each = { for k, v in var.subnet_ids : k => v if !startswith(k, "database") }

  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"

  subnet_id = each.value

  tags = {
    Name = "EC2-${each.key}"
  }
}