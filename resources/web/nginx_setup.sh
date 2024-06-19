echo "updating"
sudo apt update -y
sudo apt upgrade -y

echo "installing apps and services"
sudo apt install nginx -y


echo "configuring nginx"

sudo rm -rf /etc/nginx/sites-available/default
sudo cp /tmp/default /etc/nginx/sites-available/
sudo nginx -s reload