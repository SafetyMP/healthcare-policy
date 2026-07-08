# healthcare-policy

OPAL-tracked policy repository for **Cloud Healthcare Exchange** (ADR 0007).

OPAL server polls this repo and syncs the Rego into the OPA agent run by each
OPAL client. Consent is **not** stored here — it is external data synced at
`data.consent` from the consent-service data source, so revocation propagates to
the PDP without a policy redeploy.

| File | Purpose |
|------|---------|
| `authz.rego` | `chex.authz` — residency, purpose, minimum-necessary, cross-bloc exception; reads consent from `data.consent` |

## Source of truth

The canonical, unit-tested copy lives in the main repo at
[`policy/authz.rego`](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/policy/authz.rego)
(`opa test policy/` in `scripts/verify.sh`). This repo is the **deployment
mirror** OPAL tracks; sync with `scripts/sync-policy-repo.sh` in the main repo.
