#!/bin/bash

apt-get -y update

dpkg -s npm &>/dev/null || {
  apt-get -y install nodejs npm
}

command -v yo &>/dev/null || {
  npm install -g yo generator-hubot
}

cp -R /vagrant/systemd/mkhubot.service /etc/systemd/system/mkhubot.service
