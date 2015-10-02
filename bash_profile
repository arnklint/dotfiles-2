# Use VIM
export EDITOR='vim'
export HISTFILESIZE=5500

if [ -f ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi

if [ -f ~/.aliases.local ]; then
  source ~/.aliases.local
fi

# Aliases (included in this repo)
source ~/.aliases

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add random emojis to impress SCRUM-masters
git_branch='`git rev-parse --abbrev-ref HEAD 2> /dev/null | sed s/^/\ \|\ /`'
emojis=(🐶 🐺 🐱 🐭 🐹 🐰 🐸 🐯 🐨 🐻 🐷 🐮 🐵 🐼 🐧 🐍 🐢 🐙 🐠 🐳 🐬 🐥)
emoji='`echo ${emojis[$RANDOM % 22]}`'
PS1="\[\033[0;36m\]\T | \W$git_branch | $emoji  > \[\e[0m\]"

# for tmux and vim colors
export TERM=screen-256color

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;
