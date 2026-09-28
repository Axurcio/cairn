#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# --- Load workspace .env and ensure git identity ---
# post-create may have run before .env existed, or against a renamed mount.
# Re-apply on every start so GIT_USERNAME / GIT_EMAIL always drive git commits.
# shellcheck disable=SC1091
source "${SCRIPT_DIR}/load-workspace-env.sh"
bash "${SCRIPT_DIR}/configure-git-from-env.sh" "${WORKSPACE_ROOT}"

# Keep interactive shells loading .env even if post-create used an old path
LOAD_ENV_LINE=". \"${SCRIPT_DIR}/load-workspace-env.sh\""
if [[ -f ~/.bashrc ]]; then
  sed -i '\|/workspaces/arckit/\.env|d' ~/.bashrc
fi
grep -qxF "${LOAD_ENV_LINE}" ~/.bashrc \
  || echo "${LOAD_ENV_LINE}" >> ~/.bashrc

# --- Claude Code: ArcKit plugin safety net ---
# On a cold first create the VS Code extension may not be installed yet when
# post-create runs, so the plugin install there can no-op. This runs on every
# start; it's idempotent (fast no-op once installed) and non-fatal.
bash "$(dirname "${BASH_SOURCE[0]}")/install-arckit-claude-plugins.sh" || true

# --- Cursor: mirror ArcKit + arckit slash commands into .cursor/commands ---
bash "$(dirname "${BASH_SOURCE[0]}")/sync-cursor-commands.sh" || true
