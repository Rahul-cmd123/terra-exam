resource "aws_security_group" "allow_http_ssh" {
  name        = "${var.env_name}-sg"
  description = "Allow HTTP and SSH access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.http_cidr_block]  # HTTP access (usually 0.0.0.0/0 or specific IP)
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr_block]  # SSH access (restricted to your IP range)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_name}-sg"
  }
}

output "security_group_id" {
  value = aws_security_group.allow_http_ssh.id
}
