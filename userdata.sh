#!/bin/bash
yum update -y
amazon-linux-extras install php8.1 -y
yum install -y httpd mariadb105
systemctl start httpd
systemctl enable httpd
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cd wordpress
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${DB_NAME}/" wp-config.php
sed -i "s/username_here/${DB_USER}/" wp-config.php
sed -i "s/password_here/${DB_PASSWORD}/" wp-config.php
sed -i "s/localhost/${DB_HOST}/" wp-config.php
chown -R apache:apache /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress
systemctl restart httpd