# Install

Clone the repo:

```bash
git clone git@github.com:TheGodZeno/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Run bootstrap:

```bash
./scripts/bootstrap
```

Skip OS package and mise setup while still stowing dotfiles and preparing tmux:

```bash
./scripts/bootstrap --no-tools
```

Only install mise and skip OS packages:

```bash
./scripts/bootstrap-tools --no-packages
```

Only prepare local Git config examples:

```bash
./scripts/bootstrap-git
```
