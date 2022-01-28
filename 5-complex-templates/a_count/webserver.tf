resource "aws_instance" "webservers" {
  ami = "${lookup(var.aws_amis, var.region)}" // lookup(map, key, default)
  instance_type = "${var.instance_type}"
  count = 3  // Create several instances
  tags = {
    Name = "webservers"
  }
}