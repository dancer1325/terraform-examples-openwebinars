resource "aws_elb" "elb-web" {
  name = "${var.environment}-${var.project}"
  cross_zone_load_balancing = true
  subnets = ["${aws_subnet.pub1.id}", "${aws_subnet.pub2.id}"]

  #  "listener" {  // Deprecated
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  security_groups = ["${aws_security_group.elb-sg.id}"]
// Not necessary to define the instances, since in the autoscaling is defined the elb
#  instances = aws_instance.webservers.*.id
}