vpc_cidr     = "10.0.0.0/16"
subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]

instance_type = "t3.micro"

ec2_names = [
  "prod-web-1",
  "prod-web-2"
]

enable_deletion_protection = false