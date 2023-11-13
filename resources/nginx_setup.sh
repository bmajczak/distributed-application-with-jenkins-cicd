#!/bin/bash
echo "updating"
sudo apt update -y
sudo apt upgrade -y

echo "installing apps and services"
sudo apt install vim nginx -y


echo "configuring nginx"
cat  << EOT >> project
upstream web01{
    server app01;
    server app02;
}
server {
    listen 80;
 location / {
    proxy_pass http://web01;
 }
}
EOT

mv project /etc/nginx/sites-available

sudo rm -rf /etc/nginx/sites-enabled/default
sudo rm -rf /etc/nginx/sites-available/default
sudo ln -s /etc/nginx/sites-available/project /etc/nginx/sites-enabled/project
sudo systemctl restart nginx