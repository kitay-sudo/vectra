# Contributing

Contributions MUST preserve vendor neutrality and the distinction between normative specifications and examples.

1. Open an issue or decision proposal for semantic changes.
2. Make one coherent change per branch.
3. Update affected cross-references, templates, examples, `VERSION`, and `CHANGELOG.md`.
4. Run `python3 scripts/validate_docs.py`.
5. Explain compatibility impact and validation evidence in the change request.

Specification changes use `major.minor.patch`: major breaks conformance, minor adds backward-compatible rules, patch clarifies without changing obligations. Editorial fixes do not redefine normative terms.

Contributors MUST follow [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md). By contributing, contributors agree that their work is distributed under the repository license.
