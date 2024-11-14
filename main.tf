

# VPC module
module "vpc" {
  source             = "./modules/network"
  env_name           = var.env_name
  vpc_cidr_block     = var.vpc_cidr_block
  subnet_cidr_blocks = var.subnet_cidr_blocks
}

# Security Group module
module "security_group" {
  source          = "./modules/security"
  env_name        = var.env_name
  vpc_id          = module.vpc.vpc_id
  http_cidr_block = var.http_cidr_block
  ssh_cidr_block  = var.ssh_cidr_block
}

# EC2 Instance module
module "ec2_instance" {
  source             = "./modules/compute"
  env_name           = var.env_name
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  subnet_id          = module.vpc.subnet_ids[0]  # Select the first subnet from the list
  security_group_id  = module.security_group.security_group_id
  key_name           = aws_key_pair.ssh_key_pair.key_name  # Use the key name generated by aws_key_pair
}

# Generate SSH key pair dynamically using TLS
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# AWS Key Pair to be used for EC2 instance
resource "aws_key_pair" "ssh_key_pair" {
  key_name   = var.key_name  # This value is passed from the .tfvars file (e.g., dev-key)
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# Save the Private Key to a .pem File
resource "local_file" "private_key" {
  filename        = "ec2-${var.env_name}-key.pem"
  content         = tls_private_key.ssh_key.private_key_pem
  file_permission = "0400"  # Ensure the file is only readable by the owner
}

# Output the file path for the saved private key
output "private_key_path" {
  value = local_file.private_key.filename
}

# Output the public IP of the EC2 instance
output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}


# Output VPC ID
output "vpc_id" {
  value = module.vpc.vpc_id
}

# Output security group ID
output "security_group_id" {
  value = module.security_group.security_group_id
}