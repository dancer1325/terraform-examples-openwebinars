// Template used by the autoscaling group to launch instances
resource "aws_launch_configuration" "web-server" {
#  name = "web-server-"  // Unique name
  name_prefix = "web-server-" // Since the name of the launch configuration must be unique --> Define the name_prefix
  image_id = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type = "${var.instance_type}"
  key_name = "openwebinars" // ssh key to launch the instance. It must be created from the AWS console
  security_groups = ["${aws_security_group.web-sg.id}"]
  user_data = "${file("templates/userdata.tpl")}"
  lifecycle {
    create_before_destroy = true  // Create a new launch configuration previous to destroy the old one
  }
}
resource "aws_autoscaling_group" "as-web" {
  name = "${aws_launch_configuration.web-server.name}" // Important!! Naming depending on launch configuration.
  // Consequences. If a new launch configuration is created --> A new autoscaling group will be created
  // Reason. If you don't name depend on launch configuration --> Although launch configuration changes, it's not created a new autoscaling group,
  // then the instances not related to any launch configuration
  // Note: It's one of the cons of using terraform. CloudFormation manage it
  launch_configuration = "${aws_launch_configuration.web-server.name}"
  max_size = 1
  min_size = 1
  load_balancers = ["${aws_elb.elb-web.id}"]
  vpc_zone_identifier = ["${aws_subnet.pub2.id}", "${aws_subnet.pub1.id}"]
  wait_for_elb_capacity = 1 // autoscaling group lookup how many instances in elb live are, previous to consider all ok
#    tags = { // For several tags
  tag {
    key = "Name"
    propagate_at_launch = true
    value = "web-server"
  }
  lifecycle {
    create_before_destroy = true // Create a new autoscaling group previous to destroy the old one
  }
}