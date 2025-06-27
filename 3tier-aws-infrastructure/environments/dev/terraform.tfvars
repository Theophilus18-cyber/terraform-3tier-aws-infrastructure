# General
aws_region  = "us-east-1"
environment = "dev"

# Network
vpc_cidr        = "10.10.0.0/16"
public_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets = ["10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]

# Compute
ami_id         = "ami-0e449927258d45bc4"
instance_type  = "t2.micro"
key_name       = "theo-key"
cpu_threshold  = 50.0
web_min_size   = 2
web_max_size   = 5
web_desired_capacity = 2
app_min_size   = 2
app_max_size   = 5
app_desired_capacity = 2

# Database
db_name           = "devmysql"
db_username       = "admin"
db_password       = "CHANGE_ME_TO_SECURE_PASSWORD"  # Use AWS Secrets Manager in production
db_instance_class = "db.t3.micro"