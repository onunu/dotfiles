export TERM=xterm-256color
export PATH=~/.local/bin/:$PATH
export PATH="$HOME/bin:$PATH"

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
function promps {
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    PS1="${TITLEBAR}${GREEN}onunu${WHITE}:${BLUE}\W${GREEN}\$(parse_git_branch)${BLUE}ᛤ${WHITE} "
}
promps
# export PATH=$HOME/.nodebrew/current/bin:$PATH
