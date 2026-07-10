# VECTRA-014: Best Practices

**Status:** Draft · **Version:** 0.1.0 · **Normative:** No

## Purpose

Collect operational recommendations derived from the normative specifications.

## Definitions

- **Operating latency:** time from an observed state to a correct next transition.
- **Documentation drag:** maintenance cost imposed by redundant or low-value records.

## Rules

This document is advisory. Where it conflicts with a normative specification, the normative specification governs.

## Responsibilities

Project maintainers select practices appropriate to risk and record deviations that affect conformance. Retrospective owners replace folklore with evidence.

## Workflow and recommendations

1. Start with Core artifacts; add roles and records only when a real coordination cost appears.
2. Keep iterations small enough that one reviewer can understand the full consequence.
3. Write acceptance criteria before implementation and failure conditions before validation.
4. Prefer links to duplicated rules and current state to narrative status reports.
5. End every work session with state, evidence, risks, and one next action.
6. Test cold-start recovery periodically with an agent that has no chat history.
7. Limit work in progress; unfinished parallel tasks amplify context and merge cost.
8. Put volatile facts behind freshness markers and verification triggers.
9. Automate syntax and consistency checks; reserve human review for meaning and harm.
10. Treat recurring questions, defects, and handoff failures as signals of missing project knowledge.

## Example

If agents repeatedly ask how releases are approved, add one authority rule to `PROJECT.md`, link it from task templates, and test the next handoff. Do not paste the answer into multiple prompts.

## Anti-patterns

- Maximum documentation before the first feedback cycle.
- Role proliferation without distinct outputs.
- Retrospectives that produce no rule, task, or experiment.
- Optimizing agent autonomy instead of project outcomes.

## Best practices

Measure lead time, rework rate, escaped defects, stale knowledge, unresolved decisions, and cold-start recovery success. Remove artifacts whose maintenance cost exceeds their decision value.

## Related specifications

All VECTRA specifications, especially [VECTRA-002](VECTRA-002-workflow.md), [VECTRA-007](VECTRA-007-success-contracts.md), and [VECTRA-012](VECTRA-012-knowledge-management.md).
