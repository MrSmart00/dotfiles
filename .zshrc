
eval $(/opt/homebrew/bin/brew shellenv)

### eza aliases
if [[ $(command -v eza) ]]; then
  alias e='eza --git'
  alias ls=e
  alias ea='eza -a --git'
  alias la=ea
  alias ee='eza -aahl --git'
  alias ll=ee
  alias et='eza -T -L 3 -a -I "node_modules|.git|.cache"'
  alias lt=et
  alias eta='eza -T -a -I "node_modules|.git|.cache" --color=always | less -r'
  alias lta=eta
  alias l='clear && ls'
fi

alias cat='bat'

function g() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    cd ${selected_dir}
  fi
}
