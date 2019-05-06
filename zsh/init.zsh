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
# user configuration
#
local uc_fname=~/dotfiles/zsh/local.zsh
if [ -f $uc_fname ]; then
  if [ ! -f ${uc_fname}.zwc -o ${uc_fname} -nt ${uc_fname}.zwc ]; then
    zcompile $uc_fname
  fi
  source $uc_fname
fi
