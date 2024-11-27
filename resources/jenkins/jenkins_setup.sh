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
sudo yum install dotnet-sdk-8.0 -y
sudo yum install dotnet-runtime-8.0 -y
sudo yum install aspnetcore-runtime-8.0 -y

sudo dotnet tool install --global dotnet-ef

## ssh
sudo chmod 600 /home/vagrant/.ssh/*

dos2unix /tmp/*.sh

echo "unlocking jenkins"
sudo chmod +x /tmp/jenkins_unlock.sh
sudo /tmp/jenkins_unlock.sh

echo "installing recommended plugins"
sudo chmod +x /tmp/jenkins_plugins.sh
sudo /tmp/jenkins_plugins.sh

echo "confirming url"
sudo chmod +x /tmp/jenkins_confirm_url.sh
sudo /tmp/jenkins_confirm_url.sh

USERNAME=admin
PASSWORD=admin




sudo java -jar jenkins-cli.jar -s http://localhost:8080/ -auth "$USERNAME:$PASSWORD" install-plugin ssh-agent
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth "$USERNAME:$PASSWORD" safe-restart



#time for jenkins to install plugins
sleep 150

java -jar jenkins-cli.jar -s http://localhost:8080/ -auth "$USERNAME:$PASSWORD" create-credentials-by-xml system::system::jenkins "(global)" < /tmp/app01_creds.xml
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth "$USERNAME:$PASSWORD" create-credentials-by-xml system::system::jenkins "(global)" < /tmp/app02_creds.xml


if sudo java -jar jenkins-cli.jar -s  http://localhost:8080 -auth "$USERNAME:$PASSWORD" create-job firstJob < /tmp/config.xml ; then
    echo "success"
else
    echo "command failed"
    sudo systemctl stop jenkins
    sudo systemctl start jenkins
    sudo java -jar jenkins-cli.jar -s  http://localhost:8080 -auth "$USERNAME:$PASSWORD" create-job firstJob < /tmp/config.xml
fi
sudo java -jar jenkins-cli.jar -s  http://localhost:8080 -auth "$USERNAME:$PASSWORD" build firstJob