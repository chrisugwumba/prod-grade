variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "sg_id" {
  description = "Security Group ID attached to the ALB"
  type        = string
}

variable "subnets" {
  description = "Subnet IDs for the ALB"
  type        = list(string)
}

variable "instances" {
  description = "EC2 instance IDs to register with the target group"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection on the ALB"
  type        = bool
}