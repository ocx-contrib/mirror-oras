# oras/tests/smoke.star — stable across upstream releases.
# Assert on the contract (exit code, version shape, computed digest), never on
# help/version prose. ORAS's banner and command help are upstream's to reword;
# the digits and the content addresses it computes are the contract.
ORAS = "oras.exe" if ocx.target_platform.os == ocx.os.Windows else "oras"

# Tier 1 + 2: liveness + version SHAPE. `oras version` prints a key/value block
# whose first line is `Version:        1.3.3`; the label is matched only to pin
# the digits to the tool's own version rather than the embedded Go version on
# the line below it.
r_version = ocx.run(ORAS, "version")
expect.ok(r_version)
expect.matches(r_version.stdout, r"Version:\s+\d+\.\d+\.\d+")

# Tier 3: an offline, content-addressed round trip through an OCI image layout
# — no registry, no network. This is the whole point of ORAS, and it exercises
# the real path: blob hashing, layout store write, manifest assembly, then a
# manifest read-back and JSON encode.
#
# The layer digest is the plain sha256 of the pushed file's bytes, so it is a
# fixed constant for fixed content — verified byte-for-byte against `sha256sum`
# on v1.3.3. An anchored literal, not a shape: if ORAS ever stops storing the
# raw bytes it was handed, that is a real behaviour change and this must red.
# The manifest digest is deliberately NOT asserted — it embeds
# `org.opencontainers.image.created`, so it differs on every run.
ocx.write_file("hello.txt", "hello ocx\n")

r_push = ocx.run(ORAS, "push", "--oci-layout", "lay:v1", "hello.txt")
expect.ok(r_push)

r_fetch = ocx.run(ORAS, "manifest", "fetch", "--oci-layout", "lay:v1")
expect.ok(r_fetch)
expect.contains(
    r_fetch.stdout,
    "sha256:64607df0d425646dee8e1509381ad8060fa25951bfddffc351dde39b30b263ee",
)
# The manifest ORAS just wrote must also describe the file it was handed.
expect.contains(r_fetch.stdout, "application/vnd.oci.image.manifest.v1+json")
expect.contains(r_fetch.stdout, "hello.txt")

# Tier 4: oras is a self-contained CLI — PATH only (proven by Tier 1). No
# non-PATH env var to wire, so no Tier 4 check.
