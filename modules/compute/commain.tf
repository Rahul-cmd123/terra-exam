resource "aws_instance" "website" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  security_groups        = [var.security_group_id]  # Security group ID for SSH/HTTP
  key_name               = var.key_name              # SSH key name for access

  # Associate a public IP address (if in a public subnet)
  associate_public_ip_address = true

  tags = {
    Name = "${var.env_name}-website-instance"  # Instance name based on environment
  }

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install apache2 -y
              systemctl start apache2
              systemctl enable apache2
              EOF
}

# Output to expose the public IP address of the instance
output "public_ip" {
  value = aws_instance.website.public_ip
}
