# Use VIM
export EDITOR='vim'
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

# Add random emojis to impress SCRUM-masters
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

emojis=(🐶 🐺 🐱 🐭 🐹 🐰 🐸 🐯 🐨 🐻 🐷 🐮 🐵 🐼 🐧 🐍 🐢 🐙 🐠 🐳 🐬 🐥)
emoji='`echo ${emojis[$RANDOM % 22]}`'
# PS1="\[\033[0;36m\]\W$git_branch | $emoji  >\[\e[0m\]"
# PS1="\[\033[0;36m\]\W$git_branch >\[\e[0m\]"

# Old with time
# PS1="\[\033[0;36m\]\T | \W$git_branch | $emoji  >\[\e[0m\]"

# for tmux and vim colors
export TERM=screen-256color

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;
