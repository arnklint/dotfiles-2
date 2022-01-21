#!/bin/bash

# Install dein, a neovim plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

mkdir -p ~/.config/nvim ~/.config/fish

ln -sf ~/.dotfiles/config/fish/* ~/.config/fish/
ln -sf ~/.dotfiles/config/nvim/* ~/.config/nvim/

ln -sf ~/.dotfiles/aliases ~/.aliases
ln -sf ~/.dotfiles/zshrc ~/.zshrc

ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/gitmessage ~/.gitmessage
ln -sf ~/.dotfiles/githooks ~/.githooks
chmod u+x ~/.githooks/commit-msg

ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

# VSCode
ln -sf ~/.dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Install powerline patched fonts
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

# Install ripgrep, fzf, cmatrix
brew install ripgrep fzf cmatrix

source ~/.zshrc
