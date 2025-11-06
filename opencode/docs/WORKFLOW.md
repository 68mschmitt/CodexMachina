# CodexMachina Workflows

This directory contains OpenCode workflow definitions for the CodexMachina project.

## Available Workflows

### 1. brainstorm_feature
**Purpose:** Explore ideas and possibilities for new features

**Agents:**
- Facilitator: Coordinates the session
- Planner: Analyzes the feature request
- Architect: Considers architectural implications

**Duration:** 30-60 minutes

**Usage:**
```bash
opencode run opencode/workflows/brainstorm_feature.yaml \
  --var feature="User Authentication" \
  --context .
```

### 2. plan_feature
**Purpose:** Create detailed planning documents and make key architectural decisions

**Agents:**
- Facilitator: Orchestrates planning
- Planner: Creates RFC and test plan
- Architect: Makes design decisions and creates ADR if needed
- ConstraintsKeeper: Validates against project constraints
- DocWriter: Finalizes documentation

**Duration:** 1-2 hours

**Output:**
- RFC.md with feature specification
- TestPlan.md with testing strategy
- ARCHITECTURE.md with design decisions
- OPTIONS.md with alternatives analysis
- CHANGELOG entry

**Usage:**
```bash
opencode run opencode/workflows/plan_feature.yaml \
  --var feature="User Authentication" \
  --context .
```

### 3. code_feature
**Purpose:** Implement, test, review, and deploy a feature

**Agents:**
- Facilitator: Ensures workflow execution
- TestWriter: Creates test suite
- Implementer: Writes code to pass tests
- Reviewer: Reviews code quality
- ConstraintsKeeper: Validates compliance
- DocWriter: Updates documentation

**Duration:** 2-8 hours (depends on complexity)

**Quality Gates:**
- Linting passes
- Code formatting valid
- All tests pass
- Build succeeds
- Diff size under 400 lines
- ADR exists for architectural changes

**Output:**
- Merged PR with commits
- Test coverage report
- Updated CHANGELOG

**Usage:**
```bash
opencode run opencode/workflows/code_feature.yaml \
  --var feature="User Authentication" \
  --context .
```

## Preset Configurations

### Minimal Preset
- Essential gates only (lint, tests)
- Core agents (Facilitator, Planner, Implementer)
- Fastest execution

### Strict Preset
- All quality gates enabled
- All agents involved
- Best for production features

## Workflow Composition

```
brainstorm_feature
  ├─ Facilitator (reads ticket, coordinates)
  ├─ Planner (analyzes requirements)
  └─ Architect (identifies implications)

plan_feature
  ├─ Facilitator (orchestrates)
  ├─ Planner (creates RFC, test plan)
  ├─ Architect (design decisions)
  ├─ ConstraintsKeeper (validates)
  └─ DocWriter (finalizes docs)

code_feature
  ├─ Facilitator (monitors execution)
  ├─ TestWriter (creates tests)
  ├─ Implementer (writes code)
  ├─ Reviewer (checks quality)
  ├─ ConstraintsKeeper (validates)
  └─ DocWriter (updates docs)
```

## Extending Workflows

To add a new workflow:

1. Create YAML file in this directory
2. Define inputs, agents, tools, gates
3. Validate against schema: `agents/_common.schema.yaml`
4. Test with opencode CLI
5. Document in this README

Example workflow YAML:

```yaml
name: my_workflow
version: 1
description: Purpose of this workflow

inputs:
  - required_input_file.txt

outputs:
  - output_file.md

agents:
  - use: Facilitator
  - use: Implementer

tools:
  - repo.search
  - run.tests

preset: minimal

gates:
  - run.lint: pass
```

## Troubleshooting

### Workflow fails at agent X
1. Check agent logs
2. Verify inputs are available
3. Check guardrails aren't violated
4. Review quality bar requirements

### Quality gate fails
1. Read gate error message
2. Fix the issue (lint, format, tests)
3. Re-run workflow
4. Check CHANGELOG entry

### Variables not found
1. Ensure variables are passed with `--var`
2. Check variable names match template
3. Verify variable values are correct

## Best Practices

1. **Run plan_feature before code_feature** - Ensures good planning
2. **Use strict preset for main branch** - Maximum quality
3. **Use minimal preset for experiments** - Faster feedback
4. **Always create ADRs for architectural decisions**
5. **Keep commits small and reviewable** (max 400 lines)

---

For more information:
- [README.md](../README.md) - Project overview
- [ARCH.md](opencode/packs/arch/ARCH.md) - System architecture
- [Glossary](opencode/packs/glossary/Domain.md) - Terminology
