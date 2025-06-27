# General
aws_region  = "us-east-1"
environment = "prod"

# Network
vpc_cidr        = "10.20.0.0/16"
public_subnets  = ["10.20.1.0/24", "10.20.2.0/24"]
private_subnets = ["10.20.3.0/24", "10.20.4.0/24", "10.20.5.0/24", "10.20.6.0/24"]

# Compute
ami_id         = "ami-0e449927258d45bc4"
instance_type  = "t2.micro"
key_name       = "prod-key"
cpu_threshold  = 60.0
web_min_size   = 3
web_max_size   = 10
web_desired_capacity = 4
app_min_size   = 3
app_max_size   = 10
app_desired_capacity = 4

# Database
db_name           = "prodmysql"
db_username       = "admin"
db_password       = "CHANGE_ME_TO_SECURE_PASSWORD"  # Use AWS Secrets Manager in production
db_instance_class = "db.t3.medium"