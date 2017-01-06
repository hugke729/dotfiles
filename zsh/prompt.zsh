autoload -U colors && colors

function insert-mode () { echo " %{$fg_bold[blue]%}>%{$fg_no_bold[blue]%}>%{$fg_bold[white]%}>%{$reset_color%}" }
function normal-mode () { echo " %{$fg_no_bold[green]%}>%{$fg_bold[green]%}>%{$fg_bold[yellow]%}>%{$reset_color%}" }

precmd () {
    echo -n "\n"
    print -rP " %D{%H:%M}%  | %{$fg_no_bold[blue]%}%~%{$reset_color%}"

    # this is required for initial prompt and a problem I had with Ctrl+C or
    # Enter when in normal mode (a new line would come up in insert mode,
    # but normal mode would be indicated)
    PS1="$(insert-mode) "
}

function set-prompt () {
    case ${KEYMAP} in
      (vicmd)      VI_MODE="$(normal-mode)" ;;
      (main|viins) VI_MODE="$(insert-mode)" ;;
      (*)          VI_MODE="$(insert-mode)" ;;
    esac
    PS1="$VI_MODE "
}

function zle-line-init zle-keymap-select {
    set-prompt
    zle reset-prompt
}

#preexec () { print -rn -- $terminfo[el]; }

zle -N zle-line-init
zle -N zle-keymap-select
