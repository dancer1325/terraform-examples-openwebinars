provider "aws" {
  region              = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_id}"]
  profile = "default"
  version = "~> 1.0"
}

// MySQL provider configured based on the outcome of creating the aws_db_instance
provider "mysql" {
  endpoint = "${aws_db_instance.mydb.endpoint}"
  username = "${var.rds_username}"
  password = "${var.rds_passwd}"
}
