# offline-pack

Small shell toolkit for moving files through disconnected or limited environments.

It creates a package directory and a full `.tar.xz` bundle. The bundle contains the same package directory, including manifest, checksums, logs, base64 parts, and compressed payload.

## Commands

```text
offline-pack      create a package
offline-verify    verify a package directory or .tar.xz bundle
offline-list      show manifest and payload files
offline-restore   restore content from a package directory or .tar.xz bundle
```

## Quick Use

```bash
offline-pack ./file-or-dir
offline-verify ~/.local/state/offline-packs/offline-pack-YYYYmmdd-HHMMSS.tar.xz
offline-list ~/.local/state/offline-packs/offline-pack-YYYYmmdd-HHMMSS.tar.xz
offline-restore ~/.local/state/offline-packs/offline-pack-YYYYmmdd-HHMMSS.tar.xz ./restored
```

## Output

Default output root:

```text
${XDG_STATE_HOME:-~/.local/state}/offline-packs
```

For each run:

```text
offline-pack-YYYYmmdd-HHMMSS/
offline-pack-YYYYmmdd-HHMMSS.tar.xz
```

The directory is useful when you need to inspect or copy individual base64 parts. The `.tar.xz` bundle is useful when you can move one binary file.

## Package Layout

```text
manifest.txt
inputs.txt
payload/
  payload.xz or payload.tar.xz
  part-0000.b64
checksums/
  original.sha256
  parts.sha256
  bundle.sha256
logs/
  pack.out
  restore.out
```

## Options

```bash
offline-pack --split-size 150Mi ./dir
offline-pack --max-total-size 3Gi ./dir
offline-pack --output-root /tmp/offline-packs ./dir
offline-pack --no-keep-xz ./dir
```

## Implementation

The command scripts live in `~/.local/bin`.

Shared logic lives in:

```text
~/.local/share/offline-pack/offline-pack-lib
```

Keep command scripts focused on user flow. Put repeated package opening, payload reconstruction, checksum, and size helpers in the lib.
