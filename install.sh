#!/bin/zsh

# 未定義な変数があったら途中で終了する
set -u

echo "brew tap"
# brew tap thirdparty
brew tap homebrew/cask-fonts
brew tap beeftornado/rmtree

formulas=(
    bat
    bitrise
    exa
    gh
    git-delta
    mint
    peco
    starship
    tmux
)

echo "brew install formula"
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

# install cask apps
casks=(
    alacritty
    alfred
    android-studio
    brave-browser
    docker
    flutter
    font-hackgen-nerd
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

mkdir ~/.config

ln -snfv ${PWD}/dotfiles/.config/starship.toml ~/.config

echo "Starship Config inistalled"
