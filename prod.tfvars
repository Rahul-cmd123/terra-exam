env_name          = "produser18"
vpc_cidr_block    = "10.2.0.0/16"
subnet_cidr_blocks = ["10.2.1.0/24", "10.2.2.0/24"]
http_cidr_block   = "0.0.0.0/0"
ssh_cidr_block    = "0.0.0.0/0"
ami_id            = "ami-04dd23e62ed049936"
instance_type     = "t2.micro"
key_name          = "prod-key"
