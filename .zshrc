# ~/.zshrc

# Start profiling (leave this at the very top, uncomment this and the zprof at the bottom for profiling)
# zmodload zsh/zprof

# ------------------------------------------------------------------------------
# Basic setup
# ------------------------------------------------------------------------------
# Vim mode
bindkey -v


# ------------------------------------------------------------------------------
# Prompt setup
# ------------------------------------------------------------------------------
setopt PROMPT_SUBST
source $HOME/dotfiles/.git-prompt.sh

NEWLINE=$'\n'
PS1_PRE="%F{cyan}%n@%m%f %F{yellow}[%3c]%f"  # user@hostname [three/dir/levels]
PS1_PRE+=" %F{magenta}[%D{%f/%m/%y} | %D{%L:%M:%S}]%f" # timestamp
PS1_PRE+="%0(?..%F{red} %?%f)" # exit status
PS1_PRE+="%1(j.%F{green} %j%f.)" # suspended jobs
PS1_PRE+="%F{green}" # suspended jobs
PS1_POST="%f"$NEWLINE"$ "
precmd () { __git_ps1 "$PS1_PRE" "$PS1_POST" " <%s>" }


# Set title to directory or last command
# precmd() { print -Pn "\e]0;%3/\a" }
# preexec() { echo -ne "\e]2; $(history $HISTCMD | cut -b7- ) \a"  }

# PATH additions
PATH="/opt/homebrew/opt/libpq/bin:$PATH" # For PostgreSQL
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH" # Bun an PATH should be BUN_INSTALL/bin
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/node/bin:$PATH"

# ------------------------------------------------------------------------------
# FZF (Fuzzy Finder)
# ------------------------------------------------------------------------------
# Source fzf definitions if the file exists
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# ------------------------------------------------------------------------------
# Devbox
# ------------------------------------------------------------------------------
if (( $+commands[devbox] )); then
  eval "$(devbox global shellenv --init-hook)"
fi

# ------------------------------------------------------------------------------
# Bun Completions
# ------------------------------------------------------------------------------
[ -s "/Users/mayankmandava/.bun/_bun" ] && source "/Users/mayankmandava/.bun/_bun"

# ------------------------------------------------------------------------------
# Custom Environment Script
# ------------------------------------------------------------------------------
# Source local environment script if it exists
if [ -f "$HOME/.local/bin/env" ]; then
  . "$HOME/.local/bin/env"
fi

# ------------------------------------------------------------------------------
# Zsh Modules & Completions Setup
# ------------------------------------------------------------------------------
# Add user's custom completions directory to fpath (if it exists)
# Prepending means these completions will be found first.
ZSH_CUSTOM_COMPLETIONS_DIR="$HOME/.zsh-completions"
if [ -d "$ZSH_CUSTOM_COMPLETIONS_DIR" ]; then
  fpath=("$ZSH_CUSTOM_COMPLETIONS_DIR" $fpath)
fi
# Note: The original fpath line for ASDF is handled in the ASDF section now.

# Autoload Zsh modules
autoload -U compinit promptinit
autoload -Uz zcalc # Autoload zcalc on first use (zsh builtin calculator)
autoload -Uz zsh-mime-setup # Autoload MIME setup on first use.

# Initialize the completion system
# This is the most critical part for startup speed.
# We'll use a dump file and only rebuild it if it's old or missing.
ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump.${ZSH_VERSION}" # Version-specific dump file

# Regenerate .zcompdump if it's missing, empty, or older than 20 hours.
# The `-i` flag tells compinit to ignore insecure files and directories without prompting.
# The `-C` flag tells compinit to use the dump file without checking if it's up-to-date.
if [[ ! -s "$ZSH_COMPDUMP" || -z "$ZSH_COMPDUMP"(#qN.mh+20) ]]; then
  # echo "Generating new .zcompdump..." # Optional: for feedback during generation
  compinit -i -d "$ZSH_COMPDUMP"
else
  compinit -i -C -d "$ZSH_COMPDUMP" # Load cached dump file
fi

# Initialize prompt system.
promptinit

# If you uncommented `autoload -Uz zsh-mime-setup` and need its functionality at startup:
zsh-mime-setup

# ------------------------------------------------------------------------------
# Zsh Options (setopt)
# Most setopt calls are very fast.
# ------------------------------------------------------------------------------
setopt COMPLETE_IN_WORD
setopt COMPLETEALIASES
setopt AUTO_PUSHD
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt NO_BEEP
setopt EXTENDED_GLOB
# setopt AUTO_CD
# setopt MULTIOS
# setopt CORRECT
# setopt AUTO_NAME_DIRS

# ------------------------------------------------------------------------------
# History Configuration
# ------------------------------------------------------------------------------
HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000

setopt APPEND_HISTORY       # Append to history file
setopt SHARE_HISTORY        # Share history between concurrent shells (recommended)
# setopt INC_APPEND_HISTORY # Append incrementally (SHARE_HISTORY is often preferred)
setopt HIST_IGNORE_DUPS     # Don't save duplicate consecutive commands
setopt HIST_IGNORE_ALL_DUPS # Don't save duplicate commands anywhere in history
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from commands
setopt HIST_IGNORE_SPACE    # Don't save commands starting with a space
setopt HIST_NO_STORE        # Don't save `history` or `fc` commands themselves
setopt HIST_VERIFY          # Show command from history before executing on expansion
setopt EXTENDED_HISTORY     # Save timestamp and duration for each command
setopt HIST_SAVE_NO_DUPS    # When writing history, skip older duplicates
setopt HIST_EXPIRE_DUPS_FIRST # When trimming history, remove duplicates first
setopt HIST_FIND_NO_DUPS    # When searching, don't show duplicates next to each other

# ------------------------------------------------------------------------------
# Completion Styling (zstyle)
# These affect behavior and appearance of completions, not startup speed significantly
# once compinit has run.
# ------------------------------------------------------------------------------
# Keybinding for completion in vi insert mode
bindkey -M viins '\C-i' complete-word

# Use a cache for completion results (can sometimes improve responsiveness)
zstyle ':completion::complete:*' use-cache true

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Verbose completion messages and formatting
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

# Completers to use
zstyle ':completion:*' completer _expand _complete _ignored

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:default' menu 'select=0' # Enable menu selection

# Sort files by modification time (newer last, so they appear higher in lists)
zstyle ':completion:*' file-sort modification reverse

# Color-coded completions (ensure your terminal supports colors and LS_COLORS or similar is configured)
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

unsetopt LIST_AMBIGUOUS # As per your original config

# Completion for man pages
zstyle ':completion:*:manuals' separate-sections true

# Completion for X window IDs (if applicable)
zstyle ':completion:*:windows' menu on=0 # Kept as per your config, though 'select=0' is more common for menu

zstyle ':completion:*:expand:*' tag-order all-expansions

# Approximate completion error handling
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3) ))'

# Format for correction suggestions
zstyle ':completion:*:corrections' format '%B%d (errors %e)%b'

# Don't complete arguments already on the line for `rm` and `vi`
zstyle ':completion::*:(rm|vi):*' ignore-line true

# Ignore parent directories and current directory for completion
zstyle ':completion:*' ignore-parents parent pwd

# Load starship prompt
# To install starship (zsh prompt) use curl -sS https://starship.rs/install.sh | sh
#if (( $+commands[starship] )); then
	#eval "$(starship init zsh)"
#fi

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
alias claude="/Users/mayank/.claude/local/claude"
alias vim=hx

# ------------------------------------------------------------------------------
# Finalize Profiling (leave this at the very end)
# ------------------------------------------------------------------------------
# zprof

if [ -e /home/xmonkee/.nix-profile/etc/profile.d/nix.sh ]; then . /home/xmonkee/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
