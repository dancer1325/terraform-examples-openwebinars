provider "aws" {
  region              = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_id}"]
  profile = "default"
#  version = "~> 1.0"
}

// Known bug in terraform
// No possible to define a provider which depends on variables to another provider -->
// 1) Comment all part of the code related to the provider, 2) Run terraform plan, terraform apply, 3) Uncomment

// Required from 0.13 terraform version to use providers no Hashicorp official
terraform {
  required_providers {
    mysql = {
      source = "winebarrel/mysql"
      version = "1.10.6"
    }
  }
}

// MySQL provider configured based on the outcome of creating the aws_db_instance
provider "mysql" {
  endpoint = "${aws_db_instance.mydb.endpoint}"
  username = "${var.rds_username}"
  password = "${var.rds_passwd}"
#  version = "1.10.6"
}
