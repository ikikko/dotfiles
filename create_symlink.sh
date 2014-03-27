#!/bin/sh
cd $(dirname $0)

for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

# TODO : サブディレクトリを含む config ファイルも対応する
# ln -s ~/dotfiles/private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml

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
