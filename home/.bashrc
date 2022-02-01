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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

