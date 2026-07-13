# Offline Pack

`offline-pack` moves files through disconnected or limited environments.

## Create

```bash
offline-pack ./file-or-dir
```

Outputs:

```text
offline-pack-YYYYmmdd-HHMMSS/        directory package
offline-pack-YYYYmmdd-HHMMSS.tar.xz  full bundle archive
```

The `.tar.xz` bundle contains the manifest, checksums, logs, base64 parts, and payload.

## Use

Directory form and `.tar.xz` form both work:

```bash
offline-verify PATH
offline-list PATH
offline-restore PATH
offline-restore PATH ./restored
```

## Options

```bash
offline-pack --split-size 150Mi ./dir
offline-pack --max-total-size 3Gi ./dir
offline-pack --output-root /tmp/offline-packs ./dir
offline-pack --no-keep-xz ./dir
```

Default output root:

```text
${XDG_STATE_HOME:-~/.local/state}/offline-packs
```

## Files

Installed by Stow:

```text
offline-pack/.local/bin/offline-pack
offline-pack/.local/bin/offline-verify
offline-pack/.local/bin/offline-list
offline-pack/.local/bin/offline-restore
offline-pack/.local/share/offline-pack/offline-pack-lib
```
