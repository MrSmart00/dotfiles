#!/bin/zsh

# 未定義な変数があったら途中で終了する
set -u

formulas=(
    exa
    flutter
    gh
    bitrise
    mint
    starship
)

echo "brew tap"
# brew tap thirdparty
brew tap homebrew/cask-fonts

echo "brew install formula"
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

# install cask apps
casks=(
    android-studio
    brave-browser
    deepl
    docker
    font-hackgen-nerd
    iterm2
    slack
    visual-studio-code
    zoom
)

echo "brew casks"
for cask in "${casks[@]}"; do
    brew install --cask $cask
done

brew cleanup

echo "brew installed"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
source ~/.zshrc
zinit self-update

echo "zinit inistalled"

echo 'command_timeout = 10000' >> ~/.config/starship.toml
