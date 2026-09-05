# Security policy

## Supported versions

| Version | Supported |
|---------|-----------|
| `main` | Yes |

This repository is the public OPAL policy mirror for [Cloud Healthcare Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange) (ADR 0007). Only the latest `main` branch receives updates.

## Reporting a vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Use [GitHub private vulnerability reporting](https://github.com/SafetyMP/healthcare-policy/security/advisories/new) on this repository when enabled, or contact the maintainers through GitHub if that option is unavailable.

Include:

- Description of the issue and potential impact
- Affected paths (Rego bundle, verify scripts, CI, or Cursor hooks)
- Suggested fix if you have one

We aim to acknowledge reports within a reasonable timeframe. This is an open-source reference mirror without a formal SLA.

## Scope notes

- **Do not edit `authz.rego` here.** Canonical Rego and OPA tests live in `policy/` on [Healthcare-Data-Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange). Authorization-policy bugs should be reported there unless the defect is unique to this mirror (for example, a stale bundle or a verify-script gap).
- **No real PHI.** Do not attach production patient data to issues, PRs, or advisories.
- **Mirror, not a PDP.** This repo publishes the Rego bundle and harness gates. It does not run OPAL, store consent, or enforce production authorization.

## Safe harbor

We appreciate responsible disclosure. Researchers who follow this policy and avoid privacy violations (real PHI, unauthorized access to third-party systems) will not be pursued for good-faith security research on this repository.
