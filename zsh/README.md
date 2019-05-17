## Prezto

```sh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

zconfigs=("zlogin" "zlogout" "zprofile" "zshenv")
for rc in "${zconfigs[@]}"; do
  rcfile="${ZDOTDIR:-$HOME}/.zprezto/runcoms/${rc}"
  ln -s $rcfile ${ZDOTDIR:-$HOME}/.${rc}
done
ln -s ~/dotfiles/zsh/zprezto.zsh ~/.zpreztorc
```

## Install

```sh
touch ~/dotfiles/zsh/local.zsh (or) mv ~/.zshrc ~/dotfiles/zsh/local.zsh  # PC固有のzshrc
ln -s ~/dotfiles/zshrc ~/.zshrc
source ~/.zshrc
```
