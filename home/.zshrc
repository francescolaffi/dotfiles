ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"
# POWERLINE_HIDE_USER_NAME="true"
# POWERLINE_HIDE_HOST_NAME="true"
# POWERLINE_CURRENT_PATH="%1~"
# POWERLINE_DATE_FORMAT=%D{%Y-%m-%d}
# POWERLINE_RIGHT_A="$POWERLINE_DATE_FORMAT %f%F{234}"$'\ue0b2'"%f%k%K{234} "%(?.%F{green}✔.%F{red}✘)
# POWERLINE_NO_BLANK_LINE=true

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# oh-my-zsh plugins
# !!! DONT use rbenv, it breaks the $PATH (rbenv already loaded in .profile)
plugins=(git osx history-substring-search fasd brew gem composer vagrant symfony2)

source $ZSH/oh-my-zsh.sh

# override some oh-my-zsh aliases
alias la='ls -AF'
alias  l='ls -lAh'
alias ll='ls -lah'
alias ls='ls -G'

e() { subl "${1:-.}" }

pwcp() { echo $(echo -n $(pwgen -Bs ${1:-16}) | tee >(pbcopy)) copied to clipboard }

mac_reset () { sudo ifconfig en0 ether 98:fe:94:49:de:d6 }
mac_rand () { sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'` }

mac-spoof () {
  interface='en0'
  pattern='[0-9a-f]{2}(:[0-9a-f]{2}){5}'
  default=$(networksetup -getmacaddress $interface | grep -oE $pattern)
  case $1 in
    rand|"") # default if empty
      _mac=${default:0:8}$(openssl rand -hex 3 | sed 's/\(..\)/:\1/g')
      ;;
    reset)
      _mac=$default
      ;;
    *)
      _mac=$1
      ;;
  esac
  if ! mac=$(echo $_mac | grep -xE $pattern); then
    echo "invalid MAC address $_mac"
    exit 1
  fi
  echo "setting MAC address $mac on interface $interface"
  sudo ifconfig $interface ether $mac 
}

alias sourcetree='open -a SourceTree'

# WP-CLI Bash completions
if brew --prefix wp-cli > /dev/null; then
  autoload bashcompinit
  bashcompinit
  source `brew --prefix wp-cli`/etc/bash_completion.d/wp-completion.bash
fi

# git alias hub
if which hub > /dev/null; then eval "$(hub alias -s)"; fi
	
# homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

export TERM="xterm-256color"