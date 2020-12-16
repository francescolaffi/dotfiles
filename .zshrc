if source /usr/local/share/antigen/antigen.zsh 2>/dev/null; then
antigen init .antigenrc
fi

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

bindkey -e
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

# override some oh-my-zsh aliases
alias la='ls -AF'
alias  l='ls -lAh'
alias ll='ls -lah'
alias ls='ls -G'
alias glom='git pull origin $(git_main_branch)'
alias grbauto='GIT_SEQUENCE_EDITOR=: grbi --autosquash'
alias gpmr='gpsup -o merge_request.create'
alias gmwps='gpmr -o merge_request.merge_when_pipeline_succeeds'

pwcp() { echo $(echo -n $(pwgen -Bs ${1:-16}) | tee >(pbcopy)) copied to clipboard }

mac_reset () { sudo ifconfig en0 ether 38:f9:d3:9c:9f:e4 }
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

export TERM="xterm-256color"

PATH="/Users/francesco/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/francesco/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/francesco/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/francesco/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/francesco/perl5"; export PERL_MM_OPT;
