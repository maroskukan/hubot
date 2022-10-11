# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2004"
  config.vm.hostname = "hubot-dev"
  config.vm.provision "shell", path: "provision.sh"

  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: [".git/", "mkhubot/node_modules/"]
end
