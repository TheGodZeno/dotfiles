# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# Only continue for interactive shells
case $- in
    *i*) ;;
    *) return ;;
esac

# User specific environment
path_prepend() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$1:$PATH" ;;
    esac
}

path_append() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$PATH:$1" ;;
    esac
}

path_prepend "$HOME/.local/bin"
path_prepend "$HOME/bin"
export PATH

# Preferred browser
export BROWSER='cmd.exe /C start ""' 

# Rust environment
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Load modular shell config 
if [ -d "$HOME/.bashrc.d" ]; then
    for rc in "$HOME"/.bashrc.d/*.bash; do
        [ -f "$rc" ] && . "$rc"
    done
fi
unset rc

# Prompt should be near the end
eval "$(starship init bash)"
