# VECTRA-003: Memory

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Define external memory that permits reliable cold-start recovery.

## Definitions

- **Working memory:** active task state, disposable after closure.
- **Permanent memory:** current validated facts and operating constraints.
- **Historical memory:** append-only record of prior states and events.
- **Provenance:** origin, author, time, and validation status of knowledge.
- **Memory debt:** stale, duplicated, unowned, or unverifiable knowledge.

## Rules

Memory MUST live outside model context, identify its scope, and carry provenance. Current facts MUST NOT be inferred from historical records without revalidation. Secrets MUST be referenced by secure locator, never copied into memory. Rejected hypotheses MUST NOT enter permanent memory as fact. A task cannot become `closed` until reusable learning is either stored or explicitly classified as non-durable.

## Responsibilities

Executors propose memory updates. Reviewers validate consequential facts. The memory manager removes duplication and stale entries. Owners define retention and confidentiality policy.

## Workflow

Capture candidate learning during execution; classify it as working, permanent, or historical; validate source and scope; merge into the canonical location; link the originating task or decision; mark superseded knowledge; then verify that a cold reader can apply it. Review permanent memory on release and after incident recovery.

## Example

“API returned 500 once” belongs in task evidence. “Provider limits payloads to 10 MB, verified against contract version X” belongs in permanent constraints. The outage timeline belongs in history.

## Anti-patterns

- Chat transcripts as canonical memory.
- One ever-growing `memory.md` with no ownership or expiry.
- Copying the same rule into several files.

## Best practices

Store facts closest to their subject, keep summaries navigational, add `last_verified` to volatile facts, and test memory with a new-agent recovery exercise.

## Related specifications

[VECTRA-004](VECTRA-004-decisions.md), [VECTRA-009](VECTRA-009-context-engineering.md), and [VECTRA-012](VECTRA-012-knowledge-management.md).
