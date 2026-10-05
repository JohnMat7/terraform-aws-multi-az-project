module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    subnets = var.subnets
}

output "vpc_id" {
    value       = module.vpc.vpc_id
    description = "The ID of the VPC"
}


output "subnet_ids" {
    value       = module.vpc.subnet_ids
    description = "Map of subnet names to their IDs"
}