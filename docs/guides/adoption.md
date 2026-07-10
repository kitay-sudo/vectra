# Adoption guide

This guide is informative; the specifications remain authoritative.

## Minimal Core adoption

1. Declare VECTRA `0.1.0` in `PROJECT.md`.
2. Name one accountable owner and define approval boundaries.
3. Create current `MEMORY.md` and a decision directory.
4. Run one task using the full lifecycle in `TASK.md`.
5. Define acceptance evidence before executing.
6. Close by updating memory and testing cold-start recovery.

## Maturity levels

| Level | Use when | Added controls |
|---|---|---|
| Core | one owner, low/moderate risk | project, task, memory, decisions, validation |
| Coordinated | several agents or teams | roles, assignment envelopes, integration owner, status |
| Assured | high-impact or regulated | independent review, risk register, traceable evidence, retention policy |

Do not adopt every artifact preemptively. Add a record when its absence causes ambiguity, rework, risk, or failed recovery.

## Cold-start conformance exercise

Give a new agent repository access and only: “Resume the highest-priority active task under VECTRA.” It succeeds when the agent identifies authority, current state, next action, validation, and stop conditions without chat history. Record missing knowledge as documentation debt.
