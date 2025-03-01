Vagrant.configure("2") do |config|
    config.hostmanager.enabled = true 
    config.hostmanager.manage_host = true
    config.vm.boot_timeout = 600

    config.vm.define "db01" do |db01|
        db01.vm.box = "ubuntu/focal64"
        db01.vm.hostname = "db01"
        db01.vm.network "private_network", ip: "192.168.56.11"
        db01.vm.provider "virtualbox" do |vb|
            vb.memory = "2000"
            vb.gui = false
        end
        
        db01.vm.provision "file" do |file|
            file.source = "resources/db/setup.sql"
            file.destination = "setup.sql"
        end
        db01.vm.provision "shell", path: "resources/db/db_setup.sh"

    end
    config.vm.define "app01" do |app01|
        app01.vm.box = "ubuntu/jammy64"
        app01.vm.hostname = "app01"
        app01.vm.network "private_network", ip: "192.168.56.12"
        app01.vm.provider "virtualbox" do |vb|
            vb.memory = "800"
        end
        app01.vm.provision "file" do |file|
            file.source = "resources/app/app01.pub"
            file.destination = "/home/vagrant/.ssh/app01.pub"
        end
        app01.vm.provision "file" do |file|
            file.source = "resources/app/default"
            file.destination = "/tmp/default"
        end
        app01.vm.provision "file" do |file|
            file.source = "resources/app/webapp.service"
            file.destination = "/tmp/webapp.service"
        end
        app01.vm.provision "shell", path: "resources/app/app_setup.sh"
        
    end
    config.vm.define "app02" do |app02|
        app02.vm.box = "ubuntu/jammy64"
        app02.vm.hostname = "app02"
        app02.vm.network "private_network", ip: "192.168.56.13"
        app02.vm.provider "virtualbox" do |vb|
            vb.memory = "800"
        end
        app02.vm.provision "file" do |file|
            file.source = "resources/app/app02.pub"
            file.destination = "/home/vagrant/.ssh/app02.pub"
        end
        app02.vm.provision "file" do |file|
            file.source = "resources/app/default"
            file.destination = "/tmp/default"
        end
        app02.vm.provision "file" do |file|
            file.source = "resources/app/webapp.service"
            file.destination = "/tmp/webapp.service"
        end
        app02.vm.provision "shell", path: "resources/app/app_setup.sh"
        
    end
    config.vm.define "web01" do |web01|
        web01.vm.box = "ubuntu/jammy64"
        web01.vm.hostname = "web01"
        web01.vm.network "private_network", ip: "192.168.56.14"
        web01.vm.provider "virtualbox" do |vb|
            vb.memory = "800"
        end
        web01.vm.provision "file" do |file|
            file.source = "resources/web/server.config"
            file.destination = "/tmp/default"
        end
        web01.vm.provision "shell", path: "resources/web/nginx_setup.sh"

    end
    config.vm.define "jenkins" do |jenkins|
        jenkins.vm.box = "eurolinux-vagrant/centos-stream-9"
        jenkins.vm.hostname = "jenkins"
        jenkins.vm.network "private_network", ip: "192.168.56.15"
        jenkins.vm.network "forwarded_port", guest: 8080, host: 1234
        jenkins.vm.provider "virtualbox" do |vb|
            vb.memory = "1024"
        end


        jenkins.vm.provision "file" do |file|
            file.source = "resources/jenkins/jenkins_unlock.sh"
            file.destination = "/tmp/jenkins_unlock.sh"
        end
        jenkins.vm.provision "file" do |file|
            file.source = "resources/jenkins/jenkins_confirm_url.sh"
            file.destination = "/tmp/jenkins_confirm_url.sh"
        end
        jenkins.vm.provision "file" do |file|
            file.source = "resources/jenkins/jenkins_plugins.sh"
            file.destination = "/tmp/jenkins_plugins.sh"
        end
        jenkins.vm.provision "file" do |file|
            file.source = "resources/jenkins/config.xml"
            file.destination = "/tmp/config.xml"
        end
        jenkins.vm.provision "file" do |file|
            file.source = "resources/jenkins/app01_creds.xml"
            file.destination = "/tmp/app01_creds.xml"
        end
        jenkins.vm.provision "file" do |file|
            file.source = "resources/jenkins/app02_creds.xml"
            file.destination = "/tmp/app02_creds.xml"
        end
        jenkins.vm.provision "file" do |file|
            file.source = "resources/jenkins/app01"
            file.destination = "/home/vagrant/.ssh/app01"
        end
        jenkins.vm.provision "file" do |file|
            file.source = "resources/jenkins/app02"
            file.destination = "/home/vagrant/.ssh/app02"
        end
       
        jenkins.vm.provision "shell", path: "resources/jenkins/jenkins_setup.sh"
        
    end
end
