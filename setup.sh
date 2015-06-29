#!/bin/bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -s ~/.dotfiles/vimrc ~/.vimrc
#ln -s ~/.dotfiles/gvimrc ~/.gvimrc

ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

vim +PluginInstall +qall
