
########################################
# from: https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
########################################
# GIT heart FZF
# -------------

unalias gb
unalias gf
#unalias gt
#unalias gh
unalias gr

is_in_git_repo() {
    git rev-parse HEAD > /dev/null 2>&1
}

fzf-down () {
  fzf --height 70% "$@" --border
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

gf () {
    is_in_git_repo || return
    git -c color.status=always status --short |
    fzf-down -m --ansi --nth 2..,.. \
        --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
    cut -c4- | sed 's/.* -> //'
}

gb () {
    is_in_git_repo || return
    git checkout $(git branch -a --color=always | grep -v '/HEAD\s' | sort |fzf-down --ansi --multi --tac --preview-window right:70% --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES | sed 's/^..//' | cut -d' ' -f1 |sed 's#^remotes/##')
}

gt () {
    is_in_git_repo || return
    git tag --sort -version:refname |
    fzf-down --multi --preview-window right:70% \
        --preview 'git show --color=always {} | head -'$LINES
}


gr () {
    is_in_git_repo || return
    git remote -v | awk '{print $1 "\t" $2}' | uniq |
    fzf-down --tac \
        --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
    cut -d$'\t' -f1
}

########################################
# kortina
########################################
fdz () {
    fd $(fd | grep "^  " | awk '{print $1}' | fzf-down --preview 'fd help {}')
}

cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}
fzf-history-widget() {
  local selected restore_no_bang_hist
  if selected=$(fc -l 1 | fzf +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r -q "$LBUFFER"); then
    num=$(echo "$selected" | head -1 | awk '{print $1}' | sed 's/[^0-9]//g')
    LBUFFER=!$num
    if setopt | grep nobanghist > /dev/null; then
      restore_no_bang_hist=1
      unsetopt no_bang_hist
    fi
    zle expand-history
    [ -n "$restore_no_bang_hist" ] && setopt no_bang_hist
  fi
  zle accept-line
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget
