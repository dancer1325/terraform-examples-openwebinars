output "server-ip" {
  value = "${aws_instance.web-server.public_ip}"
}

output "az" {
  value = "${data.aws_availability_zones.az.names}"
}

// Create an output with id of the ami of ubuntu data
output "ubuntuId" {
  value = "${data.aws_ami.ubuntu.id}"
}

// Create an output with id of the ami of ubuntu data
output "ubuntuName" {
  value = "${data.aws_ami.ubuntu.name}"
}