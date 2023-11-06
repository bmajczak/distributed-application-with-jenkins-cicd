Vagrant.configure("2") do |config|
    config.hostmanager.enabled = true 
    config.hostmanager.manage_host = true

    config.vm.define "db01" do |db01|
        db01.vm.box = "eurolinux-vagrant/centos-stream-9"
        db01.vm.hostname = "db01"
        db01.vm.network "private_network", ip: "192.168.56.11"
        db01.vm.provider "virtualbox" do |vb|
            vb.memory = "600"
        end
        db01.vm.provision "shell", path: "db_setup.sh"
    end
    config.vm.define "app01" do |app01|
        app01.vm.box = "eurolinux-vagrant/centos-stream-9"
        app01.vm.hostname = "app01"
        app01.vm.network "private_network", ip: "192.168.56.12"
        app01.vm.provider "virtualbox" do |vb|
            vb.memory = "800"
        end
        app01.vm.provision "shell", path: "app_setup.sh"
    end
    config.vm.define "app02" do |app02|
        app02.vm.box = "eurolinux-vagrant/centos-stream-9"
        app02.vm.hostname = "app02"
        app02.vm.network "private_network", ip: "192.168.56.13"
        app02.vm.provider "virtualbox" do |vb|
            vb.memory = "800"
        end
        app02.vm.provision "shell", path: "app_setup.sh"
    end
    config.vm.define "web01" do |web01|
        web01.vm.box = "ubuntu/jammy64"
        web01.vm.hostname = "web01"
        web01.vm.network "private_network", ip: "192.168.56.14"
        web01.vm.provider "virtualbox" do |vb|
            vb.memory = "800"
        end
        web01.vm.provision "shell", path: "nginx_setup.sh"
    end
    config.vm.define "jenkins" do |jenkins|
        jenkins.vm.box = "eurolinux-vagrant/centos-stream-9"
        jenkins.vm.hostname = "jenkins"
        jenkins.vm.network "private_network", ip: "192.168.56.15"
        jenkins.vm.network "public_network", ip: "192.168.0.17"
        jenkins.vm.network "forwarded_port", guest: 8080, host: 1234


        jenkins.vm.provider "virtualbox" do |vb|
            vb.memory = "512"
        end
        jenkins.vm.provision "file" do |file|
            file.source = "./jenkins_unlock.sh"
            file.destination = "jenkins_unlock.sh"
        end
        jenkins.vm.provision "file" do |file|
            file.source = "./jenkins_confirm_url.sh"
            file.destination = "jenkins_confirm_url.sh"
        end
        jenkins.vm.provision "file" do |file|
            file.source = "./jenkins_plugins.sh"
            file.destination = "jenkins_plugins.sh"
        end
        
        jenkins.vm.provision "shell" do |shell|
            shell.path = "jenkins_setup.sh"
        end
        
    end
end
