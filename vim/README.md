## Neovim

```sh
brew install neovim
pip2 install neovim && pip3 install neovim
```

## dein.vim

```sh
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.config/nvim

mkdir -p ~/.cache/dein
git clone https://github.com/Shougo/dein.vim ~/.cache/dein/repos/github.com/Shougo/dein.vim
vim (or) nvim # (Neo)Vim起動時にdein.vimがプラグインをインストール
```

### プラグイン再インストール

```viml
:call dein#update()
```

## editorconfig-vim

```sh
brew install editorconfig
```
