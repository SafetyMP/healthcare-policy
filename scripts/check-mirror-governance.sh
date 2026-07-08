#!/usr/bin/env bash
# Mirror-repo governance: deployment artifacts only.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

errors=0

echo "== mirror: forbidden patterns =="
while IFS= read -r -d '' f; do
  echo "FORBIDDEN test file in mirror: $f" >&2
  errors=$((errors + 1))
done < <(find "$ROOT" -maxdepth 1 -name '*_test.rego' -print0 2>/dev/null)

if [[ -d "$ROOT/.git" ]]; then
  while IFS= read -r f; do
    case "$f" in
      *_test.rego)
        echo "FORBIDDEN tracked test file: $f" >&2
        errors=$((errors + 1))
        ;;
    esac
  done < <(git -C "$ROOT" ls-files '*.rego' 2>/dev/null || true)
fi

echo "== mirror: canonical pointer =="
POINTER="$ROOT/.harness/canonical-pointer"
if [[ ! -f "$POINTER" ]]; then
  echo "MISSING: .harness/canonical-pointer (run canonical sync-policy-repo.sh)" >&2
  errors=$((errors + 1))
else
  grep -q 'canonical_repo:' "$POINTER" || { echo "BAD pointer: canonical_repo" >&2; errors=$((errors + 1)); }
  grep -q 'canonical_commit:' "$POINTER" || { echo "BAD pointer: canonical_commit" >&2; errors=$((errors + 1)); }
  grep -q 'rego_bundle_hash:' "$POINTER" || { echo "BAD pointer: rego_bundle_hash" >&2; errors=$((errors + 1)); }
fi

echo "== mirror: rego bundle hash =="
if [[ -f "$POINTER" ]]; then
  # shellcheck source=lib/portfolio.sh
  if [[ -f "$ROOT/scripts/lib/portfolio.sh" ]]; then
    source "$ROOT/scripts/lib/portfolio.sh"
    expected="$(portfolio_field "$POINTER" rego_bundle_hash)"
    actual="$(portfolio_rego_bundle_hash "$ROOT")"
    if [[ -n "$expected" && "$expected" != "pending-sync" && "$expected" != "$actual" ]]; then
      echo "HASH MISMATCH: pointer=$expected files=$actual" >&2
      errors=$((errors + 1))
    fi
  fi
fi

echo "== mirror: portfolio link =="
if [[ ! -f "$ROOT/specs/portfolio.yaml" ]]; then
  echo "MISSING: specs/portfolio.yaml" >&2
  errors=$((errors + 1))
fi

if [[ "$errors" -gt 0 ]]; then
  echo "check-mirror-governance: FAILED ($errors errors)" >&2
  exit 1
fi
echo "check-mirror-governance: ok"
