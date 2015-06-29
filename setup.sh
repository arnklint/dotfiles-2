#!/bin/bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/aliases ~/.aliases
ln -sf ~/.dotfiles/bash_profile ~/.bash_profile

ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

source ~/.bash_profile

vim +PluginInstall +qall
