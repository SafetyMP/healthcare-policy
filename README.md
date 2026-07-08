# healthcare-policy

OPAL-tracked **policy mirror** for [Cloud Healthcare Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange).

## Do not edit Rego here

Canonical source and OPA tests: `policy/` in the main repo. Updates are pushed via `./scripts/sync-policy-repo.sh` from that repo.

## Harness

Profile: **policy-mirror** · Portfolio: `specs/portfolio.yaml` · Verify: `./scripts/verify.sh`

## OPAL

- `authz.rego` — `chex.authz` package; consent from `data.consent` (ADR 0007)
- `.manifest` — OPA bundle roots (`chex`)
