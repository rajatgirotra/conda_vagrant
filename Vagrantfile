Vagrant.configure(2) do |config|

  config.vm.provision "shell", inline: "echo Starting Provisioning"
  #config.vm.define "ubuntu" do |ubuntu|
  #  ubuntu.vm.box = "ubuntu/trusty64"
  #  ubuntu.vm.provision "shell", path: "ubuntu_provision.sh"
  #  ubuntu.vm.provider "virtualbox" do |vb|
  #    vb.memory = 4096
  #    vb.cpus = 1
  #  end
  #end

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/xenial64"
    ubuntu.vm.provision "shell", path: "ubuntu_provision.sh"
    ubuntu.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 1
    end
  end

  #config.vm.define "centos" do |centos|
  #  centos.vm.box = "boxcutter/centos72"
  #  centos.vm.provision "shell", path: "centos_provision.sh"
  #  centos.vm.network :forwarded_port, guest: 80, host: 23456
  #  centos.vm.provider "virtualbox" do |vb|
  #    vb.memory = 4096
  #    vb.cpus = 1
  #  end
  #end

end
