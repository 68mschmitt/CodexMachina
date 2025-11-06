# Domain Glossary

## Core Concepts

### Agent
An autonomous entity with a specific mission and scope. Agents have defined inputs, outputs, quality bars, and guardrails.

### Workflow
A directed sequence of agents and quality gates that transforms input artifacts into output artifacts.

### Ticket
A discrete unit of work describing a feature or bug fix. Tickets have acceptance criteria and priorities.

### RFC (Request for Comments)
A document proposing a feature or significant change. Includes problem statement, proposed solution, acceptance criteria, and risks.

### ADR (Architecture Decision Record)
A document recording a significant technical decision and its rationale.

### Gate (Quality Gate)
An automated check that must pass before work can proceed. Examples: tests pass, linting passes, diff size limit.

### Context Pack
A reusable collection of knowledge artifacts (STYLE.md, ARCH.md, Domain.md, ADRs).

### Preset
A configuration bundle that groups agents, tools, and gates for a specific purpose (e.g., minimal, strict).

### Tool
A script or command that performs specific operations. Examples: repo.search, run.tests, git.commit.

### Topic Branch
A Git branch created for a specific ticket or feature.

## Process Terminology

### Brainstorm Phase
Exploratory phase where ideas are discussed and possibilities are examined.

### Plan Phase
Phase where detailed planning occurs: RFC creation, test planning, architecture decisions, constraints review.

### Code Phase
Implementation phase: writing tests, implementing code, reviewing, and merging.

### Facilitator
The orchestrating agent responsible for workflow coordination and stakeholder communication.

### Constraints Keeper
The agent responsible for ensuring compliance with project policies and constraints.

## Quality & Metrics

### Coverage
Percentage of code tested by automated tests. Target: 80%+.

### Diff Size
Number of lines changed in a commit. Guideline: ≤400 lines for reviewability.

### Quality Bar
Minimum acceptable standard for an artifact or process step.

### Gate Report
Summary of all quality gates passed or failed during workflow execution.

## Git Terminology

### Commit
A snapshot of code changes with a message describing what changed and why.

### Branch
An isolated line of development, typically tied to a specific feature or ticket.

### PR (Pull Request)
A proposal to merge changes into main development branch. Includes discussion and review.

### Merge
The act of combining changes from one branch into another (typically main/master).

## Related Standards

### Conventional Commits
A specification for adding human and machine readable meaning to commit messages.

Format: `<type>(<scope>): <subject>`

Types: feat, fix, docs, style, refactor, perf, test, chore, ci

### Semantic Versioning
Version format: MAJOR.MINOR.PATCH

- MAJOR: Breaking changes
- MINOR: New features (backward compatible)
- PATCH: Bug fixes (backward compatible)
