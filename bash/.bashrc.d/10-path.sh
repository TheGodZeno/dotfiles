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
