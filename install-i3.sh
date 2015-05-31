#!/bin/bash

echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" | sudo tee --append /etc/apt/sources.list
sudo apt-get update
sudo apt-get --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get install i3 pavucontrol imagemagic xautolock

rm ~/.i3 -r
ln -s dotfiles/.i3 ~/.i3

rm ~/.i3status.conf
ln -s ~/.i3/.i3status.conf ~/.i3status.conf
