#!/bin/sh
# Desired Omarchy theme. Edit the name below to reconcile; chezmoi re-runs this
# script only when its contents change (run_onchange_), after files are applied.
set -eu

command -v omarchy >/dev/null 2>&1 || exit 0

omarchy theme set vantablack || true
