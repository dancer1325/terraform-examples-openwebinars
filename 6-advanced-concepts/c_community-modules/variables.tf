variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "aws_id" {
  type    = string
  default = "723002569774"
}

variable "aws_amis" {
  type = map(any)

  default = {
    "eu-west-1"    = "ami-00ae935ce6c2aa534" // Key = value
    "us-east-1"    = "ami-0a8b4cd432b1c3063"
    "eu-central-1" = "ami-04c921614424b07cd"
  }
}

variable "environment" {
  type    = string
  default = "pro"
}

variable "rds_username" {
  type    = string
  default = "root"
}

variable "rds_passwd" {
  type    = string
  default = "0penW3b1n4r$"
}
