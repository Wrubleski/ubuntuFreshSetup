#!/bin/bash

## Remove eventuais travas do apt ##
sudo rm /var//lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock;

## Cria minha pastinha padrão de projects ##
mkdir ~/Projects;

## Instala restricted extras ##
sudo apt install ubuntu-restricted-extras -y;

## Instala alguns pacotes essenciais ##
sudo apt install build-essential default-jdk exuberant-ctags ncurses-term ack-grep silversearcher-ag fontconfig imagemagick libmagickwand-dev software-properties-common git vim-gtk3 -y;

## Instala o Sublime 3 ##
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -;
sudo apt-get install apt-transport-https -y;
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list;
sudo apt-get update -y;
sudo apt-get install sublime-text -y;

## Instala o asdf para controle de versões e aproveita e instala o nodejs (13.6.0) e o python (3.8.1) ##
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6;

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc;
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc;
source ~/.bashrc;
sudo apt install automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev unzip curl -y;

asdf update;
asdf plugin-add python;
asdf install python 3.8.1;
asdf global python 3.8.1;

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git;
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring;

asdf install nodejs 13.6.0;
asdf global nodejs 13.6.0;
sudo apt install npm -y;

## Instala o vlc ##
sudo snap install vlc;

## Inslata o chrome ##
sudo apt install google-chrome-stable -y;

## Instala o Transmission para download de torrents ##
sudo add-apt-repository ppa:transmissionbt/ppa -y;
sudo apt-get update;
sudo apt-get install transmission-gtk transmission-cli transmission-common transmission-daemon -y;


## Muda pro meu padrão no terminal ##
echo "PS1='\[\033[01;32m\]\[\033[0m\033[0;32m\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$(__git_ps1)$ '" >> ~/.bashrc;

sudo apt update -y;
sudo apt upgrade -y;
sudo apt autoremove -y;

printf "\n\nTerminado\n\n"