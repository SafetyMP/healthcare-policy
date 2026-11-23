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

Anna withdrew research consent this morning. Can the privacy officer tell her that this gateway will refuse the study team’s next request? The exchange operator has to answer. A premature assurance could leave Anna expecting privacy while a read is still possible. An unnecessary hold could delay other authorized research.

The mirror gives the operator a way to check exactly which rule files were published. A recorded source revision and bundle fingerprint make it possible to compare those files across repositories. Anna’s consent travels separately. Inspect the evidence from the receiving gateway to decide what you can tell the officer. Try the same request with the other receiver file. [Work the operator’s shift](https://safetymp.github.io/Healthcare-Data-Exchange/#operator) · [Inspect the publication record](.harness/canonical-pointer)

The compact guide follows the selected file through the rule, its publication record, the separate consent update and the gateway decision. The browser exercises fictional evidence. The canonical project contains the implementation and a separate probe that can exercise a running gateway. [Operator technical guide](https://safetymp.github.io/Healthcare-Data-Exchange/#operator-guide) · [Operations guide](docs/exchange-operations.md) · [Companion case for the disclosure steward](https://safetymp.github.io/Healthcare-Data-Exchange/)

## What the exchange is deciding whether to fund

An exchange operations director can compare one joint gateway release with publishing the same rule through the mirror. For each path, record release-team time, upkeep and how many receivers can show the new rule in use. Track separately when each gateway first returns a matching denial after a withdrawal. That gives the privacy officer evidence about enforcement and the director a basis for deciding whether independent distribution is worth maintaining. [Operator investment question](docs/exchange-operations.md#measure-the-cost-of-independent-rule-publication)

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
