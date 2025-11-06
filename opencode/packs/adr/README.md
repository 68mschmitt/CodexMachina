# ADR (Architecture Decision Record) Guide

Architecture Decision Records document significant technical decisions and their rationale. They help teams understand the history of architectural choices.

## When to Create an ADR

Create an ADR when:
- Making a significant architectural decision
- Choosing between multiple technical approaches
- Setting precedent for future decisions
- Recording decisions that have project-wide impact
- Documenting why something was chosen over alternatives

## ADR Template

```markdown
# ADR-{{number}}: {{title}}

## Status
{{status: Proposed | Accepted | Deprecated | Superseded}}

## Context
{{Describe the issue or problem that motivated this decision}}

## Decision
{{State the architectural decision that was made}}

## Rationale
{{Explain why this decision was made over alternatives}}

## Consequences
### Positive
- {{positive consequence}}

### Negative
- {{negative consequence}}

### Neutral
- {{neutral consequence}}

## Alternatives Considered
- {{alternative 1}}: {{reason not chosen}}
- {{alternative 2}}: {{reason not chosen}}

## Related ADRs
- {{related ADR}}

## Decision Date
{{Date when decision was made}}

## Decided By
{{Who made the decision}}
```

## ADR Status Values

- **Proposed**: Awaiting discussion and decision
- **Accepted**: Approved and in use
- **Deprecated**: Superseded by newer decision
- **Superseded**: Replaced by ADR-{{number}}

## Example ADR

### ADR-0001: Use Git Conventional Commits

**Status:** Accepted

**Context:**
Commit messages are difficult to parse and lack consistency across the team.

**Decision:**
All commits must follow the Conventional Commits specification.

**Rationale:**
- Provides structured, machine-readable commit messages
- Enables automatic changelog generation
- Improves commit history readability
- Industry standard

**Consequences:**
- Positive: Better tooling support, clearer history
- Negative: Slight overhead for developers
- Neutral: No impact on runtime behavior

---

## Locations

ADRs are stored in: `/opencode/packs/adr/`

Naming convention: `ADR-{{number}}-{{title}}.md`

Example: `ADR-0001-use-conventional-commits.md`
