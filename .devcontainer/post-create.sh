#!/usr/bin/env bash
set -euo pipefail

echo "==> ArcKit devcontainer post-create"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${WORKSPACE_ROOT}"

export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"

# Persist useful PATH entries for future terminals
grep -qxF 'export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"' ~/.bashrc \
  || echo 'export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc

# Use a user-owned npm global prefix
mkdir -p "$HOME/.npm-global"
npm config set prefix "$HOME/.npm-global"

# Source workspace .env (path resolved from this script — not a hardcoded mount)
# shellcheck disable=SC1091
source "${SCRIPT_DIR}/load-workspace-env.sh"

# Persist .env loading for future interactive terminals
LOAD_ENV_LINE=". \"${SCRIPT_DIR}/load-workspace-env.sh\""
# Remove stale hardcoded /workspaces/arckit/.env lines from older post-create runs
if [[ -f ~/.bashrc ]]; then
  sed -i '\|/workspaces/arckit/\.env|d' ~/.bashrc
fi
grep -qxF "${LOAD_ENV_LINE}" ~/.bashrc \
  || echo "${LOAD_ENV_LINE}" >> ~/.bashrc

# Configure Azure DevOps Git credentials if provided
if [ -n "${AZDO_USERNAME:-}" ] && [ -n "${AZDO_PAT:-}" ]; then
  printf 'protocol=https\nhost=dev.azure.com\nusername=%s\npassword=%s\n' "$AZDO_USERNAME" "$AZDO_PAT" \
    | git credential approve
fi

# --- Python / ArcKit CLI ---
if [[ -f pyproject.toml ]]; then
  echo "==> Installing arckit-cli in editable mode"
  python -m pip install --user -e .
  python -m pip install --user pytest pyyaml
else
  echo "==> No pyproject.toml — installing arckit-cli from GitHub"
  command -v uv >/dev/null || { echo "ERROR: uv is required but not installed"; exit 1; }
  uv tool install arckit-cli --from git+https://github.com/tractorjuice/arc-kit.git
fi

# --- Node ---
if [[ -f package-lock.json ]]; then
  echo "==> npm ci"
  npm ci
fi

if ! command -v markdownlint-cli2 >/dev/null 2>&1; then
  echo "==> Installing markdownlint-cli2"
  npm install -g markdownlint-cli2
fi

if ! command -v marp >/dev/null 2>&1; then
  echo "==> Installing @marp-team/marp-cli"
  npm install -g @marp-team/marp-cli
fi

# --- Git config (identity from .env GIT_USERNAME / GIT_EMAIL) ---
bash "${SCRIPT_DIR}/configure-git-from-env.sh" "${WORKSPACE_ROOT}"
git config --local credential.useHttpPath true
git config --global alias.wip '!f() { git add -A && git commit -m "${1:-WIP}" && git push; }; f'
git config --global alias.aliases "config --get-regexp '^alias.'"

echo "==> ArcKit install"
#https://arckit.org/getting-started.html
codex plugin marketplace add tractorjuice/arckit-codex

# --- Claude Code: install ArcKit plugins ---
# Shared with post-start.sh; idempotent and non-fatal (see script header).
bash "${SCRIPT_DIR}/install-arckit-claude-plugins.sh" || true

echo "==> Post-create complete"
