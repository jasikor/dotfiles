#!/bin/bash
# Bootstrap installer. Runs once per machine; re-runs if this file changes.
set -euo pipefail

omarchy-install-terminal kitty
sudo pacman -S --needed --noconfirm ttf-iosevka-nerd bitwarden yazi syncthing
rustup default stable
rustup toolchain install nightly
rustup component add rust-analyzer rust-src
rustup component add rust-analyzer rust-src --toolchain nightly
cargo install --locked bacon
