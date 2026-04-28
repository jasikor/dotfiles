#!/bin/bash
# Bootstrap installer. Runs once per machine; re-runs if this file changes.
set -euo pipefail

# --- Terminal ---
omarchy-install-terminal kitty
