#!/bin/bash
# Bootstrap installer. Runs once per machine; re-runs if this file changes.
set -euo pipefail

omarchy-install-terminal kitty
sudo pacman -S --needed --noconfirm ttf-iosevka-nerd bitwarden rust-analyzer yazi syncthing
cargo install --locked bacon
