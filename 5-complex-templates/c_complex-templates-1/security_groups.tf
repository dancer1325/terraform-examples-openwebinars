resource "aws_security_group" "elb-sg" { // Security group of the elb
  name = "elb-sg"
  vpc_id = "${aws_vpc.vpc.id}"
  ingress {  // Ingress rule === Entry traffic rules
    from_port = 80
    protocol = "tcp"
    to_port = 80  // from_port and to_port is the range of ports opened to receive traffic
    cidr_blocks = ["0.0.0.0/0"] // This value because it's public
  }
  egress {  // Egress rule === Exit traffic rules
    from_port = 0
    protocol = "-1" // Any protocol
    to_port = 0 // 0  === Any possible output port
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web-sg" { // Security group of the instances
  name = "web-sg"
  vpc_id = "${aws_vpc.vpc.id}"
  ingress { // Ingress rule === Entry traffic rules
    from_port = 80
    protocol = "tcp"
    to_port = 80
    security_groups = ["${aws_security_group.elb-sg.id}"] // --> Just the resources with the security group of elb, could access to the instances, whose security group is this one
  }
  egress { // Egress rule === Exit traffic rules
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}