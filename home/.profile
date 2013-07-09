unset LC_ALL
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# homebrew
export PATH="/usr/local/bin:$PATH"

# ~/.composer
export PATH="$HOME/.composer/bin:$PATH"

# brew node modules
export PATH="/usr/local/share/npm/bin:$PATH"

# brew python stuff
export PATH="/usr/local/share/python:$PATH"

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi