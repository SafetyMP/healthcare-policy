#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
./scripts/check-harness.sh
./scripts/check-stub-canary.sh
./scripts/check-mirror-governance.sh
echo "verify: ok"
