#!/usr/bin/env bash
# Git credential helper: authenticate to github.com using GIT_PAT from workspace .env.
# Overrides the VS Code OAuth helper, which often lacks SAML SSO authorization for org repos.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck disable=SC1091
source "${SCRIPT_DIR}/load-workspace-env.sh"

case "${1:-}" in
  get)
    if [[ -z "${GIT_PAT:-}" ]]; then
      exit 1
    fi
    printf 'username=x-access-token\npassword=%s\n' "${GIT_PAT}"
    ;;
  store|erase)
    ;;
  *)
    exit 1
    ;;
esac
