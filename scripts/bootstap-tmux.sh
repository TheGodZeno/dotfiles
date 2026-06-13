#!/usr/bin/env bash
set -euo pipefail

TPM_DIR="$XDG_DATA_HOME/tmux/plugins/tpm"

mkdir -p "$(dirname "$TPM_DIR")"

if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi
