# Contributing

This repository is an OPAL **policy mirror**, not a standalone product. Please follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Do not edit `authz.rego` here

Pull requests that change `authz.rego` (or add `*_test.rego`) **will be rejected**.

Authorization policy and OPA tests live in `policy/` on
[Healthcare-Data-Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange).
Change the canonical repo, run `./scripts/verify.sh` there, then
`./scripts/sync-policy-repo.sh` so this mirror stays in lockstep.

Mirror-only defects (stale `.harness/canonical-pointer`, verify-script gaps, docs)
may be proposed here. Run `./scripts/verify.sh` before opening a PR.

See [AGENTS.md](AGENTS.md) and [docs/DESIGN-PIVOT.md](docs/DESIGN-PIVOT.md).
