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
if [[ $- == *i* ]]; then
    export PS1="\[\033[38;5;10m\][\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;165m\]\W\[$(tput sgr0)\]\[\033[38;5;10m\]]\[$(tput sgr0)\]\[\033[38;5;165m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
fi

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

# export PYTHONPATH=$PYTHONPATH:"/home/lucas/libraries"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
