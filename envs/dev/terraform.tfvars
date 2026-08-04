vpc_cidr     = "10.0.0.0/16"
subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]

# Defining the tag for the dev environment
environment = "dev"



instance_type = "t3.micro"

ec2_names = [
  "dev-web-1",
  "dev-web-2"
]
tags = {
  Project     = "terraform-lab"
  Owner       = "Chris"
  Environment = "dev"
  ManagedBy   = "Terraform"
}

enable_deletion_protection = false