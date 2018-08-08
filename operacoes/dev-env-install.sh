#!/bin/bash

echo "###########################################"
echo "###     Instalando Aplicacoes de Dev    ###"
echo "###########################################"

#Ansible
echo -e "\n\n-----------------------------Instalando Ansible"
sudo pacman -S ansible --noconfirm

#Openssh
echo -e "\n\n-----------------------------Instalando Openssh"
sudo pacman -S openssh --noconfirm
sudo systemctl enable sshd
sudo systemctl start sshd

#Go
echo -e "\n\n-----------------------------Instalando Go"
sudo pacman -S go --noconfirm
echo -e "-----------------------------Configurando GOPATH"
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
mkdir -p $HOME/go_projects/{src,pkg,bin}
echo "export GOPATH=\"\$HOME/go_projects\"" >> ~/.profile
echo "export GOBIN=\"\$GOPATH/bin\"" >> ~/.profile
#echo "fs.file-max = 65536" >> ~/.profile

#NodeJS
echo -e "\n\n-----------------------------Instalando Node e NPM"
sudo pacman -S nodejs npm --noconfirm

#Python
echo -e "\n\n-----------------------------Instalando Python 3"
sudo pacman -S python --noconfirm
echo -e "-----------------------------Instalando Pip"
sudo pacman -S python-pip --noconfirm

#Java
echo -e "\n\n-----------------------------Instalando Java"
sudo pacman -S jdk8-openjdk --noconfirm
sudo pacman -S jre8-openjdk --noconfirm

#Docker
echo -e "\n\n-----------------------------Instalando Docker"
sudo pacman -S docker --noconfirm
echo -e "\n\n-----------------------------Iniciando sevico Docker"
sudo systemctl enable docker
sudo systemctl start docker
echo -e "\n\n-----------------------------Configurando Docker"
echo -e "-----------------------------Instalando pacotes Docker"
sudo pacman -S python-setuptools --noconfirm
echo -e "-----------------------------Instalando docker-compose Docker"
sudo pip install docker-compose --upgrade
echo -e "-----------------------------Gerando link simbolico"
ln -s /usr/bin/docker-compose /usr/local/bin/docker-compose
echo -e "-----------------------------Adicionando usuario atual em grupo docker"
sudo usermod -aG docker $USER
echo -e "-----------------------------Reiniciando sevico Docker"
sudo systemctl restart docker
echo -e "-----------------------------Instalando ctop"
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop
