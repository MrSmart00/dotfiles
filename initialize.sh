#!/bin/zsh

# 未定義な変数があったら途中で終了する
set -u

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

chmod g-w /usr/local/share/zsh /usr/local/share/zsh/site-functions

### Homebrew
# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${PWD}/"$f" ~
done

# スクリーンショットの撮影時に影を含めない
defaults write com.apple.screencapture disable-shadow -bool true

# Finderで隠しファイルを表示する
defaults write com.apple.finder AppleShowAllFiles -bool true

# Xcodeでビルドにかかった時間を表示する
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool true

# シミュレータにタップジェスチャーを表示する
defaults write com.apple.iphonesimulator ShowSingleTouches 1

# Swiftプロジェクトのビルドを速くする
defaults write com.apple.dt.XCBuild EnableSwiftBuildSystemIntegration 1

# SystemUIServerを再起動して設定を反映させる
killall SystemUIServer

# Homebrewをインストールする
# ref: https://docs.brew.sh/Installation
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.zshrc

# Homebrewで管理しているパッケージをインストールする
# ref: https://tech.gootablog.com/article/homebrew-brewfile/
brew bundle
source ~/.zshrc

packages=(
    bundler
)

echo "gem install packages"

for package in "${packages[@]}"; do
    sudo gem install $package
done

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

echo "zinit inistalled"
