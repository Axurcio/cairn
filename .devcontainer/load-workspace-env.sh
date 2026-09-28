#!/usr/bin/env bash
# Load the workspace .env into the current shell (idempotent helper).
# Sourced from post-create, post-start, and interactive bashrc.
#
# Resolves the workspace from this script's location so it works whether the
# folder is mounted as /workspaces/arckit, /workspaces/arckit, or another name.

_arckit_env_script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_arckit_workspace_root="$(cd "${_arckit_env_script_dir}/.." && pwd)"
_arckit_env_file="${_arckit_workspace_root}/.env"

if [[ -f "${_arckit_env_file}" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "${_arckit_env_file}"
  set +a
fi

if [[ -n "${GIT_PAT:-}" ]]; then
  export GH_TOKEN="${GIT_PAT}"
fi

unset _arckit_env_script_dir _arckit_workspace_root _arckit_env_file
