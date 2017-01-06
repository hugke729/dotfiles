# Searching
alias ag="ag -i --color"
alias ag_uni='ag "[\x80-\xFF]"'
alias grep="grep --color=always --exclude-dir={.bzr,.cvs,.git,.hg,.svn}"
alias -g G="| grep --exclude-dir={.bzr,.cvs,.git,.hg,.svn}"

# Python
alias ipython="/home/hugke729/Python/bin/ipython"
alias je="/home/hugke729/Python/bin/jupyter console --existing"
alias jupyter='/home/hugke729/Python/bin/jupyter'
alias jc='/home/hugke729/Python/bin/jupyter console'
alias pip="/home/hugke729/Python/bin/pip"
alias python="/home/hugke729/Python/bin/python"

# Standard commands
alias c="clear"
alias diff='colordiff'
alias rm='trash-rm'
alias tmd="tmux detach"
alias latexdiff='latexdiff --append-context2cmd="abstract"'
alias manh='man --html=google-chrome'

# Directories
alias cdp='cd ~/PhD/Python/'
alias dot='cd ~/Documents/dotfiles'
alias ld='l -d */'
alias n='nemo . 2>/dev/null 1>/dev/null'
alias us='cd /usr/share/'
alias usa='cd /usr/share/applications'
alias win='cd /media/hugke729/C-Drive1/Users/Ken/Documents/'

# SSH
alias sshj='ssh jasper'
alias sshn='ssh nestor'
alias sshp='ssh parallel'

# Git
alias ga='git add'
alias gcm='git commit -m'
alias gdt='git difftool'
alias gp='git push'
alias gs='git status'

# Make cycle
alias bam='../../../tools/genmake2 -mods=../code -of=../../../tools/build_options/linux_amd64_gfortran | tail -10; make depend | tail -10; make | tail -10'
alias md='make depend'

# Misc
alias -g nul="2> /dev/null"
alias ffmpeg='~/.imageio/ffmpeg/ffmpeg.linux32'
alias ka='killall'
alias np='env WINEPREFIX="/home/hugke729/.wine" wine C:\\users\\hugke729\\My\ Documents\\Programs\\Notepad++\\notepad++.exe'
alias plz='sudo $(fc -ln -1)' # rerun last command with sudo priveledges

