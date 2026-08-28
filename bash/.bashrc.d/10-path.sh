# shellcheck shell=bash
# User specific environment
path_prepend() {
  [ -d "$1" ] || return 0

  case ":$PATH:" in
  *":$1:"*) ;;
  *) PATH="$1:$PATH" ;;
  esac
}

path_append() {
  [ -d "$1" ] || return 0

  case ":$PATH:" in
  *":$1:"*) ;;
  *) PATH="$PATH:$1" ;;
  esac
}

path_prepend "$HOME/.local/bin"
path_prepend "$HOME/bin"
path_prepend "${KREW_ROOT:-$HOME/.krew}/bin"

export PATH
