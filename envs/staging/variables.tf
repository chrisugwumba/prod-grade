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