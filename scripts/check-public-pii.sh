#!/usr/bin/env bash
# Fail if tracked text files contain unredacted home paths or personal emails.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

errors=0

echo "== public-pii: home paths =="
path_hits="$(git -C "$ROOT" grep -I -n -E '/Users/[A-Za-z0-9._-]+|/home/[A-Za-z0-9._-]+' -- . 2>/dev/null || true)"
if [[ -n "$path_hits" ]]; then
  leaked="$(printf '%s\n' "$path_hits" | grep -vE '/(Users|home)/<redacted>' || true)"
  if [[ -n "$leaked" ]]; then
    echo "UNREDACTED home path(s):" >&2
    echo "$leaked" >&2
    errors=$((errors + 1))
  fi
fi

echo "== public-pii: personal or machine-local email =="
email_hits="$(git -C "$ROOT" grep -I -n -iE \
  '[A-Za-z0-9._%+-]+@(gmail|googlemail|outlook|hotmail|yahoo|icloud|me|mac|live|msn)\.[A-Za-z]{2,}|[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]*\.(attlocal\.net|local)|@MacBook' \
  -- . 2>/dev/null || true)"
if [[ -n "$email_hits" ]]; then
  echo "PERSONAL or machine-local email(s):" >&2
  echo "$email_hits" >&2
  errors=$((errors + 1))
fi

if [[ "$errors" -gt 0 ]]; then
  echo "check-public-pii: FAILED ($errors classes)" >&2
  exit 1
fi
echo "check-public-pii: ok"
