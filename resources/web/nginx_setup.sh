echo "updating"
sudo apt update -y
sudo apt upgrade -y

echo "installing apps and services"
sudo apt install nginx git -y


echo "configuring nginx"

sudo rm -rf /etc/nginx/sites-available/default
sudo cp /tmp/default /etc/nginx/sites-available/
sudo nginx -s reload

sudo rm -rf /var/www/app
sudo rm -rf /tmp/WebApp
sudo mkdir /var/www/app/
cd /tmp/
git clone https://github.com/bmajczak/WebApp.git
cd WebApp/WebApp
cp -r wwwroot /var/www/app/