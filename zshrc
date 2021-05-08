# Use NVIM
export EDITOR='nvim'
export HISTFILESIZE=5500

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Aliases
if [ -f ~/.aliases.local ]; then
  source ~/.aliases.local
fi
# Aliases included in this repo
source ~/.aliases

# Commands
if [ -f ~/.commands.local ]; then
  source ~/.commands.local
fi
# Commands included
source ~/.dotfiles/commands

# for tmux and vim colors
export TERM=screen-256color

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Branch name in zsh prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
setopt PROMPT_SUBST
PROMPT='%9c%{%F{green}%}$(parse_git_branch)%{%F{none}%} $ '
