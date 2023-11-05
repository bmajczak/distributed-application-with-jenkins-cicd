#!/bin/bash
echo "updating"
sudo yum update -y
sudo yum upgrade -y

echo "installing apps"
sudo yum install git vim  -y

echo "installing jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-17-openjdk -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl enable jenkins --now
sudo wget http://localhost:8080/jnlpJars/jenkins-cli.jar


echo "unlocking jenkins"
sudo chmod +x /home/vagrant/jenkins_unlock.sh
sudo /home/vagrant/jenkins_unlock.sh

echo "installing recommended plugins"
sudo chmod +x /home/vagrant/jenkins_plugins.sh
sudo /home/vagrant/jenkins_plugins.sh

echo "confirming url"
sudo chmod +x /home/vagrant/jenkins_confirm_url.sh
sudo /home/vagrant/jenkins_confirm_url.sh