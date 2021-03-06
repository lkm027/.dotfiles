# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/lucas/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="cloud"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#list directory files when changing directories
cd() {
	builtin cd "$@" && ls;
}

# Safety nets
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias cl='clear && ls'
alias empty='clear'
alias la='ls -a'
alias ll='ls -l'

# Move up directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

#Shortcuts to rc files and directories
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias ~='cd ~'
alias v='cd /var/www/vhosts'

# Shortcut for opening error log (1 arg: error log name)
mtaile() {
   multitail -cS php "/var/log/httpd/$1-error_log";
}

# Shortcut for running eslint on all changed js files
lintjs() {
    git diff-index --name-only HEAD | grep -e \.js | paste -sd " " | xargs eslint -c /etc/profile.d/vimrc/plugins/syntastic_checkers/eslintrc.js
}

#updates .db and .customer files (credit to David Wright for inspiration)
#usage: cust {customer} {db version OR ticket (if a ticket DB exists)}
#if no second argument is supplied, uses customer named DB
cust() {
    first_char="$(echo $2 | head -c 1)"

    # versioned databases default to {customer}_XERP-{ticket #}
    if [[ $# == 1 ]]; then
        argument_version=$( printf "%s" $1 )
    elif [[ "$first_char" == "X" ]]; then
        argument_version=$( printf "%s" $1 "_" $2)
    else
        #gets version by year
        version=$(($(date +'%Y') - 2012))
        version=$((10#${version}))
        #parses release to two characters
        release=$(printf %02d $2)
        argument_version=$( printf "%s" $1 "_v" $version "." $release)
    fi

    current_customer=$1
    current_db="athena.internal\n5432\n$argument_version"

    #if db and customer files exist, write them
    if [ -f ./.customer ]; then
        printf "$current_customer" > ".customer"
    fi

    if [ -f ./.db ]; then
        printf "$current_db" > ".db"
    fi
}

# alias mtaile='multitail -CS php --mergeall /var/log/httpd/$1*-error_log'

# $1 File
# $2 Time in minutes
# Checks if a file's last access time was longer than a specified time
# Output: If a file is older than specified time
getAge()
{
    read IN
    print $IN
    print $1
    var=$(find $IN -atime $1);
    if [ $var ]; then
        echo "young"
    else
        echo "old"
    fi
}

# atime is access time and ctime is change time
# we want to focus on access time, but for now
# all we really can test with is change time
getAge2()
{
    while read IN; do
        var=$(find $IN -ctime $1);
        if [ $var ]; then
            echo $IN "is young"
            #command rm $IN
        else
            echo $IN "is old"
        fi
    done
}

# find . -regex '.*.pdf'
# Find all files ending in .pdf in the current directory
#
# find. -regex '\.\/\w*.pdf' | awk '{print $1}' | getAge -1
# export PYTHONPATH=$PYTHONPATH:"/home/lucas/libraries"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path additions for react native
export JAVA_HOME=$HOME/android-studio/jre
export PATH=$PATH:$JAVA_HOME/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# export NVM_DIR="/home/lucas/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
