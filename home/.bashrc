# enable color support of ls and also add handy aliases
# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export EDITOR=vim
export GOPATH=$HOME/Go
export PATH=$GOPATH/bin:$PATH

alias sed=gsed
alias ls='ls -G'
alias g="gcc -g -Wall -Wextra -Wstrict-prototypes -pedantic"
alias psql="docker run --rm -it postgres psql"

export ASDF_DIR=$HOME/.asdf
source $ASDF_DIR/asdf.sh
