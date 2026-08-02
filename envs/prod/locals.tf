locals {
  environment = "prod"

  prod_tags = {
    Environment = local.environment
    Project     = "terraform-lab"
    Owner       = "Chris"
    ManagedBy   = "Owner"
  }
}