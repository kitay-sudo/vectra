# VECTRA-002: Workflow

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Define the VECTRA loop as an auditable state machine rather than an instruction prompt.

## Definitions

- **Iteration:** one bounded traversal of the loop.
- **Gate:** required condition for a state transition.
- **Evidence:** reproducible observation supporting a claim.
- **Checkpoint:** durable state sufficient for resumption.

## Rules

An active task MUST have exactly one lifecycle state: `intake`, `context`, `planned`, `executing`, `validating`, `review`, `blocked`, `accepted`, or `closed`. State changes MUST identify actor, time, reason, and resulting artifact. Failed validation MUST return to planning or execution; it MUST NOT be waived silently. Every interruption MUST leave a checkpoint.

## Responsibilities

The coordinator owns state transitions. The executor owns bounded changes. The reviewer owns independent acceptance evidence when risk requires separation. The owner resolves priority, scope, and authority blocks.

## Workflow

| State | Required inputs | Required action | Exit gate / output |
|---|---|---|---|
| Intake | request, project goal | normalize desired outcome and constraints | task with owner and priority |
| Context | task | load minimum authoritative knowledge; list unknowns | context manifest and no unsafe unknowns |
| Planned | context, success contract | decompose change, risks, validation, rollback | approved or delegated plan |
| Executing | plan | make smallest coherent change; checkpoint | changed artifacts and execution log |
| Validating | change | run specified checks and capture evidence | evidence for every criterion |
| Review | evidence | assess correctness, risk, and conformance | accept, rework, or escalate decision |
| Accepted | review decision | update memory, decisions, changelog | repository reflects learned state |
| Closed | accepted task | summarize outcome and residual risks | reproducible closure record |
| Blocked | stop condition | preserve state and ask minimal question | explicit unblock condition |

Iteration algorithm:

1. Select the highest-priority ready task.
2. Rebuild context from artifacts; do not trust cached conversation alone.
3. Confirm the success contract and choose a bounded increment.
4. Execute only that increment.
5. Validate in proportion to risk.
6. Review claims against evidence.
7. If rejected, record the failure signal and start another iteration.
8. If accepted, update durable memory before selecting further work.
9. Close only when goal-level exit criteria are met.

## Example

For a documentation link checker, iteration one defines link invariants; iteration two adds the checker; iteration three repairs discovered links. Each iteration is independently reviewable.

## Anti-patterns

- A monolithic “do everything” execution phase.
- Planning after implementation to justify the result.
- Marking work done before memory and decisions are synchronized.
- Infinite self-reflection without a state-changing artifact.

## Best practices

Timebox research, cap concurrent work, make validation commands deterministic, and shrink an iteration when its review surface becomes unclear.

## Related specifications

[VECTRA-003](VECTRA-003-memory.md), [VECTRA-005](VECTRA-005-agent-protocol.md), [VECTRA-007](VECTRA-007-success-contracts.md), and [VECTRA-011](VECTRA-011-quality-assurance.md).
