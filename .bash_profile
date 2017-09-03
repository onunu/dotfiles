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
if which nodenv > /dev/null; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

alias clip='pbcopy'
alias SS='ssh $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config| awk "{print \$2}"| peco)'

source ~/.bashrc
