# tmux

Prefix is `C-a`.

## Common Keys

```text
prefix r    reload config
prefix H    help popup
prefix T    theme menu
prefix S    fuzzy session picker
prefix W    fuzzy window picker
prefix P    fuzzy pane picker
prefix E    tmux tree view
prefix c    create named window in popup
prefix C    create named session in popup
prefix ,    rename window in popup
prefix $    rename session in popup
prefix h    pane left
prefix j    pane down
prefix k    pane up
prefix l    pane right
prefix |    split horizontal
prefix -    split vertical
```

## Theme

The status line uses Catppuccin through TPM.

Available theme flavors:

```text
mocha
macchiato
frappe
latte
```

Switch inside tmux:

```text
prefix T
```

The menu changes the current tmux server theme. The default in `tmux.conf` is `mocha`.

Tmux supports rounded popup/menu borders and rounded window tabs. Pane borders
are terminal grid lines, so they can be colored but not truly rounded.

The window list uses rounded tabs with the tmux window name and a terminal icon.
Use `prefix c` or `prefix ,` to choose names that stay readable.

The right status line shows the current app, CPU, RAM, session, and uptime.
Battery is left out by default because WSL and VMs often report it as `0%`.

Window tabs use a terminal icon plus the window name. Rename windows when the
name stops being useful:

```text
prefix ,
```

## Pickers And Tree

Use fzf popups for quick jumps:

```text
prefix S    sessions
prefix W    windows
prefix P    panes
```

Use tmux tree mode to see the whole hierarchy:

```text
prefix E
```

Tree mode shows sessions, windows, and panes with a preview. Inside tree mode:

```text
Enter      switch to selected item
Right      expand
Left       collapse
x          kill selected item
q          quit
```

## Names

New windows and sessions ask for a name in a popup:

```text
prefix c    new window
prefix C    new session
```

Automatic renaming is disabled, so shell titles should not replace useful names
with repeated hostnames.

## Restore

Resurrect and Continuum save tmux state under:

```text
~/.local/share/tmux/resurrect
```

Useful keys:

```text
prefix Ctrl-s    save now
prefix Ctrl-r    restore
```

Continuum saves every 15 minutes and restores automatically when tmux starts.

## Plugins

Configured plugins:

```text
tmux-plugins/tpm
catppuccin/tmux
tmux-plugins/tmux-cpu
tmux-plugins/tmux-resurrect
tmux-plugins/tmux-continuum
```

After changing plugins, open tmux and press:

```text
prefix I
```

TPM installs plugins under:

```text
~/.local/share/tmux/plugins
```
