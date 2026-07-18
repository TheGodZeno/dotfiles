# Dotfiles

Personal Linux dotfiles managed with GNU Stow.

## Start

```bash
git clone git@github.com:TheGodZeno/dotfiles.git ~/dotfiles
cd ~/dotfiles
./scripts/bootstrap
```

Bootstrap installs required tools, prepares local files, stows dotfiles into `$HOME`, and installs mise tools.

## Common Commands

```bash
./scripts/bootstrap --no-tools   # relink dotfiles only
./scripts/doctor                 # check setup
mise run bootstrap               # same bootstrap through mise
mise run doctor                  # same doctor through mise
```

## Layout

```text
bash/          shell config
git/           git config
tmux/          tmux config
starship/      prompt config and themes
mise/          global mise tools config
lazygit/       lazygit config
scripts/       bootstrap and checks
docs/          details and notes
```

## Local Files

Private or machine-specific files stay out of Git:

```text
~/.bashrc.local
git/.gitconfig.local
git/.gitconfig.work
SSH keys and secrets
```

## Docs

- [Install](docs/install.md)
- [Tools and mise](docs/tools.md)
- [Stow](docs/stow.md)
- [SSH](docs/ssh.md)
- [Git cheatsheet](docs/cheatsheets/git.md)
- [Certificates cheatsheet](docs/cheatsheets/certs.md)
- [OpenShift cheatsheet](docs/cheatsheets/oc.md)
