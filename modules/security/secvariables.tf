# The VPC ID where the security group will be created
variable "vpc_id" {
  description = "The VPC ID to associate the security group with"
  type        = string
}

# CIDR block for HTTP access 
variable "http_cidr_block" {
  description = "The CIDR block for HTTP access"
  type        = string
}

# CIDR block for SSH access
variable "ssh_cidr_block" {
  description = "The CIDR block for SSH access"
  type        = string
}


# CIDR block for SSH access
variable "env_name" {
  description = "Select Env : "
  type        = string
}