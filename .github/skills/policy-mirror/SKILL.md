---
name: policy-mirror
description: "Keep healthcare-policy an OPAL mirror of Healthcare-Data-Exchange. Use when someone asks to change authz.rego, add a UI, or grow a second HIE. Redirect policy edits to the canonical repo and sync with that repo's scripts/sync-policy-repo.sh."
---

# Policy mirror

Do not invent authorization policy in this repository.

1. Edit Rego on Healthcare-Data-Exchange.
2. Sync with Healthcare-Data-Exchange `scripts/sync-policy-repo.sh`. This mirror does not contain that script.
3. Verify this mirror with `./scripts/verify.sh`.

Never grow a UI. Never attach real PHI.

