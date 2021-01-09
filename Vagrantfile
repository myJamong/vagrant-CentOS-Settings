# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant_API_Version = "2"
Vagrant.configure(Vagrant_API_Version) do |config|
  #node01
  config.vm.define:"node01" do |cfg|
    config.vm.box = "centos/7"
    cfg.vbguest.auto_update = false
    cfg.vm.provider:virtualbox do |vb|
      vb.name="CentOS-node01"
      vb.customize ["modifyvm", :id, "--cpus",1]
      vb.customize ["modifyvm", :id, "--memory",1024]
    end
    cfg.vm.host_name="node01.puppet.test"
    cfg.vm.synced_folder ".", "/vagrant", disabled:true
    cfg.vm.network "public_network", ip: "210.90.141.101", bridge: "en4: Apple USB Ethernet"
    cfg.vm.network "forwarded_port", guest: 22, host:29211, auto_correct: false, id: "ssh"
    cfg.vm.provision "shell", path: "all_settings.sh"
  end

  #node02
  config.vm.define:"node02" do |cfg|
    config.vm.box = "centos/7"
    cfg.vbguest.auto_update = false
    cfg.vm.provider:virtualbox do |vb|
      vb.name="CentOS-node02"
      vb.customize ["modifyvm", :id, "--cpus",1]
      vb.customize ["modifyvm", :id, "--memory",1024]
    end
    cfg.vm.host_name="node02.puppet.test"
    cfg.vm.synced_folder ".", "/vagrant", disabled:true
    cfg.vm.network "public_network", ip: "210.90.141.102", bridge: "en4: Apple USB Ethernet"
    cfg.vm.network "forwarded_port", guest: 22, host:29212, auto_correct: false, id: "ssh"
    cfg.vm.provision "shell", path: "all_settings.sh"
  end

  #master
  config.vm.define:"master" do |cfg|
    config.vm.box = "centos/7"
    cfg.vbguest.auto_update = false
    cfg.vm.provider:virtualbox do |vb|
      vb.name="CentOS-master"
      vb.customize ["modifyvm", :id, "--cpus",2]
      vb.customize ["modifyvm", :id, "--memory",4096]
    end
    cfg.vm.host_name="master.puppet.test"
    cfg.vm.synced_folder ".", "/vagrant", disabled:true
    cfg.vm.network "public_network", ip: "210.90.141.100", bridge: "en4: Apple USB Ethernet"
    cfg.vm.network "forwarded_port", guest: 22, host:29210, auto_correct: false, id: "ssh"
    cfg.vm.provision "shell", path: "all_settings.sh"
    cfg.vm.provision "shell", path: "master_init.sh"
    cfg.vm.provision "shell", path: "nodes_ssh_key_settings.sh"
    cfg.vm.provision "file", source: "puppet_settings.yml", destination: "puppet_settings.yml"
    cfg.vm.provision "shell", inline: "ansible-playbook puppet_settings.yml"
  end
end
