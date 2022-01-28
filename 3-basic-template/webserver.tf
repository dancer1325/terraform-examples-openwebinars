data "aws_availability_zones" "az"{

}

// aws_ami  Data Source to get a registered AMI
// if you get different to 1 result --> Terraform will fail
data "aws_ami" "ubuntu" {
  most_recent = true
#  most_recent = false // It's possible that no unique result is got
  owners = ["137112412989"] // Owner of the AMI

  // If previously you have indicated most_recent and owners --> It's not necessary to indicate a filer
  filter {
    name = "name" // Field to filter the return values from the data
#    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    values = ["amzn2-ami-minimal-selinux-*"]
  }
}

// userdata   EC2 functionality to allow you executing scripts
#data "template_file" "userdata" {  // Deprecated this provider. Alternatives: 1) template function, 2) Cloudinit provider
#  template = "${file("templates/userdata.tpl")}"  // Specify the path
#  vars {
#    webserver = "apache2"  // Replace the variables into the template
#  }
#}

resource "aws_instance" "web-server" {
  // Minimum fields to create an aws instance
  // Ways to insert values
  // 1) Via variables
#  ami = "${var.ami_id}"
  // 2) Via data sources
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"

  // Extra field not mandatory to create the resource
  // Add user_data attribute to the instance via template of script
  // 0) Ways to execute a script in the aws_instance  -- Deprecated template provider
#  user_data = "${data.template_file.userdata.rendered}"
  // 1) Via template function
#  user_data = templatefile("templates/userdata.tpl", { webserver = "apache2"}) // For Ubuntu SO
  user_data = templatefile("templates/userdata.tpl", { webserver = "httpd"})
}