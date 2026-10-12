# Documentation map

OPAL mirror. Do not edit `authz.rego` here. Start at the root [README](../README.md).

- [DESIGN-PIVOT.md](./DESIGN-PIVOT.md)
- [factory-overlay.md](./factory-overlay.md)

Canonical policy and OPA tests: [Healthcare-Data-Exchange](https://github.com/SafetyMP/Healthcare-Data-Exchange) `policy/`.

## Repository layout

| Path | What it is |
| --- | --- |
| `authz.rego` | Mirrored policy. Pull requests that change it are rejected |
| `scripts/` | `verify.sh` and the sync from the canonical repository |
| `specs/` | Portfolio profile |
| `.harness/` | Canonical pointer used by verify |
| `docs/` | This map |
| `_archives/` | Not the mirror path |

Community files: root [CONTRIBUTING.md](../CONTRIBUTING.md), [CODE_OF_CONDUCT.md](../CODE_OF_CONDUCT.md), [SECURITY.md](../SECURITY.md).


## Canonical community files

`CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, and `SECURITY.md` are at the repository root. This repository does not keep a second copy under `.github/`, because GitHub would show that copy instead of the root file.
