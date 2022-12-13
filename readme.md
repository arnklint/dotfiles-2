# Meine liebe dotfiles

Open nvim and run: 

`:PackerInstall` - which will install all the nvim/vim plugins

## Installieren bitte

`git clone git://github.com/arnklint/dotfiles-2.git ~/.dotfiles && ~/.dotfiles/setup.sh`

## Update

`~/.dotfiles/update.sh`
`nvim .` and then `:call dein#update()`

## Check health of the setup

`:checkhealth`

## Good to know

### VIM

- `<mapleader>` is `,`
- Search is done with RipGrep: <mapleader>r -> `,r phrase`
- Go back to previous location: `CTRL+O`

## Tips and trix

- Open shell inside vim: `:term` (this is set to open fish shell, see nvim config)
- Search and replace (more interactive in nvim): `:s%/install/uninstall/g` - you'll see it live
