# SSH keys

Do not commit private keys.

Generate a home key:

```bash
ssh-keygen -t ed25519 -C "your-email@example.com" -f ~/.ssh/id_ed25519_home
```

Generate a work key:

```bash
ssh-keygen -t ed25519 -C "work-email@example.com" -f ~/.ssh/id_ed25519_work
```

Or use the shell helper:

```bash
git_ssh_key your-email@example.com home
git_ssh_key work-email@example.com work
```

If you omit the email, `git_ssh_key` uses `git config --global user.email`.

Start agent and add key:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_home
```

Print public key:

```bash
cat ~/.ssh/id_ed25519_home.pub
```

Test GitHub:

```bash
ssh -T git@github.com
```

Test a custom host from `~/.ssh/config`:

```bash
ssh -T git@github-home
```
