# Vim mode
bindkey -v

setopt PROMPT_SUBST
source $HOME/dotfiles/home/.git-prompt.sh
NEWLINE=$'\n'
PS1_PRE="%F{cyan}%n@%m%f %F{yellow}[%3c]%f"  # user@hostname [three/dir/levels]
PS1_PRE+=" %F{magenta}[%D{%f/%m/%y} | %D{%L:%M:%S}]%f" # timestamp
PS1_PRE+="%0(?..%F{red} %?%f)" # exit status
PS1_PRE+="%1(j.%F{green} %j%f.)" # suspended jobs
PS1_PRE+="%F{green}" # suspended jobs
PS1_POST="%f"$NEWLINE"$ "
precmd () { __git_ps1 "$PS1_PRE" "$PS1_POST" "〈%s〉" }


# Set title to directory or last command
# precmd() { print -Pn "\e]0;%3/\a" }
# preexec() { echo -ne "\e]2; $(history $HISTCMD | cut -b7- ) \a"  }

# Source bashrc
if [[ -a ~/.bashrc ]]; then
    source ~/.bashrc
fi

# pass completion
fpath=(~/.zsh-completions $fpath)
fpath=($ASDF_DIR/completions $fpath)


#{{{ ZSH Modules

autoload -U compinit promptinit zcalc zsh-mime-setup
compinit
promptinit
zsh-mime-setup
#}}}

##{{{ Options

# Autocomplete apt
setopt completealiases

# why would you type 'cd dir' if you could just type 'dir'?
#setopt AUTO_CD

# Now we can pipe to multiple outputs!
#setopt MULTIOS

# Spell check commands!  (Sometimes annoying)
 #setopt CORRECT

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
#setopt AUTO_NAME_DIRS

# blank pushd goes to home
setopt PUSHD_TO_HOME

# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS

# beeps are annoying
setopt NO_BEEP

# globbin
setopt EXTENDED_GLOB

#}}}

#{{{ History Stuff

# Where it gets saved
HISTFILE=~/.history

# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
# setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

#}}}

#{{{ Completion Stuff

bindkey -M viins '\C-i' complete-word

# Faster! (?)
zstyle ':completion::complete:*' use-cache 1

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' completer _oldlist _expand _complete
#zstyle ':completion:*' completer _expand _complete _approximate _ignored
zstyle ':completion:*' completer _expand _complete _ignored

# generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'

# Don't prompt for a huge list, page it!
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Don't prompt for a huge list, menu it!
zstyle ':completion:*:default' menu 'select=0'

# Have the newer files last so I see them first
zstyle ':completion:*' file-sort modification reverse

# color code completion!!!!  Wohoo!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

unsetopt LIST_AMBIGUOUS
setopt  COMPLETE_IN_WORD

# Separate man page sections.  Neat.
zstyle ':completion:*:manuals' separate-sections true

# complete with a menu for xwindow ids
zstyle ':completion:*:windows' menu on=0
zstyle ':completion:*:expand:*' tag-order all-expansions

# more errors allowed for large words and fewer for small words
zstyle ':completion:*:approximate:*' max-errors 'reply=(  $((  ($#PREFIX+$#SUFFIX)/3  ))  )'

# Errors format
zstyle ':completion:*:corrections' format '%B%d (errors %e)%b'

# Don't complete stuff already on the line
zstyle ':completion::*:(rm|vi):*' ignore-line true

# Don't complete directory we are already in (../here)
zstyle ':completion:*' ignore-parents parent pwd

# zstyle ':completion::approximate*:*' prefix-needed false

#}}}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
