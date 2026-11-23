# Research consent and exchange operations

The privacy officer needs an answer about a particular receiving gateway after a patient withdraws research permission. The data steward records the withdrawal. The exchange operator traces it to the gateway that handles the next matching request. Two evidence files present the same researcher, patient, purpose, withdrawal and published rule. Choose what to report, then inspect the result with the officer’s question in mind. [Open the operator case](https://safetymp.github.io/Healthcare-Data-Exchange/#operator) · [Open its technical guide](https://safetymp.github.io/Healthcare-Data-Exchange/#operator-guide)

## Read the two paths

| Record | What the operator can investigate |
| --- | --- |
| Published rule | The canonical source defines the condition for research access. The pointer in this mirror records a source revision and a hash of the published rule bundle. |
| Recorded withdrawal | The consent service records the patient’s decision. OPAL signals a data change and its client can refresh the consent input read by the policy engine. |
| Receiving gateway | A dated observation can identify the endpoint and the result for a particular request. Check its time, patient, purpose, requester and denial reason. A missing permission and a recorded withdrawal can both produce `consent_required`. |

An operator reporting a result should identify the gateway, request and observation time. The privacy officer decides what can be communicated to the patient and when wider checks are needed. The steward owns the consent record. The release and gateway teams own publication and endpoint checks. CRISP describes the roles of privacy officers and consumer representatives in exchange governance. [CRISP governance](https://www.crisphealth.org/governance/) · [OPA instance status](https://www.openpolicyagent.org/docs/management-status)

## Measure the cost of independent rule publication

The exchange operations director can compare two paths for the **same rule change**. In a joint release, record time spent coordinating deployments and confirming each endpoint’s rule version. With the mirror, record publication, monitoring, recovery and the same endpoint checks, plus the cost of maintaining OPAL. Use the same set of gateways in both trials.

For withdrawal handling, agree with the privacy officer and a patient representative on how quickly staff need a checked response from each gateway. Record the withdrawal time, the first matching denial observed after it and any gateways still awaiting a check. This measures time to an observation. To measure delivery of a particular consent update, the receiver would also need to identify that update and record when it applied it using a comparable clock. Use the measured release effort and verification coverage to judge whether to fund independent distribution. [OPA management architecture](https://www.openpolicyagent.org/docs/management-introduction) · [Project distribution design](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/docs/adr/0007-opal-policy-mirror.md)

## Companion disclosure case

The disclosure steward has a separate handoff. A study coordinator needs information to check a roster entry. Inspect the synthetic request, choose what the steward should prepare, and trace which fields the receiving team can use. Its worksheet compares manual review, a checklist and a shadow pilot for the desk. [Open the disclosure steward’s case](https://safetymp.github.io/Healthcare-Data-Exchange/#research-request)

## Verify a policy release

The operator guide links the rule to the mirror revision and hash. A release engineer can compare the published bytes against the canonical revision that supplied them. [Trace the operator’s evidence](https://safetymp.github.io/Healthcare-Data-Exchange/#operator-guide) · [Mirror publication pointer](../.harness/canonical-pointer)

For current checkouts, run these commands from Healthcare-Data-Exchange with the mirror beside it. They check the working stamp and compare the published commit’s rule content against the mirror files and pointer.

```sh
export CHEX_PORTFOLIO_MIRROR_PATH="../healthcare-policy"
./scripts/check-policy-sync.sh
./scripts/check-portfolio-cross-repo.sh
```

Policy rules in Git and consent data follow separate OPAL update paths. A content hash establishes a publication comparison. OPA status can report a specific instance’s activated bundle revision. The project’s separate Compose probe polls one gateway through a research withdrawal and grant and checks the HTTP statuses. The operator must inspect the denial reason to attribute a refusal to consent. Neither the status nor the reason carries an acknowledgement for a particular consent update. [Policy distribution design](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/docs/adr/0007-opal-policy-mirror.md) · [Consent design](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/docs/adr/0008-opal-consent-sync.md) · [Gateway probe](https://github.com/SafetyMP/Healthcare-Data-Exchange/blob/main/scripts/demo.sh) · [OPA status evidence](https://www.openpolicyagent.org/docs/management-status)
