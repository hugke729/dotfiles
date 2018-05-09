autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive completion
zstyle ':completion:*' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zle -N zle-keymap-select

# scp completion
local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts

# Fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Colour typed prefix
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=00}:${(s.:.)LS_COLORS}")';

# https://superuser.com/questions/415650/does-a-fuzzy-matching-mode-exist-for-the-zsh-shell
# zstyle ':completion:*' matcher-list 'r:|?=** m:{a-z\-}={A-Z\_}'
