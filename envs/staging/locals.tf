locals {
  environment = "stagging"

  common_tags = {
    Environment = local.environment
    Project     = "terraform-lab"
    Owner       = "Chris"
    ManagedBy   = "Owner"
  }
}