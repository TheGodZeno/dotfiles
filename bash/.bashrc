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
eval "$(starship init bash)"
