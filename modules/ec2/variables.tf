variable "subnets" {
  description = "List of subnet IDs where EC2 instances will be launched"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "tags" {
  description = "Tags applied to EC2 instances"
  type        = map(string)
}
variable "ec2_names" {
  description = "Names of the EC2 instances"
  type        = list(string)
}

variable "sg_id" {
  description = "Security Group ID attached to the EC2 instances"
  type        = string
}

# Declaring the environment
variable "environment" {
  description = "Dev Environment variables"
  type        = string
}