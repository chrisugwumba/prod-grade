module "vpc" {
  source       = "../../modules/vpc"
  vpc_cidr     = var.vpc_cidr
  subnets_cidr = var.subnets_cidr

  environment = var.environment
  tags        = var.tags
}

module "sg" {
  source = "../../modules/sg"

  vpc_id = module.vpc.vpc_id

  environment = var.environment
  tags        = var.tags
}

module "ec2" {
  source = "../../modules/ec2"

  subnets      = module.vpc.subnet_id
  sg_id        = module.sg.sg_id
  instance_type = var.instance_type
  ec2_names     = var.ec2_names

  environment = var.environment
  tags        = var.tags
}

module "alb" {
  source = "../../modules/alb"
  sg_id     = module.sg.sg_id
  subnets   = module.vpc.subnet_id
  vpc_id    = module.vpc.vpc_id
  instances = module.ec2.instance_ids

  environment = var.environment
  tags        = var.tags

  enable_deletion_protection = var.enable_deletion_protection
}