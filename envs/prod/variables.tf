# For this project, i am using three separate files for the variable declaration for the project 
variable "vpc_cidr" {
  type = string
}

variable "subnets_cidr" {
  type = list(string)
}
# This is for the declaration of locals variable when you want to use locals to
# Define your tags
variable "subnet_names" {
  type = list(string)
  default = [
    "PublicSubnet1",
    "PublicSubnet2"
  ]
}

variable "instance_type" {
  description = "EC2 instance type for this environment"
  type        = string
}

variable "ec2_names" {
  description = "Names of the EC2 instances"
  type        = list(string)
}

variable "enable_deletion_protection" {
  type = bool
}
