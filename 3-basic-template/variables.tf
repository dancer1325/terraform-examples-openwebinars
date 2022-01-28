variable "cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "ami_id" {
  type = string
#  default = "ami-acd005d5"
  default = "ami-04c921614424b07cd"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}