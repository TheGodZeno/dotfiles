# shellcheck shell=bash disable=SC1090,SC1091
# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# Only continue for interactive shells
case $- in
*i*) ;;
*) return ;;
esac

# Load modular shell config
if [ -d "$HOME/.bashrc.d" ]; then
  for rc in "$HOME"/.bashrc.d/*.sh; do
    [ -f "$rc" ] && . "$rc"
  done
fi
unset rc

# Prompt should be near the end
if command -v starship > /dev/null 2>&1; then
  eval "$(starship init bash)"
fi
