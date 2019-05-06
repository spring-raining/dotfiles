## Prezto

```sh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

## Install

```sh
touch ~/dotfiles/zsh/local.zsh (or) mv ~/.zshrc ~/dotfiles/zsh/local.zsh  # PC固有のzshrc
ln -s ~/dotfiles/zshrc ~/.zshrc
source ~/.zshrc
```
