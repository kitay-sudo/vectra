# Adoption guide

This guide is informative; the specifications remain authoritative.

## Minimal Core adoption

For an existing project, the adopting agent MUST first inspect repository structure, documentation, implementation, tests, Git history when available, and recorded issues. It MUST separate verified observations from inferences and MUST NOT modify the project during discovery unless the owner explicitly authorizes it.

After discovery:

1. Present a concise inventory of verified state, uncertainties, contradictions, and risks.
2. Ask the owner only for material information that cannot be discovered reliably; ask one focused question at a time.
3. Declare Vectra `0.1.0` in `PROJECT.md`.
4. Name one accountable owner and define approval boundaries.
5. Create current `MEMORY.md` and a decision directory.
6. Run one task using the full lifecycle in `TASK.md`.
7. Define acceptance evidence before executing.
8. Close by updating memory and testing cold-start recovery.

For a new project, discovery is replaced by an owner interview covering outcome, users, non-goals, constraints, risks, priorities, authority, and project-level exit criteria. Implementation begins only after the owner approves the initial project contract.

## Maturity levels

| Level | Use when | Added controls |
|---|---|---|
| Core | one owner, low/moderate risk | project, task, memory, decisions, validation |
| Coordinated | several agents or teams | roles, assignment envelopes, integration owner, status |
| Assured | high-impact or regulated | independent review, risk register, traceable evidence, retention policy |

Do not adopt every artifact preemptively. Add a record when its absence causes ambiguity, rework, risk, or failed recovery.

## Cold-start conformance exercise

Give a new agent repository access and only: “Resume the highest-priority active task under VECTRA.” It succeeds when the agent identifies authority, current state, next action, validation, and stop conditions without chat history. Record missing knowledge as documentation debt.
