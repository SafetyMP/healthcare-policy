# Factory overlay

Community contributors and coding agents: start at [AGENTS.md](../AGENTS.md). The following site-contract and corporate-handoff text is the factory overlay (moved from the former AGENTS.md lead).

# Site contract

Corporate/site overlay (`site_id: healthcare-policy`) plus **multi-repo harness**
(`.harness/`, including `canonical-pointer`). Do not archive or remove `.harness/`.

## Gates


| Command | Purpose |
|---|---|
| `./scripts/verify.sh` | Functional and static acceptance |
| `./scripts/adversarial.sh` | Authorized local adversarial probes |

Record `verification_scripts` as site-relative `scripts/harness` (exactly `verify.sh` and `adversarial.sh`). Optional wrappers may remain at `scripts/verify.sh` / `scripts/adversarial.sh` for humans; they are outside the digest boundary.

## Definition of Done (site)

```bash
./scripts/verify.sh
./scripts/adversarial.sh
```
