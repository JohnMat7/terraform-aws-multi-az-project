output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "subnet_ids" {
  value = {for k,v in aws_subnet.subnets : k => v.id if v.map_public_ip_on_launch == true}
  description = "Map of subnet names to their IDs"
}