# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#list directory files when changing directories
cd() {
	builtin cd "$@" && ls;
}
# Configure the prompt interface
export PS1="\[\033[38;5;10m\][\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;165m\]\W\[$(tput sgr0)\]\[\033[38;5;10m\]]\[$(tput sgr0)\]\[\033[38;5;165m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Aliases #############################

# Safety nets
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias cl='clear && ls'
alias la='ls -a'
alias ll='ls -l'

# Move up directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

#Shortcuts to rc files and directories
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias ~='cd ~'
