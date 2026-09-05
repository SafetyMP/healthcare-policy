# Design pivot — remain an OPAL mirror

This repository stays an [OPAL](https://github.com/permitio/opal) **policy mirror** for [Cloud Healthcare Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange) ([ADR 0007](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/docs/adr/0007-opal-policy-mirror.md)). It is a satellite, not a product.

## Must remain true

- Publish the synced Rego bundle (`authz.rego`, `.manifest`) that OPAL polls.
- Keep mirror governance: no `*_test.rego` here; `.harness/canonical-pointer` records the last canonical commit and bundle hash.
- **Do not edit Rego here.** Policy semantics live in `policy/` on Healthcare-Data-Exchange and arrive only via `./scripts/sync-policy-repo.sh`.

## Must not grow into

- A UI, clinician console, or second HIE.
- A PDP, consent store, or production authorization runtime.
- A place to invent or hand-edit authorization policy.

If the goal is discovery or a policy change, land on [Healthcare-Data-Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange).

## Optional later (not this change)

Archive this tree as a submodule of the canonical repo. That is a later mechanical option, not part of this documentation PR.
