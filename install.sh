#!/bin/bash

#sudo apt-get update

./install-misc.sh
./install-i3.sh
./install-git.sh
./install-vim.sh

ln -s dotfiles/.bashrc ~/.bashrc
source ~/.bashrc
