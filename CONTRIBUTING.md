# Contributing to CodexMachina Agents

Thank you for your interest in contributing! This document provides guidelines for contributing to the OpenCode agentic repository.

## Getting Started

### Prerequisites

- Git knowledge
- Familiarity with YAML
- Understanding of the agent/workflow model
- Access to the repository

### Setup

1. Fork or clone the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes
4. Test your changes locally
5. Submit a pull request

## Contribution Areas

### Adding New Agents

1. **Define scope clearly** - What is this agent responsible for?
2. **Create agent YAML** - Follow the schema in `agents/_common.schema.yaml`
3. **Add to workflows** - Which workflows will use this agent?
4. **Document guardrails** - What must this agent NOT do?
5. **Test integration** - Verify the agent works in target workflows
6. **Update documentation** - Add to ARCH.md and examples

Example:

```yaml
name: MyAgent
version: 1
mission: Specific, well-defined purpose
scope_of_work:
  - Responsibility 1
  - Responsibility 2
out_of_scope:
  - Not responsible for X
io_contract:
  inputs: [file1, file2]
  outputs: [file3]
quality_bars:
  - Standard 1
  - Standard 2
```

### Adding New Workflows

1. **Define inputs and outputs** - What does this workflow need/produce?
2. **Choose agents** - Which agents are needed?
3. **Define gates** - What quality standards apply?
4. **Create workflow YAML** - Follow the schema in `workflows/_common.schema.yaml`
5. **Document purpose** - Write description and usage examples
6. **Test execution** - Run with opencode CLI

### Improving Gates

1. **Identify gaps** - What quality standards are missing?
2. **Write gate script** - Add to `gates/` with clear documentation
3. **Test coverage** - Ensure it catches real issues
4. **Add to presets** - Include in minimal/strict as appropriate
5. **Document exceptions** - Explain when gates can be bypassed

### Updating Context Packs

1. **STYLE.md** - Update when conventions change
2. **ARCH.md** - Reflect architectural decisions
3. **Domain.md** - Add new terminology
4. **ADRs** - Document decisions in `packs/adr/`

## Code Review Process

1. **All PRs require review** - At least one approval needed
2. **Validate schemas** - Run `opencode/scripts/check.yaml`
3. **Test workflows** - Verify changes work end-to-end
4. **Update documentation** - Docs are not optional
5. **CHANGELOG entry** - Document changes for users

## Guidelines

### Naming Conventions

- **Agent names**: PascalCase (e.g., `MyAgent`)
- **Workflow names**: kebab-case (e.g., `my_workflow`)
- **File names**: kebab-case
- **ADR files**: `ADR-{{number}}-{{title}}.md`

### Documentation Standards

- Clear, concise writing
- Examples for complex concepts
- Links between related docs
- Keep README updated
- Add CHANGELOG entry

### Code Quality

- All YAML must validate against schemas
- Scripts must be executable and well-commented
- No hardcoded paths or secrets
- Use environment variables for configuration

### Testing

- Test locally before submitting
- Run gate scripts to verify
- Test workflows end-to-end
- Document test approach

## Commit Message Format

Follow Conventional Commits:

```
<type>(<scope>): <subject>

<body>

<footer>
```

Types:
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation
- `style` - Formatting
- `refactor` - Code restructuring
- `test` - Adding tests
- `chore` - Maintenance

Examples:

```
feat(agents): add DataProcessor agent

fix(workflows): resolve timing issue in code_feature

docs(arch): update system architecture diagram
```

## Pull Request Template

```markdown
## Description
Brief summary of changes

## Type of Change
- [ ] New agent
- [ ] New workflow
- [ ] Bug fix
- [ ] Enhancement
- [ ] Documentation

## Changes
- Change 1
- Change 2

## Testing
How was this tested?

## Documentation
- [ ] README updated
- [ ] CHANGELOG updated
- [ ] Architecture docs updated
- [ ] Comments added

## Checklist
- [ ] YAML validates
- [ ] Scripts are executable
- [ ] No hardcoded secrets
- [ ] Works with opencode CLI
```

## Reporting Issues

When reporting bugs or suggesting features:

1. **Search existing issues** - Avoid duplicates
2. **Provide context** - What were you trying to do?
3. **Include errors** - Full error messages help
4. **Suggest solutions** - If you have ideas
5. **Link to related** - Reference related issues/PRs

## Asking Questions

- Check documentation first (README.md, ARCH.md, STYLE.md)
- Review existing ADRs
- Search past issues
- Ask in discussions (if available)

## Recognition

Contributors are recognized in:
- Pull request discussions
- Release notes
- Project documentation

Thank you for helping make CodexMachina better!

---

For more information, see:
- [ARCH.md](opencode/packs/arch/ARCH.md) - System architecture
- [STYLE.md](opencode/packs/style/STYLE.md) - Coding conventions
- [Domain.md](opencode/packs/glossary/Domain.md) - Glossary
