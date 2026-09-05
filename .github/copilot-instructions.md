# Copilot / community agents

This repository is an OPAL **policy mirror** for
[Healthcare-Data-Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange).
It is not a standalone product. Do not invent authorization policy.

## Verify

- `./scripts/verify.sh`
- `./scripts/adversarial.sh` (authorized probes only)

## Never

- Never edit `authz.rego` or add `*_test.rego` here.
- Never grow a UI, clinician console, or second HIE in this repo.
- Never claim verify green from prose.
- Never attach real PHI to issues, PRs, or advisories.

Change policy on Healthcare-Data-Exchange, then sync with
`./scripts/sync-policy-repo.sh`. Community contract: [AGENTS.md](../AGENTS.md).
Design posture: [docs/DESIGN-PIVOT.md](../docs/DESIGN-PIVOT.md).
