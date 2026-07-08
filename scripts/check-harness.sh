#!/usr/bin/env bash
# Validate harness scaffold for policy-mirror profile.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

errors=0
PROFILE="$(grep '^profile:' .harness/profile.yaml 2>/dev/null | awk '{print $2}' || echo policy-mirror)"

require_file() {
  if [[ ! -f "$1" ]]; then
    echo "MISSING: $1" >&2
    errors=$((errors + 1))
  fi
}

echo "== harness: contract (profile=$PROFILE) =="
require_file ".harness/profile.yaml"
require_file ".harness/VERSION"
require_file "AGENTS.md"
require_file "scripts/verify.sh"
require_file ".cursor/hooks.json"
require_file "specs/portfolio.yaml"

if [[ "$PROFILE" != "policy-mirror" ]]; then
  echo "WARN: expected profile policy-mirror, got $PROFILE" >&2
fi

echo "== harness: vendored hooks =="
for hook in _common.py guard-shell.py guard-mcp.py guard-network.py protect-secrets.py scan-prompt.py verify-on-stop.py; do
  require_file ".cursor/hooks/$hook"
done

python3 -c "import json; json.load(open('.cursor/hooks.json'))"
python3 -m py_compile .cursor/hooks/_common.py .cursor/hooks/guard-shell.py .cursor/hooks/guard-mcp.py \
  .cursor/hooks/guard-network.py .cursor/hooks/protect-secrets.py .cursor/hooks/scan-prompt.py \
  .cursor/hooks/verify-on-stop.py

if [[ "$errors" -gt 0 ]]; then
  echo "check-harness: FAILED ($errors errors)" >&2
  exit 1
fi
echo "check-harness: ok"
