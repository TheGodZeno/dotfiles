# Tool integrations

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate bash)"
fi

# fzf
if command -v fzf >/dev/null 2>&1; then 
    eval "$(fzf --bash)"
fi

# direnv
if command -v direnv >/dev/null 2>&1; then 
    eval "$(direnv hook bash)"
fi
