# Seen at: http://github.com/strcat/dotfiles/ and in grml.
# Robust replacement for global aliases, and you can edit them too.
# requires extended globbing.
setopt extended_glob 
typeset -A abbrevs
abbrevs=('...' '../..'
         '....' '../../..'
	 "scpgs" "scp parallel:/global/scratch/hugke729/"
	 "sagi"  "sudo apt-get install"
	 "sagr"  "sudo apt-get remove"
	 "spi"   "sudo pip install"
 )
 
# Create global aliases from the abbreviations.
for abbr in ${(k)abbrevs}; do 
 alias -g $abbr="${abbrevs[$abbr]}"
done

globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
   zle backward-delete-char
}

myexpand() {
   zle _expand_alias
   zle backward-delete-char
}

zle -N globalias
zle -N myexpand

#bindkey " " globalias
bindkey -M viins "^n" myexpand
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches 
