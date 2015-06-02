#!/bin/bash

# Exit if already bootstrapped
test -f /etc/bootstrapped && exit

apt-get update
apt-get upgrade -y
apt-get install zsh wgey screen -y
apt-get install vim git subversion -y
apt-get install build-essential -y
mkdir ~/GitHub
cd ~/GitHub
git clone https://github.com/creationix/nvm.git
git clone https://github.com/legokichi/.zsh.git
git clone https://github.com/legokichi/.vim.git
cd .zsh
source install.sh
cd ..
cd nvm
source install.sh
cd ..
nvm install v0
cd .vim
source install.sh
cd ..
chsh -s `which zsh`
cd
wget http://jp.softether-download.com/files/softether/v4.17-9562-beta-2015.05.30-tree/Linux/SoftEther_VPN_Client/64bit_-_Intel_x64_or_AMD64/softether-vpnclient-v4.17-9562-beta-2015.05.30-linux-x64-64bit.tar.gz
tar zxv softether-vpnclient-v4.17-9562-beta-2015.05.30-linux-x64-64bit.tar.gz
cd vpnclient
make

date > /etc/bootstrapped
