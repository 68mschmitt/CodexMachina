# OpenCode Agentic Repository - CodexMachina

A language-agnostic, repo-scoped home for **agents**, **workflows**, and **shared context packs** for intelligent software development automation.

## Overview

This repository provides the foundational structure, templates, and configurations for running multi-agent workflows that drive development from planning to implementation and documentation.

## Quick Start

### Prerequisites

- OpenCode CLI installed (if using OpenCode framework)
- Git for version control
- Bash for running scripts

### Running Workflows

```bash
# Brainstorm a new feature
opencode run opencode/workflows/brainstorm_feature.yaml \
  --var feature="Feature Name" \
  --context .

# Plan a feature
opencode run opencode/workflows/plan_feature.yaml \
  --var feature="Feature Name" \
  --context .

# Implement a feature
opencode run opencode/workflows/code_feature.yaml \
  --var feature="Feature Name" \
  --context .
```

## Directory Structure

```
opencode/
├── agents/              # 8 specialized agent definitions
├── workflows/           # 3 main workflows (brainstorm, plan, code)
├── packs/
│   ├── style/          # Coding standards and conventions
│   ├── arch/           # Architecture and design principles
│   ├── glossary/       # Domain terminology
│   └── adr/            # Architecture Decision Records
├── templates/          # Document templates (RFC, TestPlan, etc.)
├── gates/              # Quality gates (lint, format, tests, etc.)
├── tools/              # Tool wrappers (repo operations, git, etc.)
├── presets/            # Configuration presets (minimal, strict)
├── scripts/            # Utility scripts for validation and rendering
└── docs/               # Additional documentation
```

## Agents

This framework includes 8 specialized agents:

1. **Facilitator** - Orchestrates agent collaboration and workflow
2. **Planner** - Creates RFCs and test plans from tickets
3. **Architect** - Makes key architectural decisions and documents them
4. **TestWriter** - Creates comprehensive test suites
5. **Implementer** - Writes code to satisfy tests with small diffs
6. **Reviewer** - Reviews code for quality and adherence to standards
7. **ConstraintsKeeper** - Ensures compliance with project policies
8. **DocWriter** - Creates and maintains documentation

## Workflows

### brainstorm_feature
Explore possibilities and implications for new features.
- **Duration:** 30-60 minutes
- **Agents:** Facilitator, Planner, Architect
- **Output:** Brainstorm notes with options and recommendations

### plan_feature
Create detailed planning documents and architectural decisions.
- **Duration:** 1-2 hours
- **Agents:** All planning agents
- **Output:** RFC, TestPlan, ARCHITECTURE.md, CHANGELOG entry

### code_feature
Implement a feature from planning to merged PR.
- **Duration:** 2-8 hours (depends on complexity)
- **Agents:** All agents
- **Output:** Merged PR with tests, code, and documentation

## Quality Gates

All workflows enforce quality standards through gates:

- **lint.sh** - Code must pass linting
- **format.sh** - Code must be properly formatted
- **tests.sh** - All tests must pass
- **diffsize.sh** - Commits must be under 400 lines
- **adr_required.sh** - ADR required for architectural changes

## Configuration

### opencode.project.yaml

Main configuration file defining:
- Include paths for agent/workflow discovery
- Environment variables and project settings
- Tool mappings
- Available agents, workflows, and presets

### Presets

Two presets are included:

- **minimal** - Essential gates only (lint, tests)
- **strict** - Comprehensive validation (lint, format, tests, build, diff size, ADR)

## Context Packs

### STYLE.md
Coding conventions and standards for the project, including:
- Naming conventions
- Code organization
- Language-specific guidelines
- Error handling and testing practices
- Security and performance considerations

### ARCH.md
System architecture documentation including:
- Component descriptions
- Workflow diagrams
- Design principles
- Extension points
- Constraints and policies

### Domain.md
Glossary of domain-specific terminology and concepts.

### ADR Guide
Process and template for Architecture Decision Records.

## Templates

Pre-formatted templates for common documents:

- **RFC.md** - Request for Comments for feature proposals
- **TestPlan.md** - Test strategy and execution plan
- **ONE-PAGER.md** - Executive summary of feature
- **OPTIONS.md** - Analysis of implementation options
- **CHANGELOG_ENTRY.md** - Release notes
- **ticket.json** - Issue/ticket metadata

## Tools

Wrapper scripts for common operations:

- **repo_search.sh** - Search repository for patterns
- **repo_map.sh** - Generate repository structure map
- **repo_edit.sh** - Safely edit files with validation
- **http_request.sh** - Make HTTP requests
- **diagram_mermaid.sh** - Generate diagrams

## Extending This Repository

### Adding Custom Agents

1. Create `opencode/agents/YourAgent.yaml`
2. Define mission, scope, io_contract, and quality_bars
3. Add to workflows that need it
4. Test with OpenCode CLI

### Adding Custom Workflows

1. Create `opencode/workflows/your_workflow.yaml`
2. Define agents, tools, gates, and variables
3. Reference in documentation
4. Test execution

### Project-Specific Overrides

Create `opencode.local/` directory to override without modifying shared repo:

```
opencode.local/
├── agents/         # Override specific agent definitions
├── presets/        # Adjust gates per project
└── packs/          # Layer project-specific context
```

## Versioning

This repository follows semantic versioning:

- **MAJOR** - Schema changes or breaking updates to agents/workflows
- **MINOR** - New agents, workflows, or features
- **PATCH** - Bug fixes and improvements

Compatibility table:

| OpenCode | This Repo |
|----------|-----------|
| 1.0.29   | ≥ 0.1.0   |

## Best Practices

1. **Keep agent scopes small and explicit** - Avoid overlapping responsibilities
2. **Promote stable prompts into presets** - Share working configurations
3. **Use gates liberally** - Quality gates catch more than clever logic
4. **Treat this like a product** - Maintain changelog, test, release
5. **Make project overrides cheap** - Don't fork the shared repo

## Contributing

Improvements and additions are welcome! When contributing:

1. Validate all YAML against schemas
2. Test workflows before submitting
3. Update CHANGELOG.md
4. Keep documentation current
5. Maintain backward compatibility when possible

## License

[Add your license here]

## Support

For issues or questions:

- Check existing ADRs in `opencode/packs/adr/`
- Review template examples
- Consult STYLE.md and ARCH.md
- Report bugs with full context

---

**Last Updated:** November 2025  
**Maintained By:** CodexMachina Team
