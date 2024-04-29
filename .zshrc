
eval $(/opt/homebrew/bin/brew shellenv)

### exa aliases
if [[ $(command -v exa) ]]; then
  alias e='exa --git'
  alias ls=e
  alias ea='exa -a --git'
  alias la=ea
  alias ee='exa -aahl --git'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache"'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always | less -r'
  alias lta=eta
  alias l='clear && ls'
fi

alias cat='bat'

### Boot rbenv
eval "$(rbenv init -)"

### Github CLI 補完
eval "$(gh completion -s zsh)"

function g() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    cd ${selected_dir}
  fi
}

# OpenJDK
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
