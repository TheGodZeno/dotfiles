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

Stow all common packages:

```bash
stow -t "$HOME" bash git tmux starship lazygit mise
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
