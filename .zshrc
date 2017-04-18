if source ~/antigen/antigen.zsh 2>/dev/null; then
antigen init .antigenrc
fi

bindkey -e
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

# override some oh-my-zsh aliases
alias la='ls -AF'
alias  l='ls -lAh'
alias ll='ls -lah'
alias ls='ls -G'

# sublimetext integration
e() { subl "${1:-.}" }
[[ -f /usr/local/bin/subl ]] && export EDITOR="/usr/local/bin/subl -w"

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
if [[ -d `brew --prefix wp-cli 2>/dev/null` ]] then
  autoload bashcompinit
  bashcompinit
  source `brew --prefix wp-cli`/etc/bash_completion.d/wp-completion.bash
fi

# git alias hub
if which hub > /dev/null; then eval "$(hub alias -s)"; fi

export TERM="xterm-256color"
