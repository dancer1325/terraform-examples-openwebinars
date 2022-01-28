// Declare the resource which is going to be imported
resource "aws_instance" "web" {
#  ami = "ami-acd005d5" // Old ami version
  ami = "ami-0dded1c9a19d0b092"
#  instance_type = "t2.small"  // Old instance type created via aws console
  instance_type = "t2.micro"
#  tags = {
#    Name = "openwebinars-webserver"
#  }
}