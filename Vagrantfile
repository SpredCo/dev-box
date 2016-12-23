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

      node.hostmanager.aliases = %w(spred.tv api.spred.tv login.spred.tv dev.spred.tv media.spred.tv)
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end
end
