module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    subnets = var.subnets
}

module "s3" {
    source = "./modules/s3"
    pdf_bucket_name = var.pdf_bucket_name
}