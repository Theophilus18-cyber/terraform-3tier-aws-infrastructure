terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  #uncomment for remote state 
  # backend "s3" {
  #   bucket         = "your-bucket-name"
  #}

}

provider "aws" {
  region = var.aws_region

  # Use AWS CLI configuration or environment variables instead of hardcoded credentials
  # access_key and secret_key will be automatically picked up from:
  # 1. AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables
  # 2. AWS CLI configuration (~/.aws/credentials)
  # 3. IAM roles (if running on EC2)
  
  # Only uncomment these lines if you need to override the above methods
  # access_key = var.access_key
  # secret_key = var.secret_key
}

#network module

module "network" {
  source = "./modules/network"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  environment     = var.environment
  
}


#security module

module "security" {
  source = "./modules/security"

  environment = var.environment
  vpc_id      = module.network.vpc_id
  
}

module "database" {
    source = "./modules/database"

     db_subnet_group_id = module.network.db_subnet_group_id
     security_group_id  = module.security.db_security_group_id
     environment = var.environment
     db_name = var.db_name

    db_username = var.db_username
    db_password = var.db_password
     db_instance_class = var.db_instance_class
  
}

# Compute Module (App and Web Tiers)
module "compute" {
  source                = "./modules/compute"
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_name              = var.key_name
  web_security_group_id = module.security.web_security_group_id
  app_security_group_id = module.security.app_security_group_id
  public_subnet_ids     = module.network.public_subnet_ids
  app_subnet_ids        = module.network.app_subnet_ids
  cpu_threshold         = var.cpu_threshold
  web_min_size          = var.web_min_size
  web_max_size          = var.web_max_size
  web_desired_capacity  = var.web_desired_capacity
  app_min_size          = var.app_min_size
  app_max_size          = var.app_max_size
  app_desired_capacity  = var.app_desired_capacity
  environment           = var.environment
}

# Load Balancer Module
module "loadbalancer" {
  source               = "./modules/loadbalancer"
  vpc_id               = module.network.vpc_id
  public_subnet_ids    = module.network.public_subnet_ids
  web_security_group_id = module.security.web_security_group_id
  web_asg_id           = module.compute.web_asg_id
  environment          = var.environment
}