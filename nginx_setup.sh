#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install vim nginx -y

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