#!/bin/sh
# Keep differ in sync with the latest upstream main on every `chezmoi apply`
# (which `chezmoi update` also runs). `differ-update` is idempotent and rebuilds
# only when the upstream commit changed.
set -eu

[ -x "$HOME/.local/bin/differ-update" ] || exit 0
"$HOME/.local/bin/differ-update"
