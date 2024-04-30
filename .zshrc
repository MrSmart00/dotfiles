
eval $(/opt/homebrew/bin/brew shellenv)

alias cat='bat'

function g() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    cd ${selected_dir}
  fi
}
