// aws_elb   Create an ELB
resource "aws_elb" "elb-web" {
  name = "${var.environment}-${var.project}"
  cross_zone_load_balancing = true // Balance the traffic between all the AZ
  subnets = ["${aws_subnet.pub1.id}", "${aws_subnet.pub2.id}"] // It comes from a resource. Subnets in which the ELB balance the traffic

  #  "listener" {  // Deprecated
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
#  availability_zones = data.aws_availability_zones.az.names  // --> ELB was defined in the default VPC. Now we want to define in the public subnets
  // Way to define the ELB. 1) AZ,  or  2) subnet
  security_groups = ["${aws_security_group.elb-sg.id}"]
#  instances = ["${aws_instance.webservers.*.id}"] // Since there are several instances --> *. Deprecated way to declare it
  instances = aws_instance.webservers.*.id
}