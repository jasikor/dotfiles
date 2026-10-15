#!/bin/sh
# Install/update and enable the Omarchy desktop-widgets plugin
# (machine name + waybar-style workspace switcher drawn behind windows).
set -eu

command -v omarchy >/dev/null 2>&1 || exit 0

PLUGIN_ID="local.desktop-widgets"
SSH_URL="git@github.com:jasikor/local.desktop-widgets.git"
HTTPS_URL="https://github.com/jasikor/local.desktop-widgets.git"

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

if omarchy plugin list --json 2>/dev/null | jq -e --arg id "$PLUGIN_ID" 'any(.[]; .id == $id)' >/dev/null 2>&1; then
  # Already installed: refresh from git (non-interactive fast-forward).
  omarchy plugin update "$PLUGIN_ID" --yes || true
else
  install_plugin || true
fi

# Panels are enabled by an entry in shell.json's plugins[].
omarchy plugin enable "$PLUGIN_ID" || true

omarchy restart shell || true
