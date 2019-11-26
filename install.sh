#!/bin/bash
echo "Install Docker"

echo '123456' | sudo -S apt-get install -y \
    git \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"

sudo apt-get update

sudo apt-get install docker-ce

sudo apt-get install docker-compose

echo "Install AutoRS"

sudo git clone https://github.com/a2008301610258/AutoRS_Docker.git

sudo git checkout -b csg_v1 
