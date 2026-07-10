# VECTRA-007: Success Contracts

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Make completion falsifiable through acceptance criteria, exit criteria, failure conditions, and evidence.

## Definitions

- **Acceptance criterion:** observable property of an output.
- **Definition of Done (DoD):** reusable quality obligations for a class of task.
- **Exit criterion:** condition allowing a workflow or project phase to stop.
- **Failure condition:** observation that invalidates success or requires escalation.

## Rules

Every material task MUST have criteria before execution. Each criterion MUST name a validation method and expected evidence. Criteria MUST describe outcomes, not implementation effort. Completion requires all mandatory criteria, no unresolved failure condition, accepted residual risk, and synchronized memory. A waived criterion requires authorized rationale and an expiry or follow-up.

## Responsibilities

The requester states desired outcomes. The planner makes them testable. The executor produces evidence. The reviewer challenges evidence. The acceptance authority decides whether residual risk is acceptable.

## Workflow

Translate the goal into observable behavior; add quality, safety, compatibility, and documentation criteria; define evidence and responsible validator; enumerate failure signals; review feasibility; freeze the contract for the iteration; validate; record pass, fail, or authorized waiver; then close or re-enter planning.

## Example

Weak: “Create complete docs.” Strong: “All 15 specification IDs exist; every spec contains the required sections; internal Markdown links resolve; version references agree; a cold-start agent can identify the next workflow state from the example project.”

## Anti-patterns

- “Looks good” as the only criterion.
- Tests selected after seeing the output.
- Conflating task closure with project success.

## Best practices

Use a small number of discriminating criteria, automate deterministic checks, and add human review where meaning or harm cannot be mechanically evaluated.

## Related specifications

[VECTRA-002](VECTRA-002-workflow.md), [VECTRA-006](VECTRA-006-owner-protocol.md), and [VECTRA-011](VECTRA-011-quality-assurance.md).
