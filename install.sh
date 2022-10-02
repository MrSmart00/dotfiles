#!/bin/zsh

# 未定義な変数があったら途中で終了する
set -u

echo "brew tap"
# brew tap thirdparty
brew tap homebrew/cask-fonts
brew tap beeftornado/rmtree

formulas=(
    bat
    exa
    gh
    ghq
    git-delta
    peco
    rbenv
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
    brave-browser
    font-hackgen-nerd
    visual-studio-code
)

echo "brew casks"
for cask in "${casks[@]}"; do
    brew install --cask $cask
done

brew cleanup

echo "brew installed"

packages=(
    bundler
)

echo "gem install packages"

for package in "${packages[@]}"; do
    gem install $package
done

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

echo "zinit inistalled"

mkdir ~/.config

ln -snfv ${PWD}/dotfiles/.config/starship.toml ~/.config

echo "Starship Config inistalled"
