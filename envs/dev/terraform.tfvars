vpc_cidr     = "10.0.0.0/16"
subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]

# Defining the tag for the dev environment
environment = "dev"

tags = {
  Project = "terraform-lab"
  Owner   = "YourName"
}