# Offline Pack

`offline-pack` creates a portable directory containing compressed payload parts, base64-encoded chunks, checksums, logs, and a manifest. It is useful when a file or directory needs to move through a constrained or disconnected path.

## Location

It is managed as a Stow package:

```text
offline-pack/.local/bin/offline-pack -> ~/.local/bin/offline-pack
offline-pack/.local/share/offline-pack -> ~/.local/share/offline-pack
```

The shared shell library lives in:

```text
~/.local/share/offline-pack/offline-pack-lib
```

## Commands

```text
offline-pack      create a package
offline-verify    verify checksums and compressed payload integrity
offline-list      show manifest and payload files
offline-restore   restore a package
```

## Create

```bash
offline-pack ./file-or-dir
```

Useful options:

```bash
offline-pack --split-size 150Mi --max-total-size 3Gi ./dir
offline-pack --output-root /tmp/offline-packs ./dir
offline-pack --no-keep-xz ./dir
```

By default packages are written under:

```text
${XDG_STATE_HOME:-~/.local/state}/offline-packs
```

## Verify

```bash
offline-verify ~/.local/state/offline-packs/offline-pack-YYYYmmdd-HHMMSS
```

This checks part checksums when available and tests the reconstructed xz payload.

## Inspect

```bash
offline-list ~/.local/state/offline-packs/offline-pack-YYYYmmdd-HHMMSS
```

## Restore

```bash
offline-restore ~/.local/state/offline-packs/offline-pack-YYYYmmdd-HHMMSS
```

Restore into a specific directory:

```bash
offline-restore ~/.local/state/offline-packs/offline-pack-YYYYmmdd-HHMMSS ./restored
```

## Repo Choice

This currently lives in the dotfiles repo because it is small and part of the personal command set. If it grows into a reusable project with releases, tests, or external users, split it into a separate repo and install it as a normal CLI. Avoid a submodule unless this repo must pin an external version exactly.
