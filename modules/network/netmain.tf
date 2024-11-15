resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.env_name}-vpc"
  }
}

resource "aws_subnet" "public" {
  count = 2  # Creating two public subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(["10.0.1.0/24", "10.0.2.0/24"], count.index)
  tags = {
    Name = "${var.env_name}-subnet-${count.index + 1}"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.public[*].id
}
