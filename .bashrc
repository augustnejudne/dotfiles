# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;34m\] /\W\[\033[01;31m\] $(parse_git_branch)\[\033[00m\]\n\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

# if [ "$color_prompt" = yes ]; then
#     PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
# else
#     PS1='\n${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
# fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#=============================================
#=============================================
# ADDITIONS
#=============================================
#=============================================

# set -o vi
function mkcd() {
	mkdir $1;
	cd $1;
}


#=============================================
#=============================================
# CUSTOM FUNCTIONS
#=============================================
#=============================================

killPort () {
  sudo fuser -k -n tcp $1;
}

cloneFrontend () {
    echo 'removing acudeen-frontend directory';
    cd /home/august/Documents/acudeen/;
    rm -rf acudeen-frontend;
    echo 'cloning frontend repo';
    git clone git@bitbucket.org:acudeen-devs/acudeen-frontend.git;
    cd 'acudeen-frontend';
    rm package-lock.json yarn.lock;
    yarn install;
}

install () {
  sudo apt update;
  sudo apt install $1 -y;
}

remove () {
  sudo apt remove $1 -y;
  sudo apt purge $1* -y;
  sudo apt autoremove -y;
}

commit () {
  git add .;
  git commit -m "$1";
}

apt-search () {
  apt-cache search --names-only $1
}

add-pwd-to-bashrc () {
  echo "alias $1='cd $(pwd); clear;'" >> ~/.bashrc;
  source ~/.bashrc;
}

#========================================
# Load pyenv
#========================================
export PATH="/home/august/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#=============================================
#=============================================
# ALIASES
#=============================================
#=============================================
alias bashrc='vim ~/.bashrc; source ~/.bashrc'
alias i3conf='vim ~/.config/i3/config'
alias update='sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y'

# tutorial directories
alias andrew-node='clear; cd /home/august/Documents/learn/udemy/node-js/andrew-mead-the-complete-node-js-developer/'
alias max-pwa='clear; cd /home/august/Documents/learn/udemy/max/PWA'

# acudeen related
alias frontend='clear; cd /home/august/Documents/acudeen/acudeen-frontend/'
alias frontendrun='clear; cd /home/august/Documents/acudeen/acudeen-frontend/; subl .; smerge .; run'
alias api-gateway='clear; cd /home/august/Documents/acudeen/acudeen-api-gateway/'
alias coreui='clear; cd /home/august/Documents/acudeen/core-ui/'
alias rebase='git pull origin development --rebase'
alias stashrebase='git stash; git pull origin development --rebase; git stash pop'
alias standardlint='npm run standard-lint'
alias run='npm run run-all-linux'
alias vimrc='vim ~/.vimrc'
alias kill8080='sudo fuser -k -n tcp 8080'
alias kill8081='sudo fuser -k -n tcp 8081'
alias notes='cd /home/august/Documents/misc/notes'
alias acudeen7pw='!#@cud33n#!7main'
alias exam-maker='cd /home/august/Documents/papa-projects/exam-maker-app; clear;'
alias euler='cd /home/august/Documents/august/project-euler; clear;'
alias personal='cd /home/august/Documents/misc/notes/personal; clear;'
# alias dev='npm run dev'
alias task-manager='cd /home/august/Documents/august/udemy/node-js/andrew-mead-the-complete-node-js-developer/task-manager; clear;'
alias november='cd /home/august/Documents/misc/notes/personal/2019/11-Nov; clear;'
alias test-maker='cd /home/august/Documents/papa-projects/test-maker; clear;'
alias tmf='cd /home/august/Documents/papa-projects/test-maker/frontend; clear;'
alias tmb='cd /home/august/Documents/papa-projects/test-maker/backend; clear;'
alias december='cd /home/august/Documents/misc/notes/personal/2019/12-Dec; clear;'
alias january='cd /home/august/Documents/misc/notes/personal/2020/01-Jan; clear;'
alias ectropy='cd /home/august/Documents/ectropy/etl-fe; clear;'
alias aws-essentials='cd /home/august/Documents/misc/notes/courses/linux-academy/aws-essentials; clear;'
alias project-sally='cd /home/august/Documents/Sally/project-sally-frontend; clear;'
alias project-sally-notes='cd /home/august/Documents/misc/notes/project-sally; clear;'
alias february='cd /home/august/Documents/misc/notes/personal/2020/02-Feb; clear;'
alias march='cd /home/august/Documents/misc/notes/personal/2020/03-Mar; clear;'
alias dev='gatsby develop';
alias sally-next='cd /home/august/Documents/Sally/sally-fe-next-js; clear;'
alias portfolio='cd /home/august/Documents/portfolio2020; clear;'
alias burger-beer='cd /home/august/Documents/portfolio-projects/burger-beer; clear;'
alias quiz-maker='cd /home/august/Documents/portfolio-projects/quiz-maker; clear;'
alias april='cd /home/august/Documents/misc/notes/personal/2020/04-Apr; clear;'
alias bookstore='cd /home/august/Documents/portfolio-projects/bookstore; clear;'
source ~/.bash_completion/alacritty
