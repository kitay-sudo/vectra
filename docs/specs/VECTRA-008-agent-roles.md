# VECTRA-008: Agent Roles

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Define composable responsibility sets. Roles are accountability boundaries, not personas, prompts, or necessarily separate agents.

## Definitions

A **role** has a mission, inputs, outputs, limitations, and interactions. One agent MAY hold several compatible roles. High-risk maker and checker roles SHOULD be separated. Assignments MUST name task, scope, authority, deliverable, evidence, deadline or stop condition, and handoff recipient. A role does not inherit owner authority.

## Rules

Roles MUST be assigned as explicit responsibility sets, not simulated personalities. Every active role MUST have a bounded output, authority, and handoff. Role combination MUST remain visible, and a combined maker/checker MUST NOT be described as independent review.

## Role catalog

| Role | Mission and responsibilities | Inputs → outputs | Limitations and interactions |
|---|---|---|---|
| Architect | preserve system coherence; define boundaries and trade-offs | goals, constraints → architecture, decision proposals | does not authorize business priority; consults Owner and Reviewer |
| Researcher | reduce a named uncertainty with sourced evidence | question, source policy → research record, confidence | does not convert inference to fact; hands to Architect/Analyst |
| Developer | produce bounded technical changes | plan, acceptance → implementation, execution evidence | does not self-approve high-risk work; checked by Tester/Reviewer |
| Reviewer | independently challenge correctness and conformance | change, contract, evidence → findings, verdict | must disclose conflicts; does not rewrite criteria retroactively |
| Writer | create precise, navigable project knowledge | source facts, audience → documentation | cannot invent product behavior; validated by subject owner |
| Designer | define usable visual or interaction behavior | user goals, constraints → design artifacts, rationale | does not infer accessibility compliance without evidence |
| Analyst | turn data into bounded conclusions | question, data, assumptions → analysis and uncertainty | does not imply causation from correlation |
| Tester | design and execute discriminating checks | acceptance, change → test evidence, defects | cannot waive failures; interacts with Developer and Reviewer |
| Planner | decompose goals into ordered, testable increments | goals, constraints → plan, dependencies, risks | does not perform owner-only prioritization |
| Coordinator | own task state, routing, and checkpoints | portfolio and status → assignments, handoffs | does not replace domain review or silently alter outputs |
| Memory Manager | capture and reconcile durable project state | accepted learning → canonical memory updates | cannot promote unvalidated claims |
| Knowledge Curator | maintain taxonomy, links, provenance, expiry | repository knowledge → coherent knowledge graph | does not decide subject truth without a qualified reviewer |

## Responsibilities

The coordinator maintains an assignment ledger. Each assignee confirms inputs and returns artifacts, evidence, unresolved questions, and next recipient. The owner resolves incompatible responsibilities and approves elevated authority.

## Workflow

Determine the transition to be performed; select the minimum roles; check conflicts; issue bounded assignments; receive outputs through explicit handoffs; run required review; then release roles. Role reassignment MUST preserve the checkpoint and must not erase responsibility for earlier claims.

## Example

For a schema change, the Architect proposes the boundary, Developer implements, Tester produces compatibility evidence, Reviewer assesses the contract, and Memory Manager records the accepted invariant. One low-risk agent may combine the first two roles; it may not claim independent review.

## Anti-patterns

- Creating agents because role names exist.
- Delegating the same mutable file to uncoordinated executors.
- Treating a “Reviewer” label as evidence of independence.

## Best practices

Assign outputs rather than activity, minimize handoffs, and separate roles only where expertise, independence, or parallel throughput adds value.

## Related specifications

[VECTRA-005](VECTRA-005-agent-protocol.md), [VECTRA-010](VECTRA-010-multi-agent-collaboration.md), and [VECTRA-011](VECTRA-011-quality-assurance.md).
