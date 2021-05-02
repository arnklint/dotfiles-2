#!/bin/bash

# Install dein, a neovim plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

ln -sf ~/.dotfiles/.config/* ~/.config/

ln -sf ~/.dotfiles/aliases ~/.aliases
ln -sf ~/.dotfiles/zshrc ~/.zshrc

ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/gitmessage ~/.gitmessage

ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

# Install powerline patched fonts
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

# Install fish, ripgrep
brew install fish ripgrep fzf cmatrix

source ~/.zshrc
