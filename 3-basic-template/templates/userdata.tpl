#!/bin/bash
# 1) Ubuntu SO
#yum install ${webserver} --assumeyes # yum package manager for Linux SO
# service ${webserver} start

# 2) Linux SO
sudo yum update -y
sudo yum install -y ${webserver} ${webserver}-tools mod_ssl
sudo systemctl enable ${webserver}
sudo systemctl start ${webserver}

# X) Which one for?
#sudo apt-get install ${webserver}     # Not existing this package manager. Why?