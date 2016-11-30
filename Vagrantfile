
Vagrant.configure("2") do |config|
  config.vm.box = "centos/6"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end

  config.vm.define "web1" do |box|
    box.vm.network "private_network", ip: "10.78.212.10"
  end
  config.vm.define "web2" do |box|
    box.vm.network "private_network", ip: "10.78.212.11"
  end
  config.vm.define "db1" do |box|
    box.vm.network "private_network", ip: "10.78.212.20"
  end
  config.vm.define "lb" do |box|
    box.vm.network "private_network", ip: "10.78.212.30"
  end
  config.vm.define "nagios" do |box|
    box.vm.network "private_network", ip: "10.78.212.40"
  end
end
