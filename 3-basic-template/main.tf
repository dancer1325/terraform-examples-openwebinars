terraform {
  required_version = ">= 0.10.7"
}

provider "aws" {
  region = "eu-central-1"
  allowed_account_ids = ["723002569774"]
  profile = "default"
}

// 1) Declaring the resource in the same main.tf
#resource "aws_vpc" "vpc" {
#  // aws_vpc  Name of the type of resource in the provider
#  // vpc      Name of the resource in our template
#  cidr_block = "10.8.0.0/16"  // Block of the IP segment to create the VPC. Thanks to the plugin appears this field
#  enable_dns_hostnames = false
#  enable_dns_support = false
#  // Attributes not to allow the instances into the VPC have got access to a private dns, to be able to resolve their names internally
#  tags = { // tag isn't a block anymore --> Use =
#    Name = "openwebinars" // Tag for the resource
#  }
#}

