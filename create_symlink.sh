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

### Karabiner-Elements
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
# - .aws/credentials
