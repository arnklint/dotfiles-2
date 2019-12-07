#!/bin/bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/aliases ~/.aliases
ln -sf ~/.dotfiles/zshrc ~/.zshrc

ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/gitmessage ~/.gitmessage

ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

source ~/.zshrc

vim +PluginInstall +qall
