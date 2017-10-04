export EDITOR=vim

# open files automatically
autoload -U zsh-mime-setup
zsh-mime-setup

# replace some of the default handling that zsh-mime-setup gets wrong
alias -s py='subl'
alias -s m='subl'
alias -s sh='zsh'
alias -s ipynb='jupyter notebook'
alias -s F='subl'
alias -s h='subl'
alias -s md='subl'
alias -s tex='subl'
alias -s svg='/home/hugke729/Documents/Other/inkscape_start.sh'

inkscape() {
    /home/hugke729/Documents/Other/inkscape_start.sh "$@"
}

# Create functions that open files but give the command line back
bg-mplayer() {
	"$@" </dev/null >/dev/null 2>&1 &
}
bg-atril() {
	atril "$@" </dev/null >/dev/null 2>&1 &
}
bg-zathura() {
	zathura "$@" </dev/null >/dev/null 2>&1 &
}
bg-jupyter-notebook() {
	jupyter notebook "$@" </dev/null >/dev/null 2>&1 &
}
bg-feh() {
	feh -B white --geometry 1366x730+0+29 "$@" </dev/null >/dev/null 2>&1 &
}
bg-fehr() {
	feh -B white --geometry 1920x1080+1366+312 "$@" </dev/null >/dev/null 2>&1 &
}

alias -s mp4='bg-mplayer mpv '
alias -s gif='bg-mplayer mpv '
# alias -s pdf='bg-atril'
alias -s pdf='bg-zathura'
alias -s ipynb='bg-jupyter-notebook'
alias feh='bg-feh'
alias fehr='bg-fehr'
