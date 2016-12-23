#!/usr/bin/env bash

#Node.js
curl -sL https://deb.nodesource.com/setup_6.x | -E bash -

#MongoDb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

#RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable

#KurentMediaServer
echo "deb http://ubuntu.kurento.org trusty kms6" | tee /etc/apt/sources.list.d/kurento.list
wget -O - http://ubuntu.kurento.org/kurento.gpg.key | apt-key add -


apt-get update
apt-get install -y nodejs mongodb-org git kurento-media-server-6.0 build-essential

#REST API
cd /vagrant
git clone git@github.com:SpredCo/rest-service.git
cd rest-service
npm install

#MediaServer
cd /vagrant
git clone https://github.com/guillaume-g/spred-media-server.git
cd spred-media-server
npm install

#WebApp
cd /vagrant
git clone git@github.com:SpredCo/web-app.git
cd web-app
rvm install ruby-2.3.1
cd ..; cd web-app
gem install bundler
bundle install
