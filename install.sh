#!/bin/bash

#sudo apt-get update

./install-i3.sh
./install-git.sh
./install-vim.sh

ln -s dotfiles/.bashrc ~/.bashrc
source ~/.bashrc
