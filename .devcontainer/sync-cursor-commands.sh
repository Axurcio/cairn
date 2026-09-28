#!/usr/bin/env bash
# Mirror ArcKit + arckit slash commands into .cursor/commands for Cursor Agent.
#
# Cursor binds command name to filename (hyphens, not colons): arckit-adr.md -> /arckit-adr
# Sources:
#   - ArcKit Claude marketplace plugins (~300 commands, deduped by priority)
#   - .arckit/plugin-arckit/commands (project-specific arckit workflows)
set -euo pipefail

WORKSPACE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMMANDS_DIR="${WORKSPACE_ROOT}/.cursor/commands"
MARKETPLACE="${HOME}/.claude/plugins/marketplaces/arc-kit/plugins"
arckit_SRC="${WORKSPACE_ROOT}/.arckit/plugin-arckit/commands"

mkdir -p "${COMMANDS_DIR}"

# Remove only symlinks from prior syncs; leave hand-authored command files intact.
find "${COMMANDS_DIR}" -maxdepth 1 -type l -delete 2>/dev/null || true

declare -A seen=()
arckit_count=0
arckit_count=0

# Prefer core plugin, then repo/agent overlays, then jurisdiction packs.
PLUGIN_ORDER=(
  arckit-claude
  arckit-repo
  arckit-agent-architecture
  arckit-togaf-adm
  arckit-au
  arckit-uae
  arckit-fr
  arckit-ca
  arckit-eu
  arckit-at
  arckit-nl
  arckit-us
  arckit-uk-nhs
  arckit-uk-finance
  arckit-uk-gcloud
  arckit-au-energy
  arckit-fde
)

link_arckit_commands() {
  local plugin src base dest
  for plugin in "${PLUGIN_ORDER[@]}"; do
    local dir="${MARKETPLACE}/${plugin}/commands"
    [[ -d "${dir}" ]] || continue
    for src in "${dir}"/*.md; do
      [[ -f "${src}" ]] || continue
      base="$(basename "${src}" .md)"
      [[ -n "${seen[${base}]:-}" ]] && continue
      seen["${base}"]=1
      dest="${COMMANDS_DIR}/arckit-${base}.md"
      ln -sf "${src}" "${dest}"
      arckit_count=$((arckit_count + 1))
    done
  done
}

link_arckit_commands() {
  local src base dest
  [[ -d "${arckit_SRC}" ]] || return 0
  for src in "${arckit_SRC}"/*.md; do
    [[ -f "${src}" ]] || continue
    base="$(basename "${src}" .md)"
    dest="${COMMANDS_DIR}/arckit-${base}.md"
    ln -sf "${src}" "${dest}"
    arckit_count=$((arckit_count + 1))
  done
}

if [[ -d "${MARKETPLACE}" ]]; then
  link_arckit_commands
else
  echo "==> WARNING: ArcKit marketplace not found at ${MARKETPLACE}"
  echo "    Run: bash .devcontainer/install-arckit-claude-plugins.sh"
fi

link_arckit_commands

# --- Install arckit CLI wrappers on PATH ---
arckit_BIN="${WORKSPACE_ROOT}/.arckit/bin"
mkdir -p "${HOME}/.local/bin"
if [[ -d "${arckit_BIN}" ]]; then
  for script in "${arckit_BIN}"/*; do
    [[ -f "${script}" ]] || continue
    base="$(basename "${script}")"
    [[ "${base}" == _* ]] && continue
    chmod +x "${script}"
    ln -sf "${script}" "${HOME}/.local/bin/${base}"
  done
  echo "==> arckit CLI installed -> ${HOME}/.local/bin (arckit, arckit-confluence-markdown-*)"
fi

echo "==> Cursor commands synced: ${arckit_count} arckit, ${arckit_count} arckit -> ${COMMANDS_DIR}"
