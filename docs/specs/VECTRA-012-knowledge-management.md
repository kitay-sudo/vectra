# VECTRA-012: Knowledge Management

**Status:** Draft · **Version:** 0.1.0 · **Normative:** Yes

## Purpose

Maintain project knowledge as an addressable, versioned graph with ownership and lifecycle.

## Definitions

- **Knowledge node:** canonical artifact representing a subject or event.
- **Relation:** typed link such as `governs`, `implements`, `validates`, `supersedes`, or `depends-on`.
- **Lifecycle:** draft, validated, active, stale, superseded, or archived.
- **Canonical location:** single authoritative home for a knowledge claim.

## Rules

Every active knowledge node MUST have owner, status, scope, provenance, and stable identifier or path. A fact SHOULD have one canonical location and MAY have linked summaries. Relations MUST be navigable in both practical directions through links or indexes. Versioned knowledge MUST state compatibility impact. Stale content MUST be marked, repaired, or archived—not left silently authoritative.

## Responsibilities

Authors maintain accuracy at creation. Subject owners validate meaning. Knowledge curators maintain taxonomy, relations, and deduplication. Memory managers promote accepted task learning. Maintainers govern versions and archives.

## Workflow

Capture → classify → validate → publish canonically → link into indexes → use and observe → revalidate on trigger → supersede or archive. Triggers include releases, incidents, dependency changes, failed assumptions, owner decisions, and scheduled expiry.

Recommended metadata: `id`, `title`, `status`, `owner`, `created`, `last_verified`, `source`, `tags`, `relations`, `vectra_version`.

## Example

A decision node `DR-004` supersedes `DR-001`, implements project constraint `C-2`, and is validated by test report `EV-18`. The index points to both decisions and labels the older one superseded.

## Anti-patterns

- Folder structure mistaken for a knowledge graph.
- Tags with no controlled vocabulary.
- Deleting history to make current guidance look consistent.

## Best practices

Keep taxonomy shallow, use typed links for consequential relations, automate orphan and broken-link checks, and archive without destroying provenance.

## Related specifications

[VECTRA-003](VECTRA-003-memory.md), [VECTRA-004](VECTRA-004-decisions.md), and [VECTRA-009](VECTRA-009-context-engineering.md).
