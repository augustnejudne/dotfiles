# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/august/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="typewritten"
TYPEWRITTEN_CURSOR="block"

TYPEWRITTEN_PROMPT_LAYOUT="custom1"
# TYPEWRITTEN_PROMPT_LAYOUT="singleline"
# TYPEWRITTEN_PROMPT_LAYOUT="multiline"
# TYPEWRITTEN_PROMPT_LAYOUT="singleline_verbose"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /home/august/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh


#=============================================
#=============================================
# MINE
#=============================================
#=============================================

add-pwd-to-bashrc () {
  echo "alias $1='cd $(pwd); clear;'" >> ~/.zshrc;
  source ~/.zshrc;
}

mkcd() {
	mkdir $1;
	cd $1;
}

# QOL
alias la='ls -A'
alias rm='rm -i'
alias mv='mv -i'


# configs
alias bashrc='vim ~/.bashrc; source ~/.bashrc'
alias rc='vim ~/.zshrc; source ~/.zshrc'
alias i3conf='vim ~/.config/i3/config'
alias vimrc='vim ~/.vimrc'
alias polybarrc="vim /home/august/.config/polybar/config && source /home/august/.config/polybar/config"

# sudo commands
alias sa='sudo apt'
alias sai='sudo apt install'
alias sar='sudo apt remove'
alias update='sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y'

# tutorial directories
alias andrew-node='clear; cd /home/august/Documents/learn/udemy/node-js/andrew-mead-the-complete-node-js-developer/'
alias max-pwa='clear; cd /home/august/Documents/learn/udemy/max/PWA'

# dev stuff
alias dev='gatsby develop';
alias rebase='git pull origin development --rebase'
alias standardlint='npm run standard-lint'

# directory shortcuts
alias april='cd /home/august/Documents/personal/journal/2020/04-Apr; clear;'
alias dotfiles='cd /home/august/Documents/code/dotfiles; clear;'
alias wf-homes='cd /home/august/Documents/code/portfolio-projects/wf-homes; clear;'
alias projects='cd /home/august/Documents/code/portfolio-projects; clear;'
alias smart='+639392609622'
alias jjpin='523366'
alias sally-next='cd /home/august/Documents/code/sally/sally-fe-next-js; clear;'
alias portfolio='cd /home/august/Documents/code/portfolio-projects/portfolio-2020/portfolio; clear;'
alias quiz-maker='cd /home/august/Documents/code/portfolio-projects/quiz-maker; clear;'
alias alayon-fe='cd /home/august/Documents/code/alayon/alayon-fe; clear;'
alias compton-conf="vim /home/august/Documents/code/dotfiles/compton.conf"
alias reviewlyft='cd /home/august/Documents/code/reviewlyft; clear;'
alias lyft-fe='cd /home/august/Documents/code/reviewlyft/reviewlyft-v2-frontend; clear;'
alias dc='docker-compose'
alias timecamp='/usr/share/timecamp/timecamp'

# This shows up every time I open up the terminal
# if command -v fortune &> /dev/null && command -v lolcat &> /dev/null && command -v cowsay &> /dev/null
# then
#   fortune | cowsay -f tux | lolcat
# fi

figlet -f 3d.flf "August Nejudne" | lolcat
# fortune softwareengineering | lolcat

# ======================================
# REVIEW LYFT RELATED
# ======================================
AWS_ACCESS_KEY_ID="AKIAXUDO76LAV5P5B3VD"
AWS_SECRET_ACCESS_KEY="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"
CLOUDFRONT_DISTRIBUTION="EGRQJOCIW3WIY"

# ======================================
# asdf
# ======================================
. $HOME/.asdf/asdf.sh

alias may='cd /home/august/Documents/personal/journal/2020/05-May; clear;'



alias lyft-api='cd /home/august/Documents/code/reviewlyft/reviewlyft-v2-api; clear;'
alias june='cd /home/august/Documents/personal/journal/2020/01-Jun; clear;'
alias july='cd /home/august/Documents/personal/journal/2020/july; clear;'



## for reviewlift
export GATSBY_DEPLOYMENT_ENV='local'
alias august='cd /home/august/Documents/personal/journal/2020/08-Aug; clear;'
