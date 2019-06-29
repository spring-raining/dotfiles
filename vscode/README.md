```sh
# Mac
export VSCODE_USER=~/Library/Application\ Support/Code/User
# Linux
export VSCODE_USER=~/.config/Code/User

rm $VSCODE_USER/keybindings.json
ln -s ~/dotfiles/vscode/User/keybindings.json $VSCODE_USER/keybindings.json

rm $VSCODE_USER/locale.json
ln -s ~/dotfiles/vscode/User/locale.json $VSCODE_USER/locale.json

rm $VSCODE_USER/settings.json
ln -s ~/dotfiles/vscode/User/settings.json $VSCODE_USER/settings.json

rm -r $VSCODE_USER/snippets
ln -s ~/dotfiles/vscode/User/snippets $VSCODE_USER/snippets
```

## Extensions 列挙

```sh
code --list-extensions > extensions.txt
```

## Extensions インストール

```sh
cat extensions.txt | xargs -L 1 code --instal-extension
```
