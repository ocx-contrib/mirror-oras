TOOL = "oras.exe" if ocx.platform()["os"] == "windows" else "oras"

r_version = ocx.run(TOOL, "version")
expect.ok(r_version)
expect.eq(r_version.exit_code, 0)
expect.contains(r_version.stdout, "Version")

r_help = ocx.run(TOOL, "--help")
expect.eq(r_help.exit_code, 0)
expect.contains(r_help.stdout, "push")
expect.contains(r_help.stdout, "pull")
