# shellcheck shell=bash

# Directory listings: keep real ls untouched. Prefer eza helpers, fall back to lsd.
if command -v eza >/dev/null 2>&1; then
  alias e='eza --icons=auto --group-directories-first'
  alias el='eza --icons=auto --group-directories-first --long --git --header'
  alias ea='eza --icons=auto --group-directories-first --all'
  alias ela='eza --icons=auto --group-directories-first --long --git --header --all'
  alias et='eza --icons=auto --group-directories-first --tree --level=2'
elif command -v lsd >/dev/null 2>&1; then
  alias e='lsd --icon auto --group-dirs first'
  alias el='lsd --icon auto --group-dirs first --long'
  alias ea='lsd --icon auto --group-dirs first --almost-all'
  alias ela='lsd --icon auto --group-dirs first --long --almost-all'
  alias et='lsd --icon auto --tree --depth 2'
else
  alias ll='ls -lh'
  alias la='ls -A'
  alias lla='ls -lha'
fi

# OpenShift shortcuts.
if command -v oc >/dev/null 2>&1; then
  unalias ocas 2>/dev/null || true

  function ocas {
    if [[ "${1:-}" == "__complete" ]]; then
      shift
      command oc __complete --as=system:admin "$@"
    else
      command oc --as system:admin "$@"
    fi
  }
fi
