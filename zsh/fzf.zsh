fh() {
  if [ "$#" -lt 1 ]; then
    echo "Provide at least one argument"
  fi 
  search_str=''
  for word in "$@"; do search_str+=' '$word; done
  local hist
  hist=$(history -n 0 | sort -u | uniq | fzf-tmux -d 10 -x +m -q $search_str) &&
  print -z $hist
}

zle -N fh

ctrlr() {
  local hist
  hist=$(history -r -n 0 | awk '!_[$0]++{print}' | fzf-tmux -e -d 10 -x +m --tiebreak=index) &&
  print -z $hist
}
#zle -N ctrlr
#bindkey '^R' ctrlr

export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up' 

fd() {
  if [ "$#" -lt 1 ]; then
    echo "Provide at least one argument"
  fi 
  search_str=''
  for word in "$@"; do search_str+=/$word; done
  search_str=$search_str:s./.\
  local dir
  dir=$(find -L ~ . \( -path '*/\.*' -o -path '*python*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
                  -o -type d -print 2> /dev/null | sed -e "s|/home/hugke729/||" | fzf-tmux -d 10 +m -x -q $search_str) &&
  cd "/home/hugke729/$dir"
}

fda() {
  if [ "$#" -lt 1 ]; then
    echo "Provide at least one argument"
  fi 
  search_str=''
  for word in "$@"; do search_str+=/$word; done
  search_str=$search_str:s./.\
  local dir
  dir=$(find -L ~ . \( -path '*python*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
                  -o -type d -iname -print 2> /dev/null | sed -e "s|/home/hugke729/||" | fzf-tmux -d 10 +m -x -q $search_str) &&
  cd "/home/hugke729/$dir"
}

export FZF_DEFAULT_COMMAND='(find -L ~ . \( -path "*/\.*" -o -path "*python" -o -fstype "dev" -o -fstype "proc" \) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed -e "s|/home/hugke729/||")'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
