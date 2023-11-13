#!/bin/bash
echo "updating"
sudo yum update -y
echo "installing apps and services"
sudo yum install epel-release -y
sudo yum install vim git zip unzip httpd -y
sudo yum install php -y
sudo yum install php-mysqli -y

sudo systemctl enable httpd --now

WEB_PATH='/tmp/strona'

echo "downloading web app"
sudo git clone https://github.com/bmajczak/app.git $WEB_PATH
cp $WEB_PATH/index.php /var/www/html/

