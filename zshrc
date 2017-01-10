# GENERAL BEHAVIOUR

## use vi key-bindings
bindkey -v

### return to command mode
bindkey -M viins 'fd' vi-cmd-mode

## disable software flow control (ctr-s and ctrl-q keybindings free)
stty -ixon

## set rxvt as standard terminal emulator
export TERM=rxvt

## dont save duplicates
setopt HIST_IGNORE_DUPS

# Prompt
setopt PROMPT_SUBST
autoload -U colors && colors

# Get git prompt
source ~/.zsh/zsh-git-prompt/zsh_git_prompt
# get teleport
source ~/.zsh/teleport/teleport

PCOLOR1=cyan
PCOLOR2=magenta
PCOLOR3=white

PS1='
%{$fg[$PCOLOR1]%}(\
%{$fg[$PCOLOR2]%}%~\
%{$fg[$PCOLOR1]%})-(\
%{$fg[$PCOLOR2]%}%n@%m\
%{$fg[$PCOLOR1]%})-(\
%{$fg[$PCOLOR2]%}%*\
%{$fg[$PCOLOR1]%})${reset_color}\
$(git_super_status)
%{$fg[$PCOLOR3]%}$ '

# Autocompletion
autoload -U compinit
compinit

## For autocompletion with an arrow-key driven interface:
## zstyle ':completion:*' menu select

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

# History
HISTFILE=~/.zshhistfile
HISTSIZE=100000
SAVEHIST=100000

# Aliases (Always end with ' ' -- so aliases can be chained)
alias ls='ls --color=auto '
alias l='ls -lh '
alias la='l -A '
alias ..='cd .. '
alias ...='cd ../.. '
alias ll='l | less '
alias lal='la | less '

alias grep='grep --color=auto '
alias fgrep='fgrep --color=auto '
alias egrep='egrep --color=auto '

hash -d docs="$HOME/Documents"
hash -d note="$HOME/Notes"
hash -d proj="$HOME/Projects"
hash -d desk="$HOME/Desktop"

## Custom aliases
alias s="tracker search --limit=10000 "

alias ghc="stack ghc"
alias ghci="stack ghci"

alias j="tp goto"

# Functions

## c: shortcut for changing directories
let c() {
	if [ $# -eq 0 ];
	then
	    cd && ls -l;
	else
	    cd "$1" && ls -l;
    fi
}

let f() {
    nautilus . 2>> /dev/null
    }
