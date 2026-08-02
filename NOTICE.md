# NOTICE

This repository packages and redistributes upstream software published by the
[ORAS project](https://github.com/oras-project), a CNCF project. The Apache-2.0
license in [`LICENSE`](LICENSE) covers the OCX pipeline files authored here. It
does **not** cover any upstream-derived asset — each package's redistributed
bytes carry their own license, recorded below.

Each package's logo is reproduced for catalog identification only, under
nominative fair use. The marks remain the property of their respective owners
and no endorsement is implied.

| Package | GHCR path | Upstream SPDX |
|---|---|---|
| `oras` | `ghcr.io/ocx-contrib/oras-project/oras` | `Apache-2.0` |

---

## `oras`

Upstream: <https://github.com/oras-project/oras>
Published to `ghcr.io/ocx-contrib/oras-project/oras`.

| Component | SPDX | Holder |
|---|---|---|
| ORAS CLI (`oras`) | **Apache-2.0** | The ORAS Authors / CNCF |

Permissive; redistribution of the compiled binary is granted under
<https://github.com/oras-project/oras/blob/main/LICENSE>. Every upstream
archive ships that `LICENSE` file alongside the executable, and the mirror
republishes the archive contents unchanged, so the license text travels with
the bytes. The published binaries statically link third-party Go modules under
permissive licenses, enumerated in upstream's `go.mod`.

The ORAS name and logo are upstream marks, used for catalog identification
under nominative fair use.

No modifications are made to any upstream artifact in this repository; they are
republished byte-for-byte inside an OCX bundle.
