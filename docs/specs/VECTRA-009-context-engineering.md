# VECTRA-009: Context Engineering

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Construct the smallest sufficient, authoritative, and current context for a task.

## Definitions

- **Context manifest:** ordered list of sources loaded for an iteration.
- **Context budget:** capacity allocated by relevance and risk.
- **Compression:** loss-aware transformation of sources into a summary.
- **Freshness:** likelihood that a claim still matches current reality.

## Rules

Context MUST be rebuilt from project artifacts at loop entry. Sources MUST be prioritized by authority, task relevance, freshness, and evidence quality. Summaries MUST link their sources and distinguish omissions. Conflicting sources MUST remain visible until resolved. Long context MUST NOT be used as a substitute for selection.

Priority order unless a project declares otherwise:

1. Constitution, owner decisions, and applicable policy.
2. Active task and success contract.
3. Current code/data/workspace state.
4. Accepted decisions and permanent memory.
5. Recent task evidence and status.
6. Historical records and conversation summaries.

## Responsibilities

The acting agent assembles and records context. The knowledge curator keeps sources discoverable. Owners resolve authoritative conflicts. Reviewers check whether omitted context could invalidate acceptance.

## Workflow

Identify the decision to be made; enumerate candidate sources; rank them; load the smallest sufficient set; verify volatile facts; produce a context manifest with knowns, unknowns, assumptions, and exclusions; execute; then update sources when accepted learning changes them.

Compression ladder: direct source → scoped extract → source-linked summary → index entry. High-risk rules SHOULD remain direct sources. Compression MUST preserve obligations, exceptions, uncertainty, and provenance.

## Example

An agent modifying authentication loads the constitution, active task, current auth code, security decisions, and relevant tests; it does not load every project meeting note.

## Anti-patterns

- Feeding the entire repository into every task.
- Trusting a stale summary over current state.
- Removing dissent or exceptions during summarization.

## Best practices

Record why each source matters, assign expiry to volatile context, and treat “not loaded” as a deliberate, reviewable choice.

## Related specifications

[VECTRA-003](VECTRA-003-memory.md), [VECTRA-005](VECTRA-005-agent-protocol.md), and [VECTRA-012](VECTRA-012-knowledge-management.md).
