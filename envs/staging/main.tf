module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr     = var.vpc_cidr
  subnets_cidr = var.subnets_cidr

  environment = local.environment
  tags        = local.common_tags
}