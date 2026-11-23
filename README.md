<h1 align="center">healthcare-policy</h1>

<p align="center">
  <strong>OPAL-tracked policy mirror</strong> for
  <a href="https://github.com/SafetyMP/Healthcare-Data-Exchange">synthetic FHIR cell demo</a>
</p>

<p align="center">
  <a href="https://github.com/SafetyMP/healthcare-policy/actions/workflows/portfolio-verify.yml"><img src="https://github.com/SafetyMP/healthcare-policy/actions/workflows/portfolio-verify.yml/badge.svg" alt="portfolio-verify"/></a>
  <a href="https://github.com/SafetyMP/Healthcare-Data-Exchange"><img src="https://img.shields.io/badge/canonical-Healthcare--Data--Exchange-0ea5e9" alt="canonical repo"/></a>
</p>

<a name="follow-a-research-access-request"></a>

## The privacy officer’s call

A patient has withdrawn research permission. The exchange’s data steward has recorded the change. The research team may ask for the same record again. The privacy officer needs to know what the operator can say about the gateway where that request will be checked. Reassure the officer too soon and a disclosure could still reach the researchers. Keep a hold open without checking and researchers and staff can lose time.

Read the withdrawal, identify the published rule, and inspect the evidence available from the receiving gateway. Decide what to report and who owns the next check. Try the other evidence file with the patient, request, withdrawal and rule held fixed. [Open the exchange operator case](https://safetymp.github.io/Healthcare-Data-Exchange/#operator)

The compact guide follows the selected file through the rule, its publication record, the separate consent update and the gateway decision. The browser exercises fictional evidence. The canonical project contains the implementation and a separate probe that can exercise a running gateway. [Operator technical guide](https://safetymp.github.io/Healthcare-Data-Exchange/#operator-guide) · [Operations guide](docs/exchange-operations.md) · [Companion case for the disclosure steward](https://safetymp.github.io/Healthcare-Data-Exchange/#research-request)

## What the exchange is deciding whether to fund

Would distributing policy rules independently save enough coordinated release work to justify operating OPAL? Compare the same rule change through a joint gateway release and through the mirror. Count release-team time, OPAL upkeep and the work of verifying adoption by each endpoint. Measure the time to observe a matching denial separately. [Operator investment question](docs/exchange-operations.md#measure-the-cost-of-independent-rule-publication)

## How the mirror fits

1. **Identify the published rule.** The exchange owns the research access rule and tests. Its sync script copies the release to this repository. Here the pointer records the source commit and SHA-256 fingerprint of the Rego bundle. The mirror check recomputes that fingerprint from the local rule files. [Canonical rule and tests](https://github.com/SafetyMP/Healthcare-Data-Exchange/tree/main/policy) · [Sync script](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/scripts/sync-policy-repo.sh) · [Publication pointer](.harness/canonical-pointer) · [Mirror check](scripts/check-mirror-governance.sh)
2. **Follow consent data separately.** The mirrored rule looks up research permission in `data.consent`. When the steward records a withdrawal, the exchange’s consent service asks OPAL to refresh that data at its clients. The publication acknowledgement records acceptance of that request. Receiver evidence is needed to determine what the gateway evaluated. [Mirrored rule](authz.rego) · [Consent publisher](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/services/consent-service/chex_consent/opal_publish.py)
3. **Read one gateway observation.** The operator compares the endpoint, time, requester, purpose and denial reason. A matching refusal establishes the observed result for that request. Confirming when a particular consent update arrived requires evidence identifying that update at the receiver. The case uses synthetic observations. The canonical repository includes a probe for a running stack. [Operator decision tests](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/web/tests/e2e/operator.spec.ts) · [Gateway probe](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/scripts/demo.sh)

## Architecture

| Policy + OPAL flow | Social preview |
|:------------------:|:--------------:|
| ![Policy and OPAL flow](docs/assets/policy-opal-flow.png) | Regenerate with `./scripts/render-assets.sh` then upload `docs/assets/social-preview.png` |

See [ADR 0007](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/docs/adr/0007-opal-policy-mirror.md) on the canonical repo.

## Harness

Profile: **policy-mirror** · Portfolio: [`specs/portfolio.yaml`](specs/portfolio.yaml) · Verify: `./scripts/verify.sh`

## OPAL bundle

| Path | Role |
|------|------|
| `authz.rego` | `chex.authz` package; consent from `data.consent` |
| `.manifest` | OPA bundle roots (`chex`) for OPAL |
| `.harness/canonical-pointer` | Last canonical commit + bundle hash |

## Canonical workflow

```bash
# On Healthcare-Data-Exchange (canonical)
./scripts/verify.sh
./scripts/sync-policy-repo.sh   # pushes policy mirror here
```

## Assets

Diagram sources and PNG exports: [`docs/assets/`](docs/assets/README.md)

## License and security

Apache License 2.0. See [`LICENSE`](LICENSE), [`SECURITY.md`](SECURITY.md), [`CONTRIBUTING.md`](CONTRIBUTING.md), and [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md).


## Documentation map

[docs/README.md](docs/README.md) lists the repository layout. Community policy files are the root `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, and `SECURITY.md`.
