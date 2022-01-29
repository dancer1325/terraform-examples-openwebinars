#!/bin/bash
#yum install -y php70 httpd24 # Deprecated

yum update -y
yum install -y httpd
amazon-linux-extras install php7.2

# /var/www/html/index.php   Default route of apache
# cat EOF >> route   .....  Copy the content of .... in route
cat <<'EOF' >> /var/www/html/index.php #
<?php
phpinfo();
?>
EOF # Indicate the end of the file to read / paste

service httpd restart