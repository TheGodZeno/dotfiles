# shellcheck shell=bash disable=SC1090,SC1091
# bash completion
if [ -r /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -r /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# git completion
if [ -r /usr/share/bash-completion/completions/git ]; then
  . /usr/share/bash-completion/completions/git
elif [ -r /usr/share/git/completion/git-completion.bash ]; then
  . /usr/share/git/completion/git-completion.bash
fi

# mise completion
if command -v mise >/dev/null 2>&1; then
  eval "$(mise completion bash)"
fi

# kubectl completion
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion bash)
fi

# oc completion
if command -v oc >/dev/null 2>&1; then
  source <(oc completion bash)
fi
