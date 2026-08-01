# shellcheck shell=bash disable=SC1091
# Tool integrations

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate bash)"
fi

# bat
if command -v bat >/dev/null 2>&1; then
  __bashrc_bat_cmd="bat"
  alias b='bat'
  alias catp='bat --paging=never'
elif command -v batcat >/dev/null 2>&1; then
  __bashrc_bat_cmd="batcat"
  alias bat='batcat'
  alias b='batcat'
  alias catp='batcat --paging=never'
else
  __bashrc_bat_cmd=""
fi

if [[ -n "$__bashrc_bat_cmd" ]]; then
  export BAT_THEME="${BAT_THEME:-TwoDark}"
  export BAT_STYLE="${BAT_STYLE:-numbers,changes,header}"
  export BAT_PAGER="${BAT_PAGER:-less -FR}"
fi

# fzf
if command -v fzf >/dev/null 2>&1; then
  if command -v fd >/dev/null 2>&1; then
    __bashrc_fd_cmd="fd"
  elif command -v fdfind >/dev/null 2>&1; then
    __bashrc_fd_cmd="fdfind"
    alias fd='fdfind'
  else
    __bashrc_fd_cmd=""
  fi

  if [[ -n "$__bashrc_fd_cmd" ]]; then
    export FZF_DEFAULT_COMMAND="${FZF_DEFAULT_COMMAND:-$__bashrc_fd_cmd --hidden --follow --strip-cwd-prefix --exclude .git --exclude node_modules}"
    export FZF_CTRL_T_COMMAND="${FZF_CTRL_T_COMMAND:-$FZF_DEFAULT_COMMAND}"
    export FZF_ALT_C_COMMAND="${FZF_ALT_C_COMMAND:-$__bashrc_fd_cmd --type d --hidden --follow --strip-cwd-prefix --exclude .git --exclude node_modules}"
  fi

  export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:-} --height=80% --layout=reverse --border --cycle --info=inline --prompt='> ' --pointer='>' --marker='*' --bind='ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,ctrl-/:toggle-preview'"

  if [[ -n "$__bashrc_bat_cmd" ]]; then
    export FZF_CTRL_T_OPTS="${FZF_CTRL_T_OPTS:-} --preview='$__bashrc_bat_cmd --color=always --style=numbers,changes --line-range=:300 {}' --preview-window='right,60%,border-left'"
  fi

  eval "$(fzf --bash)"
fi
unset __bashrc_bat_cmd __bashrc_fd_cmd

# direnv
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi
