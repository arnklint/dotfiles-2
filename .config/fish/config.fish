set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

# NAVIGATION
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias f="rg --files --hidden --follow --no-ignore-vcs -g '!{node_modules,.git}' | fzf"

# GIT
alias gs="git status"
alias gb="git branch"
alias gd="git diff"
alias gc="git commit -v"
alias gp="git push"
alias gco="git checkout"
alias ga="git add"
alias gg="git grep"
alias gt="git tag"
alias gpd="git pull --rebase"
alias gl="git log -n 30 --oneline --graph"

# View HTTP traffic
# alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
# alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# Docker related
alias dm="docker-machine"
alias d="docker"
alias dc="docker-compose"

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

switch (uname)
  case Darwin
    # source ~/.config/fish/config.fish
    # source ~/.dotfiles/aliases
    # source (dirname (status --current-filename))/config-osx.fish
  case Linux
    # Do nothing
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
