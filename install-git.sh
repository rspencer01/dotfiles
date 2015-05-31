#!/bin/bash

sudo apt-get install git

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global user.email "robert.spencer94@gmail.com"
git config --global user.name "Robert Spencer"
git config --global push.default simple
