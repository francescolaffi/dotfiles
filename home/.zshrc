# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerline"
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_CURRENT_PATH="%~"
POWERLINE_SHOW_GIT_ON_RIGHT="true"
POWERLINE_DATE_FORMAT=%D{%Y-%m-%d}
POWERLINE_RIGHT_A="$POWERLINE_DATE_FORMAT %f%F{235}"$'\ue0b2'"%f%k%K{234} "%(?.%F{green}✔.%F{red}✘)
POWERLINE_NO_BLANK_LINE=true
#DEFAULT_USER="francesco"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# DONT use rbenv, it breaks the $PATH
plugins=(git osx history-substring-search brew composer vagrant symfony2 battery)

source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"

# git alias hub
if which hub > /dev/null; then eval "$(hub alias -s)"; fi