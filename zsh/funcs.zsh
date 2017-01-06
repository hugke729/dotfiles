# l is like ls -l, but with only the stuff I care about.
l () { ls --color -gohltr "$@" |  awk '{ printf "%+5s %-3s %+2s %-5s",$3,$4,$5,$6, sep=" ";for (i=7;i<=NF;i++) {printf "%s%s",sep, $i;sep=" "}; printf "\n"}'; }

# le is the same but piped to less
le () { ls --color -gohltr "$@" |  awk '{ printf "%+5s %-3s %+2s %-5s",$3,$4,$5,$6, sep=" ";for (i=7;i<=NF;i++) {printf "%s%s",sep, $i;sep=" "}; printf "\n"}' | less -R; }

# copy filename to clipboard
cfc() {
	readlink -n -f $1 | xclip -selection clipboard
}

# dictionary (too much info though to be really useful)
di() {
    dict -d gcide $1 | less
}

function take
{
  command mkdir $1 && cd $1
}
