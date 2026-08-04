# This is the range of VPC and Submnet cidr block 
vpc_cidr     = "10.0.0.0/16"
subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]

instance_type = "t3.micro"

ec2_names = [
  "stagging-web-1",
  "stagging-web-2"
]

enable_deletion_protection = false