# VECTRA-013: Prompt Interfaces

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Optional

## Purpose

Define prompts as replaceable adapters into VECTRA artifacts and transitions. Prompts do not constitute the operating system.

## Definitions

- **Prompt interface:** model-facing instruction that selects a role or workflow transition.
- **Prompt contract:** declared inputs, expected structured outputs, and failure behavior.
- **Model variance:** change in output caused by model, settings, or context differences.

## Rules

Prompts MUST reference authoritative artifacts rather than duplicate durable rules. A prompt MUST identify its version, role, required inputs, output schema, authority boundary, and stop behavior. Prompt changes affecting project behavior MUST be reviewed and versioned. Hidden chain-of-thought MUST NOT be required as acceptance evidence; observable rationale and sources MAY be required.

## Responsibilities

Prompt authors maintain interface clarity. Workflow owners ensure prompts match current state transitions. Testers evaluate representative inputs, failure cases, and model variance. Owners approve prompts that can trigger material action.

## Workflow

Identify the transition; define structured input and output; link governing specifications; add uncertainty and stop fields; test across intended models; compare outputs against success contracts; version; monitor failures; retire when the workflow changes.

## Example

Minimal interface:

```yaml
interface: task-review
version: 1.0.0
role: Reviewer
inputs: [task_record, changed_artifacts, evidence]
output: [verdict, findings, residual_risks]
authority: recommend-only
stop_if: [missing_success_contract, unverifiable_evidence]
```

## Anti-patterns

- Copying the constitution into every prompt.
- Prompt tuning used to hide missing project knowledge.
- Requiring a specific model's private reasoning format.

## Best practices

Prefer structured outputs, test prompts as interfaces, keep model-specific optimization in profiles, and move repeated durable content into canonical artifacts.

## Related specifications

[VECTRA-000](VECTRA-000-manifest.md), [VECTRA-005](VECTRA-005-agent-protocol.md), and [VECTRA-009](VECTRA-009-context-engineering.md).
