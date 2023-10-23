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
end
#commnet