region = "ap-south-1"

vpc_cidr = "10.0.0.0/16"


subnets = {
    frontend_az1 = {
        cidr_block              = "10.0.1.0/24"
        availability_zone       = "ap-south-1a"
        map_public_ip_on_launch = true
        tier                    = "public"
    }

    frontend_az2 = {
        cidr_block              = "10.0.2.0/24"
        availability_zone       = "ap-south-1b"
        map_public_ip_on_launch = true
        tier                    = "public"
    }

    backend_az1 = {
        cidr_block              = "10.0.11.0/24"
        availability_zone       = "ap-south-1a"
        map_public_ip_on_launch = false
        tier                    = "private"
    }

    backend_az2 = {
        cidr_block              = "10.0.12.0/24"
        availability_zone       = "ap-south-1b"
        map_public_ip_on_launch = false
        tier                    = "private"
    }

    database_az1 = {
        cidr_block              = "10.0.21.0/24"
        availability_zone       = "ap-south-1a"
        map_public_ip_on_launch = false
        tier                    = "private"
    }
    database_az2 = {
        cidr_block              = "10.0.22.0/24"
        availability_zone       = "ap-south-1b"
        map_public_ip_on_launch = false
        tier                    = "private"
    }
}