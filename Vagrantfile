# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.vm.define :server do |server|
    server.vm.hostname = "server"
    server.vm.box = "precise32"
    server.vm.network :private_network, ip: "192.168.33.10"
  end

  config.vm.define :client do |client|
    client.vm.hostname = "client"
    client.vm.box = "precise32"
    client.vm.network :private_network, ip: "192.168.33.11"
    client.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  end

  config.vm.define :client2 do |client|
    client.vm.hostname = "client2"
    client.vm.box = "precise32"
    client.vm.network :private_network, ip: "192.168.33.13"
    client.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--memory", "256"]
    end
  end

  config.vm.define :sensu_graphite do |graphite|
    graphite.vm.hostname = "sensu-graphite"
    graphite.vm.box = "opscode-ubuntu-12.04"
    graphite.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box"
    graphite.vm.network :private_network, ip: "192.168.33.12"
  end

end
