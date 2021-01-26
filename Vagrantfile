Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2004"
  config.vm.hostname = "hubot-dev"
  config.vm.provision "shell", path: "provision.sh"
  
  config.vm.synced_folder "./", "/vagrant", disabled: true
  config.vm.synced_folder "myhubot", "/vagrant/myhubot"

end
