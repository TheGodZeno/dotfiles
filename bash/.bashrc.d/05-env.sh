# shellcheck shell=bash
# environment variables
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-$EDITOR}"

# Pager
export PAGER="${PAGER:-less}"
export LESS="${LESS:--R}"

# Starship theme selected by starship-theme.
export STARSHIP_CONFIG="${STARSHIP_CONFIG:-${XDG_CONFIG_HOME:-$HOME/.config}/starship/current.toml}"

# Preferred browser only inside WSL
if grep -qi microsoft /proc/version 2>/dev/null; then
  export BROWSER='cmd.exe /C start ""'
fi
