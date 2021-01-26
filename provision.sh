#!/bin/bash

apt-get -y update

dpkg -s npm &>/dev/null || {
  apt-get -y install nodejs npm
}

command -v hubot &>/dev/null || {
  npm install -g yo generator-hubot
}

