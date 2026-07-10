# VECTRA-000: Manifest

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Define the scope, invariants, and conformance boundary of the AI Project Operating System.

## Definitions

- **Project system of record:** versioned artifacts accepted by the owner.
- **Agent:** replaceable AI process acting within delegated authority.
- **Owner:** human or accountable body holding final project authority.
- **Loop:** a bounded pass through context, planning, execution, validation, review, and memory update.
- **Artifact:** durable, addressable project record.
- **Conformance:** observable compliance with declared VECTRA obligations.

## Rules

1. The project system of record MUST outrank conversation history.
2. Every agent MUST be replaceable without losing accepted knowledge.
3. Material work MUST be traceable from goal to task, change, evidence, and decision.
4. Uncertainty MUST be exposed. An agent MUST NOT fabricate missing facts.
5. Work MUST proceed in reviewable increments with bounded blast radius.
6. Authority MUST be explicit; capability does not imply permission.
7. Accepted knowledge MUST be maintained near the work and versioned with it.
8. VECTRA MUST remain vendor-, model-, and tool-neutral.

## Responsibilities

The owner declares goals, authority, risk tolerance, and acceptance. Agents construct context, act within scope, generate evidence, and externalize reusable knowledge. Maintainers evolve the standard without silently breaking conformance.

## Workflow

Adopt a version, select a conformance profile, instantiate required artifacts, execute [VECTRA-002](VECTRA-002-workflow.md), audit conformance, then record deviations. A local rule MAY specialize VECTRA but MUST identify the specialization and MUST NOT claim Core conformance if it violates a Core requirement.

## Example

A new agent reads `PROJECT.md`, active `TASK.md`, relevant decisions, and `MEMORY.md`; it resumes the next permitted transition without needing the prior chat.

## Anti-patterns

- Treating a long system prompt as permanent memory.
- Allowing an agent to approve its own high-risk change.
- Recording outcomes without evidence or provenance.

## Best practices

Keep the authoritative set small, link rather than duplicate, and measure resumability by performing cold-start handoffs.

## Related specifications

[VECTRA-001](VECTRA-001-constitution.md), [VECTRA-002](VECTRA-002-workflow.md), [VECTRA-003](VECTRA-003-memory.md), and [VECTRA-012](VECTRA-012-knowledge-management.md).
