# AGENTS.md — healthcare-policy (OPAL mirror)

Corporate/site overlay (`site_id: healthcare-policy`) plus **multi-repo harness**
(`.harness/`, including `canonical-pointer`). Do not archive or remove `.harness/`.

## Do not edit policy here

Canonical Rego and OPA tests live in [Healthcare-Data-Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange)
(`policy/`). Agents work there and run `./scripts/sync-policy-repo.sh` to update this repo.

## Gates


| Command | Purpose |
|---|---|
| `./scripts/verify.sh` | Functional and static acceptance |
| `./scripts/adversarial.sh` | Authorized local adversarial probes |

Record `verification_scripts` as site-relative `scripts/harness` (exactly `verify.sh` and `adversarial.sh`). Optional wrappers may remain at `scripts/verify.sh` / `scripts/adversarial.sh` for humans; they are outside the digest boundary.

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
| `.corp-harness/site.json` | Corp-site binding (unbound until a program) |
| `specs/portfolio.yaml` | Multi-repo contract |

## Definition of Done

```bash
./scripts/verify.sh
./scripts/adversarial.sh
```
