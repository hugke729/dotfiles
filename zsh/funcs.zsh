# l is like ls -l, but with only the stuff I care about.
# Remove's symbolic link
l () { ls --color -gohltr --group-directories-first "$@" | sed 's/->.*//' | awk '{ printf "%+5s %-3s %+2s %-5s",$3,$4,$5,$6, sep=" ";for (i=7;i<=NF;i++) {printf "%s%s",sep, $i;sep=" "}; printf "\n"}'; }

# le is the same but piped to less
le () { ls --color -gohltr "$@" | sed 's/->.*//' |  awk '{ printf "%+5s %-3s %+2s %-5s",$3,$4,$5,$6, sep=" ";for (i=7;i<=NF;i++) {printf "%s%s",sep, $i;sep=" "}; printf "\n"}' | less -R; }

# copy filename to clipboard
cfc() {
	readlink -n -f $1 | xclip -selection clipboard
}

# Change directory and list
cl() {
        cd "$@" ; l
}

# Markdown preview
mp() {
        grip -b "$@" &>/dev/null &
}

# dictionary (too much info though to be really useful)
di() {
    dict -d gcide $1 | less
}

function take
{
  command mkdir $1 && cd $1
}

# Drop shadow

function ds
{
  convert $1 \( +clone -background gray -shadow 80x8+8+8 \) +swap -background white -layers merge +repage $2
}

# Edit pdf
function editpdf
{
    qpdf --stream-data=uncompress $1 tmp_uncompressed.pdf &&
    vim tmp_uncompressed.pdf &&
    qpdf --stream-data=compress tmp_uncompressed.pdf $1 &&
    rm tmp_uncompressed.pdf
}
