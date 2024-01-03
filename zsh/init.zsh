#
# init
#

local init_fname=~/dotfiles/zsh/init.zsh
if [ ! -f ${init_fname}.zwc -o ${init_fname} -nt ${init_fname}.zwc ]; then
  zcompile $init_fname
fi

#
# Prezto configuration
#
setopt EXTENDED_GLOB
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
# export
#

export EDITOR=vim

# XDG directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

#
# alias
#

alias vim="nvim"

alias cdtemp="cd $(mktemp -d)"
alias szshrc="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/dotfiles/zsh/local.zsh"

#
# functions
#
function peco-select-history {
  BUFFER=$(history -n 1 | tail -r | peco --prompt="history>" --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history

function peco-cdr {
  local selected_dir="$(cdr -l | sed -e 's/^[[:digit:]]*[[:blank:]]*//' | peco --prompt="cdr>" --query "$LBUFFER")"
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N peco-cdr

# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':completion:*:*:cdr:*:*' menu selection
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-max 500
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/shell/chpwd-recent-dirs"
  zstyle ':chpwd:*' recent-dirs-pushd true
fi

#
# bindkey
#
bindkey '^R' peco-select-history
bindkey '^S' peco-cdr

#
# user configuration
#
local uc_fname=~/dotfiles/zsh/local.zsh
if [ -f $uc_fname ]; then
  if [ ! -f ${uc_fname}.zwc -o ${uc_fname} -nt ${uc_fname}.zwc ]; then
    zcompile $uc_fname
  fi
  source $uc_fname
fi
