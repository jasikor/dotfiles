#!/bin/bash
# Bootstrap installer. Runs once per machine; re-runs if this file changes.
set -euo pipefail

# Rust: rustup supplies cargo/rustc and is not part of the Omarchy base image.
# Install it via Omarchy's dev-env recipe so the toolchain steps below succeed
# on a fresh machine (installs into $HOME/.cargo, no sudo).
if ! command -v rustup >/dev/null 2>&1 && [ ! -x "$HOME/.cargo/bin/rustup" ]; then
  omarchy-install-dev-env rust
fi
# Non-interactive shells don't pick up rustup's profile edit; do it here so the
# rustup/cargo calls below resolve.
export PATH="$HOME/.cargo/bin:$PATH"

omarchy-install-terminal kitty
sudo pacman -S --needed --noconfirm ttf-iosevka-nerd bitwarden yazi syncthing git-delta
rustup default stable
rustup toolchain install nightly
rustup component add rust-analyzer rust-src
rustup component add rust-analyzer rust-src --toolchain nightly
cargo install --locked bacon
