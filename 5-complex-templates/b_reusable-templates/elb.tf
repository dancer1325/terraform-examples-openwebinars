data "aws_availability_zones" "az" {}

resource "aws_elb" "elb-web" {
  // Mandatory fields to fill out to create an aws_elb
  // 1) name_prefix
#  name_prefix = "${var.project}-" // Defined the prefix name of the load balancer. Maximum lenght is 6
  // 2) name
  name = "${var.environment}-${var.project}" // Defined the name of the load balancer

#  "listener" {  // Deprecated
    listener {
    instance_port = 50
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

#  availability_zones = ["${data.aws_availability_zones.az.names}"] // Deprecated
  availability_zones = data.aws_availability_zones.az.names
}