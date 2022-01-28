terraform {
  required_version = ">= 0.10.7"
}

provider "aws" {
  region = "eu-central-1"
  allowed_account_ids = ["723002569774"]
  profile = "default"
}