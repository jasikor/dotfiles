# jasikor dotfiles

[chezmoi](https://chezmoi.io) source state for Omarchy (Arch Linux): config
files plus the scripts that install packages, Rust, and the Omarchy bar plugins.
Tested on a fresh **Omarchy 4.0.4** install.

## TL;DR

```bash
sudo pacman -S --needed chezmoi github-cli                      # neither ships with Omarchy
gh auth login                                                   # GitHub.com -> HTTPS -> Login with a web browser
chezmoi init --apply https://github.com/jasikor/dotfiles.git    # 10-30 min, sudo prompts
chezmoi update                                                  # every update after that
```

`gh` prints an 8-character code; type it at <https://github.com/login/device> on
any device already signed in to GitHub. Answer **Yes** to "Authenticate Git with
your GitHub credentials?". Reboot when the first apply finishes.

## Setup

**1. GitHub access** — `gh` isn't part of Omarchy, so install it and log in. The
code is generated here and typed on another device, so the new machine never
needs your GitHub password:

```bash
sudo pacman -S --needed github-cli
gh auth login
#   GitHub.com -> HTTPS -> Login with a web browser
#   Authenticate Git with your GitHub credentials? -> Yes
```

`gh` prints the one-time code (and copies it to the clipboard) and opens
<https://github.com/login/device>. Enter that code there from your **phone, iPad
or another PC that's already signed in to GitHub**, then approve "GitHub CLI".
Missed the git prompt? Run `gh auth setup-git` afterwards.

*Alternatives:* `gh auth login` → *Paste an authentication token* (classic PAT,
`repo` scope, from <https://github.com/settings/tokens> — useful when no
clipboard is available), or an SSH key already registered on GitHub — copy
`id_ed25519{,.pub}` into `~/.ssh` (`chmod 600`) and use the
`git@github.com:jasikor/dotfiles.git` URL below. Private repos: `dotfiles`,
`local.hostname`, `local.workspaces`, `local.desktop-widgets`.

**2. chezmoi** — in Arch's `extra` repo:

```bash
sudo pacman -S --needed chezmoi
```

**3. First apply** — run it in a real terminal: the scripts call `sudo pacman`
and will prompt for your password inline. Log it:

```bash
chezmoi init --apply https://github.com/jasikor/dotfiles.git --verbose 2>&1 | tee ~/chezmoi-first-run.log
```

- `run_once_install-apps.sh` — rust via `omarchy-install-dev-env`, kitty,
  bitwarden, yazi, syncthing, git-delta, iosevka nerd font; rustup stable +
  nightly, rust-analyzer, rust-src, `cargo install bacon`
- `run_after_install-differ.sh` — builds `~/.local/bin/differ`
- `run_onchange_*` — Omarchy plugins `local.hostname`, `local.workspaces`,
  `local.desktop-widgets`; theme `vantablack`

Then **reboot**.

## Verify

```bash
chezmoi status          # prints nothing
chezmoi diff            # no pending changes
omarchy plugin list     # the three local.* plugins
command -v differ bacon
```

## Updating later

```bash
chezmoi update          # git pull --autostash --rebase, then apply
```

`run_once_*` scripts are keyed on their content hash, so they only re-run when
the script changes. To force one: `chezmoi state delete-bucket --bucket=scriptState`
then `chezmoi apply -v`.

## If something's off

- **Bar plugins missing, everything else fine** — plugin scripts end in `|| true`
  and no-op without working auth. Check `gh auth status`, re-run `gh auth login`,
  then `chezmoi apply -v`.
- **Git asks for a password** — `gh auth setup-git` missing or token expired.
- **`chezmoi update` does nothing** — expected right after `init --apply`.
