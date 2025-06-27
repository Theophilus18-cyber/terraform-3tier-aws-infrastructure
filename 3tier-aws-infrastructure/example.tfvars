# Example terraform.tfvars file
# Copy this file to terraform.tfvars and fill in your actual values
# DO NOT commit terraform.tfvars to version control

# AWS Credentials (set these via environment variables or AWS CLI configuration)
# access_key = "YOUR_AWS_ACCESS_KEY_ID"
# secret_key = "YOUR_AWS_SECRET_ACCESS_KEY"

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
key_name       = "your-key-name"
cpu_threshold  = 50.0
web_min_size   = 2
web_max_size   = 5
web_desired_capacity = 2
app_min_size   = 2
app_max_size   = 5
app_desired_capacity = 2

# Database
db_name           = "your-database-name"
db_username       = "admin"
db_password       = "your-secure-password"  # Use AWS Secrets Manager in production
db_instance_class = "db.t3.micro" 