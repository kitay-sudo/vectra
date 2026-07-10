# VECTRA-010: Multi-Agent Collaboration

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Coordinate multiple agents without losing ownership, consistency, or evidence.

## Definitions

- **Orchestrator:** coordinator responsible for decomposition and integration.
- **Assignment envelope:** task, inputs, authority, outputs, validation, stop condition, and write scope.
- **Maker/checker:** separation between production and independent verification.
- **Integration owner:** sole actor authorized to reconcile outputs into final state.

## Rules

Multi-agent execution MUST have one coordinator and one integration owner. Delegation MUST be bounded and traceable. Parallel assignments SHOULD avoid overlapping mutable state. Agents MUST NOT recursively delegate unless authorized. Outputs MUST be artifacts, not unverifiable claims. Consensus MUST NOT replace owner authority or evidence.

## Responsibilities

The planning role creates dependency-aware work packages. The coordinator issues envelopes and maintains status. Executors checkpoint results. Reviewers challenge outputs. The integration owner resolves mechanical conflicts and escalates semantic conflicts. The owner decides unresolved priority or risk disputes.

## Workflow

1. Decompose only independent or clearly sequenced work.
2. Create assignment envelopes and conflict map.
3. Dispatch with shared immutable context and scoped mutable ownership.
4. Require agents to return outcome, evidence, changed artifacts, assumptions, and open risks.
5. Validate each output before integration.
6. Integrate in dependency order and rerun system-level validation.
7. Resolve conflict by evidence, declared criteria, then authority—not majority vote.
8. Update shared memory only after integration acceptance.

## Example

A Researcher compares standards while a Writer inventories existing docs because their outputs do not overlap. The Architect consumes both; the Reviewer checks the integrated proposal. Two agents are not assigned simultaneous edits to the same specification.

## Anti-patterns

- Agent swarms without a dependency graph.
- Majority vote on factual correctness.
- Each agent maintaining a private version of project truth.
- Parallelism whose merge cost exceeds the work saved.

## Best practices

Parallelize search, inventory, and isolated modules; serialize shared architecture and final integration. Use maker/checker separation when failure impact justifies its cost.

## Related specifications

[VECTRA-001](VECTRA-001-constitution.md), [VECTRA-008](VECTRA-008-agent-roles.md), and [VECTRA-011](VECTRA-011-quality-assurance.md).
