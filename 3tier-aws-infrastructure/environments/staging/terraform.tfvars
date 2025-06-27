# General
aws_region  = "us-east-1"
environment = "staging"

# Network
vpc_cidr        = "10.15.0.0/16"
public_subnets  = ["10.15.1.0/24", "10.15.2.0/24"]
private_subnets = ["10.15.3.0/24", "10.15.4.0/24", "10.15.5.0/24", "10.15.6.0/24"]

# Compute
ami_id         = "ami-0e449927258d45bc4"
instance_type  = "t2.small"
key_name       = "staging-key"
cpu_threshold  = 55.0
web_min_size   = 2
web_max_size   = 8
web_desired_capacity = 3
app_min_size   = 2
app_max_size   = 8
app_desired_capacity = 3

# Database
db_name           = "stagingmysql"
db_username       = "admin"
db_password       = "CHANGE_ME_TO_SECURE_PASSWORD"  # Use AWS Secrets Manager in production
db_instance_class = "db.t3.small"
