terraform {
  required_version = ">= 0.10.7" // Good practise to indicate the Terraform version to use
}

provider "aws" {
  region = "eu-central-1"
  allowed_account_ids = ["723002569774"] // AWS account allowed to create resources -- NOT to commit in a public repo
  profile = "default" // Profile created and stored in the aws folder on premise
}