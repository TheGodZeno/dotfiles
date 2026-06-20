# shellcheck shell=bash
# environment variables
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-$EDITOR}"

# Pager
export PAGER="${PAGER:-less}"
export LESS="${LESS:--R}"

# Preferred browser only inside WSL
if grep -qi microsoft /proc/version 2>/dev/null; then
  export BROWSER='cmd.exe /C start ""'
fi
