# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"


# Example aliases
alias vs="vagrant ssh"
alias vu="vagrant up"
alias gg="git grep"
alias src="cd ~/Documents/src"
# export DOCKER_HOST="tcp://192.168.66.10:2375"
export FIN_HOME=~/Documents/src/fin-core-beta
export DOCKER_API_VERSION=1.25
alias 🔥="rm"
alias cob="!git checkout -b $1 && git push -u origin"
alias vf="vim \$(fzf)"
alias v="vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias ctags="`brew --prefix`/bin/ctags"
source "${FIN_HOME}/fin-dev/bashrc"

function gitmigrate () {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  new_branch_name=${branch_name}-migrations

  git checkout master && git checkout -b ${new_branch_name} && git checkout ${branch_name} db/migrate && git commit -m "Add migrations from ${branch_name}"
}

bindkey -v

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
source "${FIN_HOME}/fin-dev/bashrc"
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# globalias() {
#   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
#     zle _expand_alias
#     zle expand-word
#   fi
#   zle self-insert
#}
#
#zle -N globalias
#
#globalias start-karma="xvfb-run $NODE_PATH/karma/bin/karma start --single-run=false"

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 bundler zeus vagrant)

source $ZSH/oh-my-zsh.sh
[[ -s "/Users/sshanker220/.rvm/scripts/rvm" ]] && source "/Users/sshanker220/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Customize to your needs...
export PATH=$PATH:/Users/sshanker220/.rvm/gems/ruby-1.9.3-p0/bin:/Users/sshanker220/.rvm/gems/ruby-1.9.3-p0@global/bin:/Users/sshanker220/.rvm/rubies/ruby-1.9.3-p0/bin:/Users/sshanker220/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin:/Users/sshanker220/go/bin
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/terraform/bin"
export PATH="$PATH:$HOME/Documents/src/ops-chrome-extension/node_modules/.bin"
source ~/.rvm/scripts/rvm

bindkey -v
bindkey "^?" backward-delete-char
bindkey "^R" history-incremental-search-backward
