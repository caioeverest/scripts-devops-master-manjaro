#!/bin/bash

function skp {
    sed 's/\//\\\//g'
}

function editor_linha {
    local OLD_LINE_PATTERN=$1; shift
    local NEW_LINE=$1; shift
    local FILE=$1

    local NEW=$(echo "${NEW_LINE}" | skp)
    sed -i .bak '/'"${OLD_LINE_PATTERN}"'/s/.*/'"${NEW}"'/' "${FILE}"
    mv "${FILE}.bak" /tmp/
}

echo "#########################################################"
echo "###     Instalando Aplicacoes de ambiente basicas     ###"
echo "#########################################################"

#Git
echo -e "\n\n-----------------------------Instalando Git"
sudo pacman -S git --noconfirm
echo -e "-----------------------------Configurando Git"
echo "Informe seu nome: "
read GITNAME
echo "Informe seu email: "
read GITMAIL
git config --global user.name $GITNAME
git config --global user.email $GITMAIL

#Vim
echo -e "\n\n-----------------------------Instalando Vim"
sudo pacman -S vim --noconfirm
v
#XClip
echo -e "\n\n-----------------------------Instalando XClip"
sudo pacman -S xclip --noconfirm

#ASDF
echo -e "\n\n-----------------------------Instalando Asdf"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.0
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.profile
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
source ~/.profile
exec $SHELL

#Fonts para agnoster
echo -e "\n\n-----------------------------Baixando Fontes para terminal"
git clone https://github.com/powerline/fonts.git
cd fonts
echo -e "\n\n-----------------------------Instalando Fontes para terminal"
sh install.sh
echo -e "\n\n-----------------------------Removendo temporarios..."
cd ..
sudo rm -r fonts
