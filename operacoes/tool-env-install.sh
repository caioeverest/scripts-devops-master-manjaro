#!/bin/bash

echo "#####################################"
echo "###     Instalando Ferramentas    ###"
echo "#####################################"

#Terminator
echo -e "\n\n-----------------------------Instalando Terminator"
sudo pacman -S terminator --noconfirm

#Gedit
echo -e "\n\n-----------------------------Instalando Gedit"
sudo pacman -S gedit --noconfirm

#Aria2
echo -e "\n\n-----------------------------Instalando Aria2"
sudo pacman -S aria2 --noconfirm

#Conky
echo -e "\n\n-----------------------------Instalando Conky"
sudo pacman -S conky --noconfirm

#Atom
echo -e "\n\n-----------------------------Instalando Atom"
sudo pacman -S atom --noconfirm

#Libre office
echo -e "\n\n-----------------------------Instalando Libre Office"
sudo pacman -S libreoffice --noconfirm

#Jetbrains Toolbox
echo -e "\n\n-----------------------------Instalando Toolbox da Jetbrains"
yaourt -S jetbrains-toolbox --noconfirm

#Mailspring
echo -e "\n\n-----------------------------Instalando Mailspring"
yaourt -S mailspring --noconfirm

#Spotify
echo -e "\n\n-----------------------------Instalando Spotify"
yaourt -S spotify --noconfirm

#Google Chrome
echo -e "\n\n-----------------------------Instalando Google Chrome"
yaourt -S google-chrome --noconfirm

#Postman
echo -e "\n\n-----------------------------Instalando Postman"
wget -q https://dl.pstmn.io/download/latest/linux?arch=64 -O postman.tar.gz
tar -xzf postman.tar.gz
rm postman.tar.gz
#Instalando em opt
if [ -d "/opt/Postman" ];then
    sudo rm -rf /opt/Postman
fi
sudo mv Postman /opt/Postman
#Criando link simbolico
if [ -L "/usr/bin/postman" ];then
    sudo rm -f /usr/bin/postman
fi
sudo ln -s /opt/Postman/Postman /usr/bin/postman
#Criando atalho
sudo su
echo -e '[Desktop Entry]\nEncoding=UTF-8\nName=Postman\nExec=postman\nIcon=/opt/Postman/app/resources/app/assets/icon.png\nTerminal=false\nType=Application\nCategories=Development;' >> /usr/share/applications/Postman.desktop
exit

#GitKraken
echo -e "\n\n-----------------------------Instalando GitKraken"
yaourt -S gitkraken --noconfirm

#Discord
echo -e "\n\n-----------------------------Instalando Discord"
yaourt -S discord --noconfirm
#gpg --recv-keys $CHAVE && yaourt -S discord --noconfirm

#Zsh
echo -e "\n\n-----------------------------Instalando Zsh"
sudo pacman -S zsh --noconfirm
echo -e "\n\n-----------------------------Instalando tema para zsh(agnoster)"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo -e "\n\n-----------------------------Configurando..."
editor_linha "ZSH_THEME=\"robbyrussell\"" "ZSH_THEME=\"agnoster\"" ~/.zshrc
echo -e '\nsource ~/.profile' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
