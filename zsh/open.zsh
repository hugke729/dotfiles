export EDITOR=vim

# open files automatically
autoload -U zsh-mime-setup
zsh-mime-setup

# replace some of the default handling that zsh-mime-setup gets wrong
alias -s py='exo-open'
alias -s ipynb='jupyter notebook'
alias -s F='subl'
alias -s h='subl'
alias -s md='subl'
alias -s tex='subl'
alias -s svg='/home/hugke729/Documents/Other/inkscape_start.sh'

inkscape() {
    /home/hugke729/Documents/Other/inkscape_start.sh "$@"
}

# mplayer spits out errors, so redirect these to null
bg-mplayer() {
	"$@" </dev/null >/dev/null 2>&1 &
}
alias -s mp4='bg-mplayer mpv '
alias -s gif='bg-mplayer mpv '

bg-atril() {
	atril "$@" </dev/null >/dev/null 2>&1 &
}
alias -s pdf='bg-atril'

bg-jupyter-notebook() {
	jupyter notebook "$@" </dev/null >/dev/null 2>&1 &
}
alias -s ipynb='bg-jupyter-notebook'
