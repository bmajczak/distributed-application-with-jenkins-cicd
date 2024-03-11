echo "updating"
sudo apt update -y
sudo apt upgrade -y

echo "installing apps and services"
sudo apt install nginx -y


echo "configuring nginx"
cat  << EOT >> project
upstream web01 {
    server app01:8080;
    server app02:8080;
}

server {
    listen 80;

    location / {
        proxy_pass http://web01/mywebapp/;
    }
}
EOT

mv project /etc/nginx/sites-available

sudo rm -rf /etc/nginx/sites-enabled/default
sudo rm -rf /etc/nginx/sites-available/default
sudo ln -s /etc/nginx/sites-available/project /etc/nginx/sites-enabled/project
sudo systemctl restart nginx