# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

source /etc/environment
# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$PATH:$HOME/.cargo/bin
export GOROOT=$HOME/Downloads/go
export GOPATH=$HOME/dev/gocode
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/.node/bin
export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
export VISUAL=$EDITOR
export UPVEST="upvest@45.55.248.239"
export GOPATH="$HOME/dev/gocode"
export PATH="$PATH:$GOPATH/bin"
export JAVA_HOME="/usr/lib/jvm/default-java"
export PATH="$PATH:$JAVA_HOME/bin"
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/
export TERMINAL=/usr/local/bin/st
export TERM=xterm
export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

eval $(gpg-agent --daemon)