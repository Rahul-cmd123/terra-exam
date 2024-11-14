variable "env_name" {
  description = "The environment name (dev, test, prod)"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance:"
  type        = string
  default     = "t2.micro"  
}

variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair for accessing the EC2 instance"
  type        = string
}
