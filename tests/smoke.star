TOOL = "oras.exe" if ocx.target_platform.os == ocx.os.Windows else "oras"

# Tier 1 + 2: liveness + version shape.
# oras prints its version via `oras version` (a line like "Version: 1.3.0").
r = ocx.run(TOOL, "version")
expect.ok(r)
expect.matches(r.stdout, r"\d+\.\d+\.\d+")

# Tier 3: subcommand presence — the core ORAS surface exists.
# Subcommand NAMES are the contract; their help prose is upstream's to reword.
expect.eq(ocx.run(TOOL, "push", "--help").exit_code, 0)
expect.eq(ocx.run(TOOL, "pull", "--help").exit_code, 0)

# Tier 4: not applicable — metadata.json declares PATH only.
