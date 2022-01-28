// 2) Declaring the resource in a specific file
resource "aws_vpc" "vpc" {
  // aws_vpc  Name of the type of resource in the provider
  // vpc      Name of the resource in our template
  cidr_block = "${var.cidr}"  // Block of the IP segment to create the VPC. Thanks to the plugin appears this field
  enable_dns_hostnames = false
  enable_dns_support = false
  // Attributes not to allow the instances into the VPC have got access to a private dns, to be able to resolve their names internally
  tags = {
    Name = "openwebinars" // Tag for the resource
  }
}