---
name: code-review
description: "Review healthcare-policy PRs as an OPAL mirror. Use on every pull request. Reject edits to authz.rego, new *_test.rego, a UI, or a second HIE. Policy changes belong in Healthcare-Data-Exchange."
---

# Copilot code review — healthcare-policy

Use this skill when reviewing a pull request in this repository.

This repo is a **mirror**, not a product.

- Reject edits to `authz.rego` and new `*_test.rego`.
- Reject a UI, clinician console, or second HIE.
- Canonical repo: SafetyMP/Healthcare-Data-Exchange.
- Verify with `./scripts/verify.sh`.


## Always flag

- Secrets, `.env` values, private keys, or real personal data in the diff
- Weakened or skipped verify / lint / typecheck / adversarial gates
- Invented success (prose claiming a gate passed with no command output)
- Fail-open authorization, skipped human approval, or agents recording `--actor user`

## Never request

- Drive-by major upgrades, formatter churn, or unrelated refactors
- Softening honesty disclaimers or certification claims
