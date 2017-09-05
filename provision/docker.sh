#!/bin/bash

# Vagrant Setup For Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  && sudo apt-get update \
  && sudo apt-get install -y docker-ce

echo "Docker should be here"
sudo usermod -aG docker vagrant

sudo curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose \
  && sudo chown vagrant:vagrant /usr/local/bin/docker-compose
