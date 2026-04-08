if [ -r /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -r /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [ -r /usr/share/bash-completion/completions/git ]; then
  . /usr/share/bash-completion/completions/git
elif [ -r /usr/share/git/completion/git-completion.bash ]; then
  . /usr/share/git/completion/git-completion.bash
fi

if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion bash)
fi

if command -v oc >/dev/null 2>&1; then
  source <(oc completion bash)
fi
