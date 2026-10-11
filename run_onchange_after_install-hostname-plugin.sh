#!/bin/sh
# Install/update and configure the Omarchy hostname bar widget.
set -eu

command -v omarchy >/dev/null 2>&1 || exit 0

PLUGIN_ID="local.hostname"
SSH_URL="git@github.com:jasikor/local.hostname.git"
HTTPS_URL="https://github.com/jasikor/local.hostname.git"

# Try SSH (non-interactive); fall back to HTTPS using gh's token.
install_plugin() {
  GIT_TERMINAL_PROMPT=0 \
  GIT_SSH_COMMAND="ssh -o BatchMode=yes -o StrictHostKeyChecking=accept-new" \
    omarchy plugin add "$SSH_URL" --enable --yes && return 0

  if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
    GIT_TERMINAL_PROMPT=0 \
    GIT_CONFIG_COUNT=1 \
    GIT_CONFIG_KEY_0="credential.https://github.com.helper" \
    GIT_CONFIG_VALUE_0="!gh auth git-credential" \
      omarchy plugin add "$HTTPS_URL" --enable --yes && return 0
  fi
  return 1
}

install_plugin || true

# Placement + appearance.
omarchy bar move "$PLUGIN_ID" --section left --index 1 || true
omarchy bar set "$PLUGIN_ID" fontSize 15 || true
omarchy bar set "$PLUGIN_ID" weight black || true
omarchy bar set "$PLUGIN_ID" color "#ffbf00" || true
omarchy restart shell || true
