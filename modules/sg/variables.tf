variable "vpc_id" {
  description = "VPC for security Group"
  type        = string

}

# Declaring the environment
variable "environment" {
  description = "Dev Environment variables"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}