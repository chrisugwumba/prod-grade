module "vpc" {
  source       = "../../modules/vpc"
  vpc_cidr     = var.vpc_cidr
  subnets_cidr = var.subnets_cidr

  environment = local.environment
  tags        = local.prod_tags
}

# Defining the security group
# This is the security group main parent module (iNgres and egress rule)
module "sg" {
  source      = "../../modules/sg"
  vpc_id      = module.vpc.vpc_id
  environment = local.environment
  tags        = local.prod_tags
}

# This is the ec2 parent module that references the ec2 child module

module "ec2" {
  source = "../../modules/ec2"

  subnets       = module.vpc.subnet_id
  sg_id         = module.sg.sg_id
  ec2_names     = var.ec2_names
  instance_type = var.instance_type
  environment   = local.environment
  tags          = local.prod_tags

}


module "alb" {
  source      = "../../modules/alb"
  sg_id       = module.sg.sg_id
  subnets     = module.vpc.subnet_id
  vpc_id      = module.vpc.vpc_id
  instances   = module.ec2.instance_ids
  environment = local.environment
  tags        = local.prod_tags

  enable_deletion_protection = false
  # or local.enable_deletion_protection if you defined it in locals.tf
}
