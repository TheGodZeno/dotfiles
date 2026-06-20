# Tools

## Manage with OS package manager

Use `dnf`/`apt` for stable system tools:

- git
- stow
- tmux
- curl/wget
- openssh-client
- bash-completion
- jq/yq
- shellcheck/shfmt
- fzf/eza/fd/ripgrep/bat when distro versions are good enough

## Manage with mise

Use mise for tools where per-project versions matter or where distro packages are old:

- go
- node
- python
- usage
- lazygit
- yazi
- kubectl/oc only if you can source the exact versions safely

## Rule

System dependencies go in the OS package manager.
Developer runtime versions and fast-moving CLI apps go in mise.
