# git-completion
source /usr/local/etc/bash_completion.d/git-completion.bash

# coreutils
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# editor
export EDITOR=vim

# ruby
if which rbenv > /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# python
if which pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# nodejs
if which ndenv > /dev/null; then
  export PATH="$HOME/.ndenv/bin:$PATH"
  eval "$(ndenv init -)"
fi

alias clip='pbcopy'
alias SS='ssh -A $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config| awk "{print \$2}"| peco)'
alias ls='ls -F --color=auto'
alias gd='git difftool'
alias k='kubectl'

source ~/.bashrc
export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"
export PGHOST="hero-dev.cn8mep7dlcam.ap-northeast-1.rds.amazonaws.com"
export PGUSER="postgres"
export PGDATABASE="ieshil_staging"

export CLOUDSDK_PYTHON=/usr/local/Cellar/python@2/2.7.16/bin/python2

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/200291/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/200291/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/200291/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/200291/Downloads/google-cloud-sdk/completion.bash.inc'; fi
