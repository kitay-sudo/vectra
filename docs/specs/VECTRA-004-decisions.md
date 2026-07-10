# VECTRA-004: Decisions

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Preserve material choices, authority, evidence, and trade-offs so future agents do not relitigate settled questions blindly.

## Definitions

- **Decision record (DR):** immutable account of a material choice.
- **Decider:** actor with authority to accept the consequences.
- **Supersession:** new decision replacing an earlier one without rewriting history.

## Rules

A decision record MUST state context, decider, considered options, chosen option, rationale, consequences, evidence, and status. Material architecture, policy, cost, privacy, safety, and irreversible choices require records. Accepted records MUST NOT be edited to change meaning; create a superseding record. Recommendations MUST be separated from authorized decisions.

## Responsibilities

Agents research and frame options without inventing consensus. Owners or delegates decide. Reviewers test whether evidence supports the stated trade-off. Knowledge curators maintain links and supersession status.

## Workflow

Trigger a record when a choice has durable consequence; identify the decider; define evaluation criteria before advocating an option; compare viable options including “do nothing”; capture dissent and uncertainty; obtain explicit decision; publish and link it; revisit only on a declared review date or changed premise.

## Example

Choosing Markdown over a database records portability as the priority, weaker structured queries as a consequence, the owner as decider, and schema growth as a revisit trigger.

## Anti-patterns

- Recording only the selected option.
- “Team agreed” without named authority or date.
- Rewriting an old record after an outcome becomes known.

## Best practices

Keep records short enough to read, link raw research instead of embedding it, and specify reversible checkpoints for uncertain choices.

## Related specifications

[VECTRA-001](VECTRA-001-constitution.md), [VECTRA-006](VECTRA-006-owner-protocol.md), and [VECTRA-012](VECTRA-012-knowledge-management.md).
