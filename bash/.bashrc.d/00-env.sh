# environment variables
export EDITOR="nvim"

# Pager
export PAGER="less"
export LESS="-R"

# XDG Base Directory defaults
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Create dirs if missing
mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_CACHE_HOME" "$XDG_STATE_HOME"

# Preferred browser only inside WSL
if grep -qi microsoft /proc/version 2>/dev/null; then
  export BROWSER='cmd.exe /C start ""'
fi

