# dotfiles

Josh's personal dotfiles, managed with [chezmoi](https://chezmoi.io). Linux for now.

## New machine

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply jbilligmeier
```

## Day to day

| Command | What it does |
|---|---|
| `cz edit ~/.zshrc` | edit a managed file (source copy) |
| `cz diff` / `cz apply` | preview / write changes into `~` |
| `cz re-add` | pull direct edits of managed files back into the source |
| `cz cd` | open a shell in the repo to commit and push |
| `reload` | `chezmoi update` + reload zsh |

## Layout

- `dot_*` files map to `~/.*`; `*.tmpl` files are templates.
- `.chezmoiscripts/` install apt packages, GitHub-release tools (into
  `~/.local/bin`), oh-my-zsh, and sync LazyVim plugins.
- `.eza/` holds the vendored Tokyo Night eza theme plus custom colors;
  `dot_config/eza/theme.yml.tmpl` merges them. Edit `.eza/extensions.yml`.
- Machine-specific settings and secrets go in `~/.zshrc.local` (not tracked).
