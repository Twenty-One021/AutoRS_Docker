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

echo '123456' | sudo -S apt-get install -y \
     docker-ce

#sudo apt-get install docker-compose

echo "Install AutoRS"

git clone https://github.com/a2008301610258/AutoRS_Docker.git

cd ./AutoRS_Docker

git checkout -b csg remotes/origin/csg

mkdir /home/zhihui/AutoRS

cd ..

cp -r ./AutoRS_Docker/* /home/zhihui/AutoRS/

cd /home/zhihui/AutoRS

bash init.sh

echo "Install AutoRS Docker"

echo '123456' | sudo -S apt-get install -y \
      git

echo 'a2008301610258' | sudo docker login --username=wchxiong registry.cn-shenzhen.aliyuncs.com

sudo docker pull registry.cn-shenzhen.aliyuncs.com/autors/csg:v1

sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo chmod 777 /etc/rc.local

sudo echo -e "#!/bin/sh -e\n" > /etc/rc.local

sudo echo -e "/usr/local/bin/docker-compose -f /home/zhihui/AutoRS/docker-compose.yml up -d\n" >> /etc/rc.local

sudo echo -e "exit 0" >> /etc/rc.local
