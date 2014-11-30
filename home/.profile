unset LC_ALL
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"

# php version
if brew --prefix php-version > /dev/null; then
	source $(brew --prefix php-version)/php-version.sh
	php-version `cat ~/.phps/global` > /dev/null
	php-global () { if php-version $1; then echo $1 > ~/.phps/global; fi }
fi

# composer global bins
export PATH="$HOME/.composer/vendor/bin:$PATH"

# nodejs modules
export PATH="/usr/local/share/npm/bin:$PATH"

# ruby ssl needs a ssl cert location, needed for vagrant remote providers and stuff
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
