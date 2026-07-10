# VECTRA-006: Owner Protocol

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Define human accountability in an AI-operated project.

## Definitions

- **Owner:** accountable human or governance body.
- **Approval boundary:** class of action requiring explicit owner authorization.
- **Priority order:** documented ordering used when work competes.

## Rules

The owner MUST define project purpose, priorities, non-goals, risk tolerance, sensitive data policy, approval boundaries, and acceptance authority. The owner MUST NOT delegate accountability merely by delegating execution. Material ambiguity in goals or authority MUST be resolved by an owner or named delegate. Owner overrides SHOULD state which premise or priority changed.

## Responsibilities

Owners provide timely decisions, protect stakeholder interests, appoint qualified reviewers for high-risk domains, maintain access, and accept or reject outputs using declared criteria. They also retire obsolete rules so agents do not operate under contradictory instructions.

## Workflow

At project start, publish the project contract and authority map. At intake, rank the request and name the acceptance authority. At escalation, answer the smallest decision that unblocks safe work. At review, assess evidence rather than fluency. At release, accept residual risks and verify that memory reflects the decision.

## Example

The owner delegates documentation edits and local Git commits but retains authority for public publication and license changes.

## Anti-patterns

- Vague goals paired with strict deadlines.
- Treating agent confidence as validation.
- Changing acceptance criteria after delivery without a change record.

## Best practices

Prefer durable written priorities, short approval service levels, and explicit “agent may decide” zones for reversible low-risk work.

## Related specifications

[VECTRA-001](VECTRA-001-constitution.md), [VECTRA-004](VECTRA-004-decisions.md), and [VECTRA-007](VECTRA-007-success-contracts.md).
