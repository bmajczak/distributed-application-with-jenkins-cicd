sudo apt-get update -y
sudo apt-get install dotnet-sdk-8.0 -y
sudo apt-get install dotnet-runtime-8.0 -y
sudo apt-get install aspnetcore-runtime-8.0 -y
sudo apt-get install nginx -y

sudo rm -rf /etc/nginx/sites-available/default
sudo cp /tmp/default /etc/nginx/sites-available/

sudo mkdir /var/www/app
sudo chmod 777 /var/www/app
sudo chown vagrant /var/www/app

sudo cp /tmp/webapp.service /etc/systemd/system/
sudo systemctl enable webapp.service --now
sudo nginx -s reload

# ssh
if [[ "$HOSTNAME" == "app01" ]]; then
    sudo cat /home/vagrant/.ssh/app01.pub >> /home/vagrant/.ssh/authorized_keys
else
    sudo cat /home/vagrant/.ssh/app02.pub >> /home/vagrant/.ssh/authorized_keys
fi