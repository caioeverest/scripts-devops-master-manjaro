#!/bin/bash

echo "#######################################"
echo "###     INICIANDO TERRAFORMACAO     ###"
echo "#######################################"

echo -e "\n\n-----------------------------Iniciando instalaçoes"
echo -e "\n\n-----------------------------Ajustando permissoes de scripts"
sudo chmod -R +x operacoes/
#find /operacoes -type f -exec chmod +x {} \;

echo -e "\n\n-----------------------------Atualizando systema"
sudo pacman -Syu --noconfirm
sudo aptitude update --noconfirm

echo -e "\n\n-----------------------------Instalando AUR"
sudo pacman -Syu yaourt --noconfirm
sudo pacman -Su --noconfirm
yaourt -S pamac-aur --noconfirm
sudo pacman -S base-devel --noconfirm

echo "###########################"
echo "###  Aplicando scripts  ###"
echo "###########################"

sh operacoes/basic-env-install.sh
sh operacoes/dev-env-install.sh
sh operacoes/tool-env-install.sh
#sh operacoes/util-env-install.sh

echo ""
echo "#####################"
echo "###  Finalizando  ###"
echo "#####################"
echo ""
echo "O sistema precisa ser reiniciado..."
echo "Reiniciar maquina agora? (S/n): "
read SURE
if [ $SURE -eq "s" -o $SURE -eq "S" ]; then
	echo -e "\n\nReiniciando..................."
	sudo shutdown -r 0
else
		echo -e "\n\nOk! Mas reinicia esse troço logo.."
fi
