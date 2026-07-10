# Versioning and migration

Vectra releases use Semantic Versioning. Projects declare the version they implement; documents declare the version under which their obligations were written.

- Patch: clarification with no new project obligation.
- Minor: backward-compatible capability or obligation with a migration path.
- Major: incompatible lifecycle, authority, artifact, or conformance change.

To upgrade, inventory local specializations, read the changelog, compare changed normative statements, create a change request, update artifacts and automation, run conformance checks, perform a cold-start exercise, then record the accepted version in `PROJECT.md`. Mixed-version operation MUST be temporary and documented.
