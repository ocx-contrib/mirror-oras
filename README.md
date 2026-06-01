# mirror-oras

OCX mirror for [ORAS](https://github.com/oras-project/oras). Publishes GitHub
releases to `ocx.sh/oras` with cascade tags after a smoke test per
`(version, platform)`.

## Editing

| File | Edit | Regenerate after |
|------|------|------------------|
| `mirror.yml` | hand | `ocx-mirror pipeline generate ci` |
| `tests/smoke.star` | hand | — |
| `metadata.json`, `CATALOG.md`, `logo.svg`, `logo.png` | hand | — |
| `.github/workflows/*.yml` | generated | re-run when `mirror.yml` changes |

CI fails on drift via `ocx-mirror pipeline generate ci --check`.

## Platforms

Linux first (`linux/amd64`, `linux/arm64`). `darwin` and `windows/amd64`
get added once the linux legs are end-to-end green. Upstream ships no
`windows/arm64` asset.

## Required secrets

| Secret | Use |
|--------|-----|
| `OCX_MIRROR_REGISTRY_TOKEN` + `OCX_MIRROR_REGISTRY_USER` | `ocx package push` to `ocx.sh` |
| `OCX_MIRROR_DISCORD_HOOK` | notify-stage Discord webhook URL |

## License

Apache-2.0 — see [`LICENSE`](LICENSE). Upstream assets (ORAS logo, mirrored
binaries) are out of scope; see [`NOTICE.md`](NOTICE.md).
