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