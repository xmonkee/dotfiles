# enable color support of ls and also add handy aliases
# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=/Users/mayankmandava/Library/Python/3.7/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export EDITOR=vim
export GOPATH=$HOME/Go
export PATH=$GOPATH/bin:$PATH

alias sed=gsed
alias ls='ls -G'
alias g="gcc -Wall -Wextra -Wstrict-prototypes -pedantic"
# alias socks5='ssh -D 8123 -f -C -q -N $UPVEST && firefox -private &'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

