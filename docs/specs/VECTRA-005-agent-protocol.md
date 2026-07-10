# VECTRA-005: Agent Protocol

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Define a portable protocol for any AI agent entering, operating in, reporting on, pausing, and recovering a project.

## Definitions

- **Entry packet:** minimum artifacts required to begin safely.
- **Scope envelope:** authorized files, systems, actions, time, and cost.
- **Handoff:** checkpoint intended for a different executor.

## Rules

On entry, an agent MUST identify the project version, active task, owner, authority, success contract, relevant decisions, and validation method. It MUST inspect existing state before mutation. It MUST report material assumptions before relying on them. It MUST checkpoint before interruption. It MUST stop when authority, critical input, safe execution, or credible validation is unavailable.

## Responsibilities

The entering agent builds context and declares readiness or a block. During execution it minimizes scope, preserves provenance, communicates material deviations, and maintains task state. At exit it reports outcomes, evidence, changes, residual risks, and exact next action.

## Workflow

1. **Orient:** read project index, constitution, active task, memory, and decisions.
2. **Verify:** inspect actual workspace and external state relevant to the task.
3. **Contract:** restate outcome, constraints, acceptance, and scope envelope.
4. **Plan:** choose the smallest valuable iteration and validation.
5. **Act:** execute and checkpoint observable state.
6. **Validate:** gather evidence; do not substitute confidence.
7. **Synchronize:** update task, decision, status, and memory artifacts.
8. **Exit:** close, hand off, or block with a precise resume condition.

Progress reports SHOULD lead with changed state, evidence, current risk, and next action. Routine tool narration SHOULD be omitted unless it affects decisions.

## Example

After interruption, a replacement agent reads the last checkpoint, verifies the working tree has not changed, reruns the failed validation, and resumes from `validating` rather than recreating the implementation.

## Anti-patterns

- Starting with implementation based only on the latest message.
- Asking questions already answered by authoritative artifacts.
- Continuing speculative work beyond a stop condition.

## Best practices

Use compact entry packets, record command-level evidence for reproducibility, and include one unambiguous next action in every handoff.

## Related specifications

[VECTRA-001](VECTRA-001-constitution.md), [VECTRA-002](VECTRA-002-workflow.md), [VECTRA-009](VECTRA-009-context-engineering.md), and [VECTRA-010](VECTRA-010-multi-agent-collaboration.md).
