terraform {
  required_version = ">= 0.10.7"
}

provider "aws" {
  region = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_id}"]
  profile = "default"
}

data "aws_availability_zones" "az" {}

// Create a VPC module
module "vpc" {
  source = "./modules/vpc"

  // Variables into the module already declared can be set a specific value now
  enable_dns_support = false
  enable_dns_hostnames = false
}