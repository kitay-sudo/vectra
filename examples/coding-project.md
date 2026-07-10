# Coding project profile

**Goal:** add resumable uploads to an existing client library. **Workflow:** inspect current code and decisions; specify behavior and compatibility; implement one bounded layer; run unit, integration, type, and regression checks; peer-review; update API docs and memory.

Acceptance includes interruption recovery, checksum failure, retry limits, backward compatibility, and package build. A passing test command is evidence only if the relevant cases are present. The agent preserves unrelated working-tree changes and stops before publishing a package unless release authority is explicit.

Anti-pattern: large refactor combined with feature work, making failure attribution impossible.
