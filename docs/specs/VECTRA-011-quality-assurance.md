# VECTRA-011: Quality Assurance

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Define risk-proportionate verification, validation, review, and recovery.

## Definitions

- **Verification:** evidence that output matches its specification.
- **Validation:** evidence that output satisfies the intended use.
- **Finding:** reproducible deviation with impact and evidence.
- **Residual risk:** known risk remaining after controls.

## Rules

Claims MUST be backed by evidence appropriate to their type. Tests MUST discriminate failure, not merely execute successfully. Review depth MUST increase with impact, irreversibility, novelty, and uncertainty. Failed checks MUST remain visible. The executor MUST NOT be the only acceptance authority for high-risk work.

## Responsibilities

Planners define the validation strategy. Executors run self-review and preserve evidence. Testers verify observable behavior. Reviewers assess requirements, defects, risk, and process. Owners accept residual risk and authorize waivers.

## Workflow

Classify risk as low, moderate, high, or critical; map each success criterion to a check; verify inputs and environment; run deterministic checks; inspect semantic quality; test negative and boundary cases; perform independent review where required; record findings by severity; repair and rerun affected plus regression checks; accept only with an evidence matrix.

Suggested review levels:

| Risk | Minimum control |
|---|---|
| Low | executor self-review and automated checks |
| Moderate | peer review or targeted independent check |
| High | independent domain reviewer, rollback evidence, owner acceptance |
| Critical | qualified review, staged release, monitoring, explicit contingency authority |

## Example

A link checker passing verifies link syntax and targets; a cold-reader exercise validates that the documentation is actually navigable. Both are needed for the stated goal.

## Anti-patterns

- Equating test count with coverage.
- Reviewer rewriting the deliverable without recording findings.
- Waiving a failure because a deadline is near.

## Best practices

Capture commands and versions, test the highest-consequence failure first, use independent evidence sources, and turn escaped defects into improved contracts or checks.

## Related specifications

[VECTRA-002](VECTRA-002-workflow.md), [VECTRA-007](VECTRA-007-success-contracts.md), and [VECTRA-010](VECTRA-010-multi-agent-collaboration.md).
