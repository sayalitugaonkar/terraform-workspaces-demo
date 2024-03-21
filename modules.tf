module "vpc" {
  count    = terraform.workspace == "staging" || terraform.workspace == "dev" || terraform.workspace == "prod" ? 1 : 0
  source   = "./vpc-module"
  vpc_name = local.env.vpc_name

  env_module = local.env
}


module "ec2_instance" {
  count  = terraform.workspace == "staging" || terraform.workspace == "dev" ? 1 : 0
  source = "./ec2-module"
    instance = local.env.instance_type
    vpc-id = module.vpc[0].vpc-id
  subnet-1-id = module.vpc[0].subnet-1-id
}

module "s3-bucket-module" {
  count  = terraform.workspace == "staging" || terraform.workspace == "dev" ? 1 : 0
  source = "./s3-bucket-module"
  env_module = local.env
}