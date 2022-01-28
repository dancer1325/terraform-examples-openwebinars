resource "aws_instance" "webservers" {
  ami = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]  // Add the security group which is into the VPC
  subnet_id = "${aws_subnet.pri1.id}" // Subnet in which starts up the instances
  count = 2
  tags = {
    Name = "${var.environment}-webservers"
  }
}