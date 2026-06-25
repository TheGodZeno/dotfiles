# offline-pack

Small shell toolkit for packaging files or directories for disconnected environments.

Commands:

- `offline-pack`: create a compressed, split, base64 package.
- `offline-verify`: verify checksums and compressed payload integrity.
- `offline-list`: show manifest and payload files.
- `offline-restore`: restore a package.

Default output root:

```text
${XDG_STATE_HOME:-~/.local/state}/offline-packs
```
