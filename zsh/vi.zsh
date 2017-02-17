bindkey -v

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# vi mode
bindkey -M vicmd 'j' history-beginning-search-forward
bindkey -M vicmd 'k' history-beginning-search-backward
 
# Bind UP and DOWN arrow keys while we're at it
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Fix backspace
bindkey "^?" backward-delete-char

# Ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# Reimplement Ctrl-r
bindkey '^r' history-incremental-search-backward

# Edit long command with vim
bindkey -v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
