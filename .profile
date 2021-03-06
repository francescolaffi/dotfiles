unset LC_ALL
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"

# rbenv
if rbenv -v >/dev/null; then
  eval "$(rbenv init -)"
fi

# php version
# maybe have a look at asdf instead
if source ~/php-version.sh 2>/dev/null; then
  [[ -r ~/.phps/global ]] && php-version `cat ~/.phps/global` >/dev/null
  php-global () { if php-version $1; then echo $1 > ~/.phps/global; fi }
fi

# composer global bins
export PATH="$HOME/.composer/vendor/bin:$PATH"

# nodejs modules
export PATH="/usr/local/share/npm/bin:$PATH"

# GO workspace
export GOPATH="$HOME/workspace/go"
export PATH="$GOPATH/bin:$PATH"

# heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# letsencrypt
export PATH="$HOME/.local/share/letsencrypt/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"