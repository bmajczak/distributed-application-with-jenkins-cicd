echo "updating"
sudo yum update -y

echo "installing apps and services"
sudo yum install epel-release -y
sudo yum install git zip unzip -y
sudo yum install mariadb-server -y

sudo systemctl enable mariadb --now

echo "creating database"
DATABASE_PASS='admin'

sudo mysqladmin -u root password "$DATABASE_PASS"

mysql -u root -p"$DATABASE_PASS" < /home/vagrant/setup.sql