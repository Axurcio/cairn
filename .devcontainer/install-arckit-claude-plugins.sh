#!/usr/bin/env bash
set -euo pipefail

# Install the ArcKit Claude Code plugins.
#
# The VS Code extension enables these plugins in .claude/settings.json but never
# *installs* them, so installed_plugins.json stays empty and none of the arckit
# slash commands load. This script adds the marketplace and installs each enabled
# plugin. It is:
#   - idempotent: exits fast when every enabled plugin is already installed
#   - non-fatal:  never fails its caller (post-create.sh / post-start.sh) if the
#                 Claude CLI isn't available yet (e.g. extension still loading)
#
# Sourced/called from both post-create.sh (fixes rebuilds) and post-start.sh
# (safety net for the first cold create, when the extension may not be ready
# until after post-create has already run).

WORKSPACE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SETTINGS="$WORKSPACE_ROOT/.claude/settings.json"
INSTALLED="$HOME/.claude/plugins/installed_plugins.json"

# Plugins enabled in .claude/settings.json, e.g. "arckit@arc-kit". Deriving the
# list keeps this in sync as plugins are added/removed there.
enabled_plugins() {
  python3 -c 'import json,sys
try:
    d=json.load(open(sys.argv[1]))
except Exception:
    sys.exit(0)
print("\n".join(k for k,v in d.get("enabledPlugins",{}).items() if v and k.endswith("@arc-kit")))' \
    "$SETTINGS" 2>/dev/null || true
}

# True when every enabled plugin already appears in installed_plugins.json.
all_installed() {
  python3 -c 'import json,sys
try:
    settings=json.load(open(sys.argv[1]))
    installed=json.load(open(sys.argv[2])).get("plugins",{})
except Exception:
    sys.exit(1)
want=[k for k,v in settings.get("enabledPlugins",{}).items() if v and k.endswith("@arc-kit")]
sys.exit(0 if want and all(k in installed for k in want) else 1)' \
    "$SETTINGS" "$INSTALLED" 2>/dev/null
}

resolve_claude() {
  local bin
  bin="$(command -v claude || true)"
  if [[ -z "$bin" ]]; then
    # CLI bundled with the VS Code extension (pick the latest version dir)
    bin="$(ls -d "$HOME"/.vscode-server/extensions/anthropic.claude-code-*/resources/native-binary/claude 2>/dev/null | sort -V | tail -n1 || true)"
  fi
  [[ -n "$bin" && -x "$bin" ]] && printf '%s' "$bin"
}

install_arckit_claude_plugins() {
  if all_installed; then
    echo "==> ArcKit Claude plugins already installed — nothing to do"
    return 0
  fi

  local claude_bin
  claude_bin="$(resolve_claude)"
  if [[ -z "$claude_bin" ]]; then
    echo "==> claude CLI not found yet — run '/plugin' in Claude Code, or re-run"
    echo "    this once the extension has loaded, to install the arckit plugins."
    return 0
  fi

  echo "==> Installing ArcKit plugins for Claude Code (using $claude_bin)"
  "$claude_bin" plugin marketplace add tractorjuice/arc-kit 2>&1 \
    || echo "    marketplace 'arc-kit' already registered"

  local plugins
  plugins="$(enabled_plugins)"
  [[ -z "$plugins" ]] && plugins="arckit@arc-kit"

  while IFS= read -r p; do
    [[ -z "$p" ]] && continue
    echo "    installing $p"
    "$claude_bin" plugin install "$p" 2>&1 | tail -1 || echo "    ($p install skipped/failed)"
  done <<< "$plugins"
}

# Allow running this file directly as well as being sourced.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  install_arckit_claude_plugins || true
fi
