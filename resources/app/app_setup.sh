TOMURL="https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz"
dnf -y install java-11-openjdk java-11-openjdk-devel
dnf install git maven wget -y
git clone https://github.com/MariaDB/mariadb-connector-j.git
cd /tmp/
wget $TOMURL -O tomcatbin.tar.gz
EXTOUT=`tar xzvf tomcatbin.tar.gz`
TOMDIR=`echo $EXTOUT | cut -d '/' -f1`
useradd --shell /sbin/nologin tomcat
rsync -avzh /tmp/$TOMDIR/ /usr/local/tomcat/
chown -R tomcat.tomcat /usr/local/tomcat

rm -rf /etc/systemd/system/tomcat.service

cat <<EOT>> /etc/systemd/system/tomcat.service
[Unit]
Description=Tomcat
After=network.target

[Service]

User=tomcat
Group=tomcat

WorkingDirectory=/usr/local/tomcat


Environment=JAVA_HOME=/usr/lib/jvm/jre

Environment=CATALINA_PID=/var/tomcat/%i/run/tomcat.pid
Environment=CATALINA_HOME=/usr/local/tomcat
Environment=CATALINE_BASE=/usr/local/tomcat

ExecStart=/usr/local/tomcat/bin/catalina.sh run
ExecStop=/usr/local/tomcat/bin/shutdown.sh


RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target

EOT

systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat

systemctl stop tomcat
sleep 20
rm -rf /usr/local/tomcat/webapps/ROOT*

WEB_PATH='/tmp/strona'
mkdir "$WEB_PATH"

echo "downloading web app"
sudo git clone https://github.com/bmajczak/java-demo-webapp.git $WEB_PATH

cd $WEB_PATH
cd $WEB_PATH/mywebapp
sudo mvn clean package
cp target/*.war /usr/local/tomcat/webapps/
systemctl start tomcat

cat /home/vagrant/.ssh/app01.pub >> /home/vagrant/.ssh/authorized_keys