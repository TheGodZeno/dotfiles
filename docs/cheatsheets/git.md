# Git commands

Show config origin:

```bash
git config --show-origin --get-regexp 'user.name|user.email|core.sshCommand'
```

Cherry-pick one commit:

```bash
git cherry-pick <commit>
```

Show stash patch:

```bash
git stash show -p stash@{0}
```
