#!/bin/bash

sudo sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo chown -R vagrant:vagrant ~/.oh-my-zsh

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

sed -i "s|robbyrussell|powerlevel9k/powerlevel9k|" ~/.zshrc
