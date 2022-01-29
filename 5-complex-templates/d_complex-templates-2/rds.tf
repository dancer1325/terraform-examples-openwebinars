resource "aws_db_subnet_group" "subn-groups" {
  subnet_ids = ["${aws_subnet.pri1.id}", "${aws_subnet.pri2.id}"] // Subnet's id in which to start up the subnets
}

// Create an RDS instance resource
resource "aws_db_instance" "mydb" {
  instance_class = "db.t2.micro"
  identifier = "mydb" // Name of the database
  username = "${var.rds_username}"
  password = "${var.rds_passwd}"
  engine = "mysql"
  allocated_storage = 10 // Gb
  storage_type = "gp2"
  multi_az = false // Database in just 1! AZ
  db_subnet_group_name = "${aws_db_subnet_group.subn-groups.name}"
  vpc_security_group_ids = ["${aws_security_group.rds-sg.id}"]
  publicly_accessible = true // Accesible from internet
  skip_final_snapshot = true
}