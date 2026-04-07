# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# Only continue for interactive shells
case $- in
*i*) ;;
*) return ;;
esac

# Preferred browser
export BROWSER='cmd.exe /C start ""'

# Rust environment
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Load modular shell config
if [ -d "$HOME/.bashrc.d" ]; then
  for rc in "$HOME"/.bashrc.d/*.sh; do
    [ -f "$rc" ] && . "$rc"
  done
fi
unset rc

# Prompt should be near the end
eval "$(starship init bash)"
