# GNU Stow

Each top-level directory is a Stow package. The package layout mirrors `$HOME`.

Example:

```text
bash/.bashrc -> ~/.bashrc
bash/.bashrc.d/30-functions.sh -> ~/.bashrc.d/30-functions.sh
```

Stow one package:

```bash
stow -t "$HOME" bash
```

Preview one package before changing links:

```bash
stow -n -v -t "$HOME" bash
```

Relink one package:

```bash
stow -R -t "$HOME" starship
```

Preview relinking one package:

```bash
stow -n -v -R -t "$HOME" starship
```

Stow all common packages:

```bash
stow -t "$HOME" bash git tmux starship lazygit mise
```

Preview all common packages:

```bash
stow -n -v -t "$HOME" bash git tmux starship lazygit mise
```

Show current Stow-owned links for a package:

```bash
stow -n -v -D -t "$HOME" starship
```

Unstow:

```bash
stow -D -t "$HOME" bash
```

Adopt an existing file into the repo:

```bash
stow --adopt -t "$HOME" bash
git diff
```

Always check the diff after `--adopt`.
