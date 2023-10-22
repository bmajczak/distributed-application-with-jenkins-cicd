#!/bin/bash
sudo yum update -y
sudo yum install epel-release -y
sudo yum install git zip unzip -y
sudo yum install mariadb-server -y

sudo systemctl enable mariadb --now


DATABASE_PASS='admin123'
sudo mysqladmin -u root password "$DATABASE_PASS"
sudo mysql -u root -p"$DATABASE_PASS" -e "create database users"
sudo mysql -u root -p"$DATABASE_PASS" -e 'use users; create table `user` (`id` int(11) not null auto_increment, `name` varchar(255) default null, `lastName` varchar(255) default null, primary key(`id`));'
sudo mysql -u root -p"$DATABASE_PASS" -e 'use users; insert into user (name, lastName) values ("imie1","nazwisko1"),("imie2","nazwisko2");'
sudo mysql -u root -p"$DATABASE_PASS" -e 'CREATE USER app@192.168.56.12 IDENTIFIED BY "app123";'
sudo mysql -u root -p"$DATABASE_PASS" -e 'CREATE USER app@192.168.56.13 IDENTIFIED BY "app123";'
sudo mysql -u root -p"$DATABASE_PASS" -e 'GRANT select ON users.user TO app@192.168.56.12;'
sudo mysql -u root -p"$DATABASE_PASS" -e 'GRANT select ON users.user TO app@192.168.56.13;'




