terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "local" {
  //
}
provider "tls" {
  
}

provider "aws" {
  region = "us-west-2"
}