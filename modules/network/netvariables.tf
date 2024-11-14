# The name of the environment (dev, test, prod)
variable "env_name" {
  description = "The name of the environment (e.g., dev, test, prod)"
  type        = string
}

# CIDR block for the VPC
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

# List of CIDR blocks for the subnets
variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}
