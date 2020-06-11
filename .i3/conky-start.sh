#!/usr/bin/env zsh

pkill conky
sleep 4;
conky -c ~/dotfiles/.conky/syclo-crimson-bottomleft.conkyrc
sleep 1;
conky -c ~/dotfiles/.conky/shailen.conf
