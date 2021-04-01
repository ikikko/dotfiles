#!/bin/sh
cd $(dirname $0)

### 設定ファイル
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

# TODO : サブディレクトリを含む config ファイルも対応する

### Karabiner
# export : /Applications/Karabiner.app/Contents/Library/bin/karabiner export > karabiner-import.sh
./karabiner-import.sh
ln -sf ~/dotfiles/private.xml ~/Library/Application\ Support/Karabiner/private.xml
ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json

### 認証情報の設定ファイル
for dotfile in credentials/.?*
do
    if [ $dotfile != 'credentials/..' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

# TODO : サブディレクトリを含む credential ファイルも移す
# - .m2/settings.xml
# - .pit/*
# - .aws/config
