terraform {
  required_version = ">= 0.10.7"
}

provider "aws" {
  region              = var.aws_region
  allowed_account_ids = ["${var.aws_id}"]
  profile             = "default"
#  version             = "~> 1.0"  // Not necessary to specify and download based on the module one
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.5"

  // Possible variables to specify in the module downloaded from terraform registry

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs              = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets   = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  database_subnets = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"] // Subnet just for data

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
