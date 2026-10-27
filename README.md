# jasikor dotfiles

[chezmoi](https://chezmoi.io) source state for Omarchy (Arch Linux): config
files plus the scripts that install packages, Rust, and the Omarchy bar plugins.
Tested on a fresh **Omarchy 4.0.4** install.

## TL;DR

```bash
sudo pacman -S --needed chezmoi
gh auth login                                                   # HTTPS -> "Paste an authentication token"
gh auth setup-git                                               # lets git use the token
chezmoi init --apply https://github.com/jasikor/dotfiles.git    # 10-30 min, sudo prompts
chezmoi update                                                  # every update after that
```

Create the classic token at <https://github.com/settings/tokens> (scope `repo`).
Reboot when the first apply finishes.

## Setup

**1. GitHub access** — preferred: a **classic personal access token** (simplest
to carry to a new machine, and it works for the private plugin repos too).
Create one at <https://github.com/settings/tokens> → *Generate new token
(classic)*, scope `repo`, then:

```bash
gh auth login            # GitHub.com -> HTTPS -> "Paste an authentication token"
gh auth setup-git        # lets git use the token
```

In the `gh` prompts choose **Paste an authentication token** and paste the PAT —
do not pick "Login with a web browser".

*Alternatives:* `gh auth login` → *Login with a web browser* (device-code flow),
or an SSH key — copy `id_ed25519{,.pub}` into `~/.ssh` (`chmod 600`) and use the
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
  and no-op without working auth. Re-run `gh auth login` (paste a token) +
  `gh auth setup-git`, then `chezmoi apply -v`.
- **Git asks for a password** — `gh auth setup-git` missing or token expired.
- **`chezmoi update` does nothing** — expected right after `init --apply`.
