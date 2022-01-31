terraform {
  required_version = ">= 0.10.7"
  backend "s3" {
    // Necessary to create previously
    // A) S3 bucket with versioning enabled
    // B) Dynamodb table with primary key "LockID"
    bucket = "openwebinars-states" // Name of the bucket previously configured
    region = "eu-central-1"
    key = "states-tfstate" // Name of the tfstate file
    dynamodb_table = "openwebinars-lockin" // Name of the dynamo db table created
    profile = "default"
  }
  // Variables can't be used here. Reason: this part is the entry point, and variables.tf file hasn't been processed
}

provider "aws" {
  region = "${var.region}"
  allowed_account_ids = ["${var.aws_id}"]
  profile = "default"
}

data "aws_availability_zones" "az" {}