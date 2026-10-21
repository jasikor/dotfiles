#!/bin/sh
# Install/update and enable the Omarchy workspaces bar widget.
set -eu

command -v omarchy >/dev/null 2>&1 || exit 0

PLUGIN_ID="local.workspaces"
SSH_URL="git@github.com:jasikor/local.workspaces.git"
HTTPS_URL="https://github.com/jasikor/local.workspaces.git"

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

# The manifest's clonedFrom makes the widget replace the stock
# omarchy.workspaces entry in place, so no bar placement is needed here.
if omarchy plugin list --json 2>/dev/null | jq -e --arg id "$PLUGIN_ID" 'any(.[]; .id == $id)' >/dev/null 2>&1; then
  omarchy plugin update "$PLUGIN_ID" --yes || true
  omarchy plugin enable "$PLUGIN_ID" || true
else
  install_plugin || true
fi

omarchy restart shell || true
