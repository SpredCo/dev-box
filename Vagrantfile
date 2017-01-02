required = ["vagrant-hostmanager"]

restart = false
for req in required
    unless Vagrant.has_plugin?(req)
      system("vagrant plugin install #{req}")
      puts "Dependencies #{req} installed."
      restart = true
    end
end

if restart then
    puts "Dependencies installed, please relaunch vagrant up."
    exit
end


Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.define 'default' do |node|
      node.vm.hostname = 'spredbox'
      node.vm.network "private_network", type: "dhcp"

      node.vm.network "forwarded_port", guest: 8888, host: 8888 #KurentoMediaServer
      node.vm.network "forwarded_port", guest: 3000, host: 3000 #Rest API
      node.vm.network "forwarded_port", guest: 3030, host: 3030 #MediaService
      node.vm.network "forwarded_port", guest: 8080, host: 9080 #WebApp
      node.vm.network "forwarded_port", guest: 8081, host: 8081 #Blog
      node.vm.network "forwarded_port", guest: 22, host: 8022 #SSH


      node.hostmanager.aliases = %w(spred.tv api.spred.tv login.spred.tv dev.spred.tv media.spred.tv)
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end
end
