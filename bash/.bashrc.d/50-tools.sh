# Tool integrations

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
command -v fzf >/dev/null 2>&1 && eval "$(fzf --bash)"

command -v direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"
