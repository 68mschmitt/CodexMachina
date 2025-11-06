# CodexMachina Architecture

## Project Overview

CodexMachina is a multi-agent system designed for intelligent software development automation.

## System Architecture

### High-Level Components

```
┌─────────────────────────────────────────────────────┐
│          Orchestration Layer (Facilitator)           │
├─────────────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────┐  ┌────────────┐ │
│  │   Planner    │  │  Implementer │  │  Reviewer  │ │
│  └──────────────┘  └──────────────┘  └────────────┘ │
│  ┌──────────────┐  ┌──────────────┐  ┌────────────┐ │
│  │  TestWriter  │  │  Architect   │  │ DocWriter  │ │
│  └──────────────┘  └──────────────┘  └────────────┘ │
│  ┌──────────────────────────────────────────────────┐ │
│  │        ConstraintsKeeper (Policy Layer)          │ │
│  └──────────────────────────────────────────────────┘ │
├─────────────────────────────────────────────────────┤
│          Tools & Integrations Layer                  │
│  ├─ repo.search  ├─ repo.edit  ├─ run.tests         │
│  ├─ run.lint    ├─ run.format  ├─ git.branch        │
│  └─ git.commit  └─ git.pr                           │
├─────────────────────────────────────────────────────┤
│         Context & Knowledge Layer                    │
│  ├─ STYLE.md    ├─ ARCH.md  ├─ Domain.md            │
│  └─ ADRs                                             │
└─────────────────────────────────────────────────────┘
```

## Workflows

### brainstorm_feature
Explore ideas and possibilities for new features.
- Input: Feature ticket
- Agents: Facilitator, Planner, Architect
- Output: Brainstorm notes and initial options

### plan_feature
Create comprehensive planning documents and make key decisions.
- Input: Feature ticket, ARCH
- Agents: All planning agents
- Output: RFC, TestPlan, ARCHITECTURE, CHANGELOG

### code_feature
Implement, test, review, and deploy a feature.
- Input: Planning documents, ticket
- Agents: All implementation agents
- Output: PR with commits, tests, docs

## Design Principles

### 1. Separation of Concerns
Each agent has a clearly defined role and doesn't overlap with others. Facilitator orchestrates but doesn't implement.

### 2. Quality Gates
All workflows enforce minimum quality standards:
- Tests must pass
- Code must be formatted
- Linting must pass
- Diff size limits apply

### 3. Documentation as First-Class
All decisions are documented in ADRs, RFCs, and code comments.

### 4. Constraint Compliance
ConstraintsKeeper ensures all work respects project constraints and policies.

### 5. Traceability
Every change is traceable back to a ticket and decision.

## Technology Stack

- **Language:** Language-agnostic (configured per project)
- **Orchestration:** OpenCode Framework
- **VCS:** Git
- **CI/CD:** GitHub Actions (configurable)
- **Storage:** File-based (YAML, Markdown, JSON)

## Directory Structure

```
opencode/
├── agents/           # Agent specifications
├── workflows/        # Workflow definitions
├── packs/            # Reusable context packs
├── templates/        # Document templates
├── gates/            # Quality gates scripts
├── tools/            # Tool integrations
├── presets/          # Configuration presets
└── docs/             # Documentation
```

## Extensibility

### Adding New Agents
1. Create agent YAML in `/agents/`
2. Define mission, scope, io_contract, quality_bars
3. Add to workflows that need it
4. Test with validators

### Adding New Workflows
1. Create workflow YAML in `/workflows/`
2. Define agents, tools, gates, inputs, outputs
3. Reference context packs as needed
4. Test execution with opencode CLI

### Adding New Tools
1. Create tool wrapper script in `/tools/`
2. Register in `opencode.project.yaml`
3. Add documentation for usage
4. Test integration with workflows

## Constraints & Policies

### Code Changes
- Diffs must not exceed MAX_DIFF_LINES (400)
- All code must follow STYLE.md conventions
- Tests must have 80%+ coverage

### Documentation
- All features must have RFC
- All architectural decisions must have ADR
- CHANGELOG must be updated
- README must reflect current state

### Security
- No secrets in version control
- All dependencies must be tracked
- Security issues escalated immediately

### Performance
- All agents must complete within reasonable time
- Quality gates must not block legitimate changes
- Tool integrations must be efficient

## Future Considerations

- [ ] Support for custom agents per project
- [ ] Advanced scheduling and parallelization
- [ ] Historical analytics and metrics
- [ ] Multi-project coordination
- [ ] Integration with project management tools
