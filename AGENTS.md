# AGENTS.md — healthcare-policy (OPAL mirror)

Harness profile: **policy-mirror** — deployment mirror only. See `specs/portfolio.yaml`.

## Do not edit policy here

Canonical Rego and OPA tests live in [Healthcare-Data-Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange) (`policy/`). Agents work there and run `./scripts/sync-policy-repo.sh` to update this repo.

## Commands

| Command | Purpose |
|---------|---------|
| `./scripts/check-harness.sh` | Harness scaffold + hook syntax |
| `./scripts/check-mirror-governance.sh` | Mirror constraints (no tests, canonical pointer) |
| `./scripts/verify.sh` | Definition of Done for this mirror |

CI: `.github/workflows/portfolio-verify.yml` (same workflow name as canonical repo).

## Definition of Done

```bash
./scripts/verify.sh
```

## Layout

| Path | Purpose |
|------|---------|
| `authz.rego` | OPAL policy bundle (synced from canonical) |
| `.manifest` | OPA bundle roots for OPAL |
| `.harness/canonical-pointer` | Last canonical commit + bundle hash |
| `specs/portfolio.yaml` | Multi-repo contract |
