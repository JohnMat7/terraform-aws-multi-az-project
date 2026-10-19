module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    subnets = var.subnets
}

module "s3" {
    source = "./modules/s3"
    pdf_bucket_name = var.pdf_bucket_name
}


module "ec2_instances" {
    source = "./modules/ec2"
    subnet_ids = module.vpc.subnet_ids
}