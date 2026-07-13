#!/usr/bin/env bash
# DO_NOT_DELETE_STUB_CANARY — generic placeholder/stub detector.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
errors=0
if [[ -f scripts/verify.sh ]] && grep -q 'TODO: add real test' scripts/verify.sh; then
  echo "STUB_CANARY: placeholder verify.sh" >&2
  errors=$((errors + 1))
fi
if [[ "$errors" -gt 0 ]]; then
  echo "check-stub-canary: FAILED ($errors)" >&2
  exit 1
fi
echo "check-stub-canary: ok"
