#
# init
#

if [ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi

#
# export
#

# XDG directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

#
# alias
#

alias vim="nvim"

alias cdtemp="cd $(mktemp -d -t tmp)"
alias szshrc="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"

