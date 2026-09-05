#!/usr/bin/env bash
# Fail if tracked text files contain unredacted home paths or personal emails.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

# This file holds the detection patterns; do not scan it as content.
EXCLUDE_PATHSPEC=':(exclude)scripts/check-public-pii.sh'
errors=0

echo "== public-pii: home paths =="
path_hits="$(git -C "$ROOT" grep -I -n -E '/Users/[A-Za-z0-9._-]+|/home/[A-Za-z0-9._-]+' -- . "$EXCLUDE_PATHSPEC" 2>/dev/null || true)"
if [[ -n "$path_hits" ]]; then
  leaked="$(printf '%s\n' "$path_hits" | grep -vE '/(Users|home)/<redacted>' || true)"
  if [[ -n "$leaked" ]]; then
    echo "UNREDACTED home path(s):" >&2
    echo "$leaked" >&2
    errors=$((errors + 1))
  fi
fi

echo "== public-pii: personal or machine-local email =="
# Assemble tokens so this script does not contain a literal mailbox host.
consumer_hosts='gmail|googlemail|outlook|hotmail|yahoo|icloud|me|mac|live|msn'
machine_tlds='attlocal\.net|local'
machine_host='@Mac''Book'
email_hits="$(git -C "$ROOT" grep -I -n -iE \
  "[A-Za-z0-9._%+-]+@(${consumer_hosts})\\.[A-Za-z]{2,}|[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]*\\.(${machine_tlds})|${machine_host}" \
  -- . "$EXCLUDE_PATHSPEC" 2>/dev/null || true)"
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
