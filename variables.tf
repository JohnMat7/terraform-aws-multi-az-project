variable "region" {
  description = "specifying region"
  type        = string
}

variable "vpc_cidr" {
  description = "specifying vpc cidr"
  type        = string
}


variable "subnets" {
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    tier                    = string # "public" or "private" for easy identification
  }))
  description = "Map of public and private subnets with their configurations"
}