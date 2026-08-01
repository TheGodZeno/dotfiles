# Tools

## Rule

```text
OS package manager    stable system tools
mise                  runtimes and fast-moving CLIs
Stow/repo scripts     personal config and tiny helper scripts
```

## OS Packages

Installed by `scripts/bootstrap-tools` when supported:

```text
git stow curl tar xz tmux direnv zoxide neovim
fzf eza fd ripgrep bat jq yq git-delta shellcheck shfmt
```

## Shell Integrations

`bash/.bashrc.d/50-tools.sh` configures:

```text
bat       default theme/style/pager, plus b and catp aliases
fzf       fd-backed file search, Ctrl-T preview with bat, Alt-C directory search
fd/bat    fdfind and batcat fallbacks on Debian-style systems
```

## mise Tools

Listed in:

```text
mise/.config/mise/config.toml
```

Installed with:

```bash
mise install -y
mise run tools:install
```

The root `mise.toml` is only task shortcuts. It does not replace the global mise config.

## Taskfile Relation

`mise run <task>` is similar to `task <name>`, `just <name>`, or `make <target>`.

Here it is only a command menu:

```bash
mise run bootstrap
mise run doctor
```

The real setup logic stays in `scripts/`.

## Starship

Themes live in:

```text
~/.config/starship/
```

Switch themes:

```bash
starship-theme list
starship-theme current
starship-theme switch minimal
starship-theme switch default
```

The active theme is:

```text
~/.config/starship/current.toml
```

## Dotfiles

Stow owns dotfile links. I would not use `mise dotfiles` for the same files unless replacing Stow completely.
