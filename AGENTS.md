# AGENTS.md — healthcare-policy (OPAL mirror)

## Community contract

This repository is an **OPAL policy mirror**, not a standalone product.

1. **Do not edit Rego here.** Canonical Rego and OPA tests live in `policy/` on [Healthcare-Data-Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange).
2. **Canonical repo** is Healthcare-Data-Exchange. Clone that repo to change policy, then run `./scripts/sync-policy-repo.sh` to update this mirror.
3. **Verify** with `./scripts/verify.sh`. Do not claim green from prose.

Site/factory overlay: [docs/factory-overlay.md](docs/factory-overlay.md). Design posture: [docs/DESIGN-PIVOT.md](docs/DESIGN-PIVOT.md).

## Commands

| Command | Purpose |
|---------|---------|
| `./scripts/check-harness.sh` | Harness scaffold + hook syntax |
| `./scripts/check-mirror-governance.sh` | Mirror constraints (no tests, canonical pointer) |
| `./scripts/check-public-pii.sh` | Tracked-text home paths and personal emails |
| `./scripts/verify.sh` | Definition of Done for this mirror |
| `./scripts/render-assets.sh` | Render social/docs assets |

## Layout

| Path | Purpose |
|------|---------|
| `authz.rego` | OPAL policy bundle (synced from canonical) |
| `.manifest` | OPA bundle roots for OPAL |
| `.harness/canonical-pointer` | Last canonical commit + bundle hash |
| `specs/portfolio.yaml` | Multi-repo contract |

## Definition of Done

```bash
./scripts/verify.sh
```
