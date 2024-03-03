#!/bin/bash
echo "updating"
sudo yum update -y

echo "installing jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-17-openjdk -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl enable jenkins --now
sudo wget http://localhost:8080/jnlpJars/jenkins-cli.jar

sudo yum install git -y

echo "unlocking jenkins"
sudo chmod +x /home/vagrant/jenkins_unlock.sh
sudo /home/vagrant/jenkins_unlock.sh

echo "installing recommended plugins"
sudo chmod +x /home/vagrant/jenkins_plugins.sh
sudo /home/vagrant/jenkins_plugins.sh

echo "confirming url"
sudo chmod +x /home/vagrant/jenkins_confirm_url.sh
sudo /home/vagrant/jenkins_confirm_url.sh

#time for jenkins to install plugins
sleep 150

if sudo java -jar jenkins-cli.jar -s  http://localhost:8080 -auth admin:admin create-job firstJob < config.xml ; then
    echo "success"
else
    echo "command failed"
    sudo systemctl stop jenkins
    sudo systemctl start jenkins
    sudo java -jar jenkins-cli.jar -s  http://localhost:8080 -auth admin:admin create-job firstJob < config.xml
fi
sudo java -jar jenkins-cli.jar -s  http://localhost:8080 -auth admin:admin build firstJob