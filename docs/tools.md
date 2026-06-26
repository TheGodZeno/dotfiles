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
- git-delta
- shellcheck/shfmt
- fzf/eza/fd/ripgrep/bat when distro versions are good enough

## Install with bootstrap scripts

Some tools are installed by their official installer because distro packages are often old or unavailable:

- mise
- starship

## Manage with mise

Use mise for tools where per-project versions matter or where distro packages are old:

- go
- node
- python
- usage
- lazygit
- yazi
- kustomize
- kubectl/oc only if you can source the exact versions safely

## Manage in this repo

Small personal shell tools can live as Stow packages when they are part of the dotfiles workflow:

- offline-pack

## Rule

System dependencies go in the OS package manager.
Developer runtime versions and fast-moving CLI apps go in mise.
