# Install

```bash
git clone git@github.com:TheGodZeno/dotfiles.git ~/dotfiles
cd ~/dotfiles
./scripts/bootstrap
```

What bootstrap does:

```text
install OS packages
install mise and starship if missing
prepare tmux TPM
prepare local Git config files
stow dotfiles into $HOME
select default Starship theme
run mise install
```

Useful commands:

```bash
./scripts/bootstrap --no-tools     # relink dotfiles only
./scripts/bootstrap-tools          # install system tools + mise/starship
./scripts/bootstrap-git            # create local Git identity files
./scripts/doctor                   # check setup
```

mise wrappers from repo root:

```bash
mise run bootstrap
mise run bootstrap:no-tools
mise run doctor
mise run tools:install
```

After bootstrap, helper commands such as `~/.local/bin/starship-theme` and `~/.local/bin/kubectl-krew` should exist. If only the theme command is missing, relink the Starship package:

```bash
stow -R -t "$HOME" starship
```

If only the `kubectl-krew` wrapper is missing, relink the mise package:

```bash
stow -R -t "$HOME" mise
```
