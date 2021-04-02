### Finder

# Macのディレクトリを英語にする
rm ~/*/.localized

# Mac OS XのFinderで隠しファイルを表示させる
defaults write com.apple.finder AppleShowAllFiles TRUE

killall Finder


### SystemUIServer

# capture の prefix を変更する
defaults write com.apple.screencapture name capture

# capture の保存ディレクトリを変更する
if [ ! -d ~/Desktop/capture ]; then
  mkdir ~/Desktop/capture
  defaults write com.apple.screencapture location ~/Desktop/capture
fi

killall SystemUIServer
