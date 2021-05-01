# Meine liebe dotfiles

## Installieren bitte
`git clone git://github.com/arnklint/dotfiles-2.git ~/.dotfiles && ~/.dotfiles/setup.sh`

## Update
`~/.dotfiles/update.sh`

## Check health of the setup
`:checkhealth`

## Utils
Good to have:

* `brew install coreutils`
* `brew install ripgrep` - needed for <leader>r to search
* [Fish shell](https://fishshell.com/)
* [Exa](https://the.exa.website/) - `ls` replacement
* [peco](https://github.com/peco/peco) - Interactive filtering

## Good to know

### VIM

* `<mapleader>` is `,`
* Search is done with RipGrep: <mapleader>r -> `,r phrase`

## Tips and trix

* Open shell inside vim: `:term` (this is set to open fish shell, see nvim config)
* Search and replace (more interactive in nvim): `:s%/install/uninstall/g` - you'll see it live
* Change theme; edit .config/nvim/init.vim to use another color runtime
* Check if anything is wrong with the nvim installation: `:CheckHealth`
