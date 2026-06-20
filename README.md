# Dotfiles

Personal dotfiles managed with GNU Stow.

## Start

Clone the repo:

```bash
git clone git@github.com:TheGodZeno/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Run bootstrap:

```bash
./scripts/bootstrap
```

The bootstrap script installs common tools for the detected distro, installs mise if needed, prepares tmux TPM, creates local Git config files from the examples if they are missing, and stows the dotfile packages into `$HOME`.

To skip OS package and mise setup while still preparing tmux and stowing files:

```bash
./scripts/bootstrap --no-tools
```

Check the setup without changing dotfiles:

```bash
./scripts/doctor
```

## Update

Pull the latest repo changes and restow:

```bash
git pull
./scripts/bootstrap --no-tools
```

Run the doctor after larger changes:

```bash
./scripts/doctor
```

## Packages

Each top-level directory is a Stow package whose layout mirrors `$HOME`.

```text
bash/.bashrc                 -> ~/.bashrc
tmux/.config/tmux/tmux.conf  -> ~/.config/tmux/tmux.conf
git/.gitconfig               -> ~/.gitconfig
```

Current bootstrap packages:

```text
bash git tmux starship lazygit mise
```

Useful Stow commands:

```bash
stow -n -v -t "$HOME" git        # preview what would be linked
stow -t "$HOME" git              # link one package
stow -D -t "$HOME" git           # unlink one package
stow -R -t "$HOME" git           # relink one package
stow --adopt -t "$HOME" bash     # move existing files into the package
```

Common flags:

```text
-t, --target     target directory, usually $HOME
-n, --simulate   dry run without changing files
-v, --verbose    print planned actions
-D, --delete     unstow/unlink
-R, --restow     unstow then stow again
--adopt          move existing target files into the package; inspect git diff after
```

## Git Identity

Public Git config lives in `git/.gitconfig`. Private identity files are ignored by Git but can still be stowed:

```text
git/.gitconfig.local -> ~/.gitconfig.local
git/.gitconfig.work  -> ~/.gitconfig.work
```

Bootstrap creates those files from `examples/` only if they do not already exist. Edit them after the first run. Change the work repository path in `git/.gitconfig` if your work repos are not under `~/code/work/`.

## Local Overrides

Machine-specific Bash settings can live in:

```text
~/.bashrc.local
```

That file is sourced by `bash/.bashrc.d/99-local.sh` and is intentionally outside the repo.

## Git Defaults

The shared Git config includes a few quality-of-life defaults:

```text
commit.verbose = true          show staged diff in the commit editor
help.autoCorrect = prompt      suggest typo fixes, but ask before running them
status.showStash = true        show stash count in git status
rebase.autoSquash = true       auto-order fixup!/squash! commits in interactive rebase
push.followTags = true         push annotated tags reachable from pushed commits
diff.algorithm = histogram     produce cleaner diffs
diff.colorMoved = default      highlight moved code blocks
merge.conflictStyle = zdiff3   include the original base in conflicts
rerere.enabled = true          remember repeated conflict resolutions
```

## Secrets

Do not commit secrets or machine-local private files:

```text
SSH private keys
API tokens
passwords
private certificates
private Git identity files
machine-local shell overrides
```

Private Git identity files live in the repo working tree so Stow can link them, but they are ignored by Git:

```text
git/.gitconfig.local
git/.gitconfig.work
```

## Docs

- [Install](docs/install.md)
- [GNU Stow](docs/stow.md)
- [Tools](docs/tools.md)
- [SSH](docs/ssh.md)
- [Git cheatsheet](docs/cheatsheets/git.md)
- [Certificates cheatsheet](docs/cheatsheets/certs.md)
- [OpenShift cheatsheet](docs/cheatsheets/oc.md)
