# General
variable "secret_key" {
    type        = string
    description = "AWS Secret Access Key"
    sensitive   = true
}

variable "access_key" {
    type        = string
    description = "AWS Access Key ID"
    sensitive   = true
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

# Network variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

# Compute variables
variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "cpu_threshold" {
  description = "CPU threshold for autoscaling policies"
  type        = number
}

variable "web_min_size" {
  description = "Minimum number of instances in web tier"
  type        = number
}

variable "web_max_size" {
  description = "Maximum number of instances in web tier"
  type        = number
}

variable "web_desired_capacity" {
  description = "Desired number of instances in web tier"
  type        = number
}

variable "app_min_size" {
  description = "Minimum number of instances in app tier"
  type        = number
}

variable "app_max_size" {
  description = "Maximum number of instances in app tier"
  type        = number
}

variable "app_desired_capacity" {
  description = "Desired number of instances in app tier"
  type        = number
}

# Database variables
variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Database instance class"
  type        = string
}