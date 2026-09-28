#!/usr/bin/env bash
# Apply git identity and workspace safety settings from environment variables
# (typically loaded from the workspace .env). Safe to run repeatedly.
set -euo pipefail

WORKSPACE_ROOT="${1:-}"
if [[ -z "${WORKSPACE_ROOT}" ]]; then
  WORKSPACE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

git config --global --add safe.directory "${WORKSPACE_ROOT}" >/dev/null 2>&1 || true
# Keep legacy mount name safe if present (older containers / docs).
git config --global --add safe.directory /workspaces/cairn >/dev/null 2>&1 || true
git config --global --add safe.directory /workspaces/arckit >/dev/null 2>&1 || true

git config --global core.eol lf
git config --global core.autocrlf input
git config --global --bool push.autoSetupRemote true

if [[ -n "${GIT_USERNAME:-}" ]]; then
  git config --global user.name "${GIT_USERNAME}"
  echo "==> git user.name = ${GIT_USERNAME}"
else
  echo "==> WARNING: GIT_USERNAME not set — add it to ${WORKSPACE_ROOT}/.env"
fi

if [[ -n "${GIT_EMAIL:-}" ]]; then
  git config --global user.email "${GIT_EMAIL}"
  echo "==> git user.email = ${GIT_EMAIL}"
else
  echo "==> WARNING: GIT_EMAIL not set — add it to ${WORKSPACE_ROOT}/.env"
fi

# GitHub HTTPS: prefer GIT_PAT over the VS Code OAuth helper (often missing org SAML SSO).
GITHUB_CREDENTIAL_HELPER="${WORKSPACE_ROOT}/.devcontainer/git-credential-github-pat.sh"
if [[ -n "${GIT_PAT:-}" ]] && [[ -x "${GITHUB_CREDENTIAL_HELPER}" ]]; then
  git config --global credential.https://github.com.useHttpPath false
  git config --global --replace-all credential.https://github.com.helper ""
  git config --global --add credential.https://github.com.helper "!${GITHUB_CREDENTIAL_HELPER}"
  export GH_TOKEN="${GIT_PAT}"
  echo "==> GitHub credentials configured from GIT_PAT (github.com + GH_TOKEN)"
else
  git config --global --unset-all credential.https://github.com.helper >/dev/null 2>&1 || true
  git config --global --unset-all credential.https://github.com.useHttpPath >/dev/null 2>&1 || true
  if [[ -z "${GIT_PAT:-}" ]]; then
    echo "==> WARNING: GIT_PAT not set — GitHub fetch/push may fail for SAML SSO orgs"
  fi
fi
