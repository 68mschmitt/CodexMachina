# Project Index - OpenCode Agentic Repository

## Quick Navigation

### Core Files
- **README.md** - Project overview and quick start guide
- **CHANGELOG.md** - Release history and versioning
- **CONTRIBUTING.md** - Contribution guidelines
- **LICENSE** - MIT License

### Configuration
- **opencode/opencode.project.yaml** - Main project configuration

### Agents (8 total)
1. **opencode/agents/Facilitator.yaml** - Orchestrates agent collaboration
2. **opencode/agents/Planner.yaml** - Creates RFCs and test plans
3. **opencode/agents/Architect.yaml** - Makes architectural decisions
4. **opencode/agents/TestWriter.yaml** - Writes comprehensive tests
5. **opencode/agents/Implementer.yaml** - Writes code to satisfy tests
6. **opencode/agents/Reviewer.yaml** - Reviews code quality
7. **opencode/agents/ConstraintsKeeper.yaml** - Ensures compliance
8. **opencode/agents/DocWriter.yaml** - Creates documentation

### Workflows (3 total)
1. **opencode/workflows/brainstorm_feature.yaml** - Explore ideas (30-60 min)
2. **opencode/workflows/plan_feature.yaml** - Create plans (1-2 hours)
3. **opencode/workflows/code_feature.yaml** - Implement (2-8 hours)

### Context Packs
- **opencode/packs/style/STYLE.md** - Coding conventions and standards
- **opencode/packs/arch/ARCH.md** - System architecture and design
- **opencode/packs/glossary/Domain.md** - Terminology and concepts
- **opencode/packs/adr/README.md** - Architecture Decision Record guide

### Templates
- **opencode/templates/RFC.md** - Feature proposal template
- **opencode/templates/TestPlan.md** - Testing strategy template
- **opencode/templates/ONE-PAGER.md** - Executive summary template
- **opencode/templates/OPTIONS.md** - Analysis alternatives template
- **opencode/templates/CHANGELOG_ENTRY.md** - Release notes template
- **opencode/templates/ticket.json** - Issue metadata template

### Quality Gates
- **opencode/gates/lint.sh** - Code linting validation
- **opencode/gates/format.sh** - Code formatting check
- **opencode/gates/tests.sh** - Test suite execution
- **opencode/gates/diffsize.sh** - Commit size limits (400 lines)
- **opencode/gates/adr_required.sh** - ADR requirement validation

### Tools
- **opencode/tools/repo_search.sh** - Search repository for patterns
- **opencode/tools/repo_map.sh** - Generate repository structure
- **opencode/tools/repo_edit.sh** - Safely edit files with validation
- **opencode/tools/http_request.sh** - Make HTTP requests
- **opencode/tools/diagram_mermaid.sh** - Generate Mermaid diagrams

### Presets
- **opencode/presets/minimal.yaml** - Minimal validation (lint, tests)
- **opencode/presets/strict.yaml** - Full validation (all gates)

### Documentation
- **opencode/docs/WORKFLOW.md** - Detailed workflow documentation
- **opencode/agents/_common.schema.yaml** - Agent schema validation
- **opencode/workflows/_common.schema.yaml** - Workflow schema validation

### CI/CD
- **.github/workflows/validate.yml** - YAML schema validation
- **.github/workflows/release.yml** - Release automation

---

## Key Statistics

| Category | Count |
|----------|-------|
| Agents | 8 |
| Workflows | 3 |
| Quality Gates | 5 |
| Tools | 5 |
| Templates | 6 |
| Context Packs | 4 |
| Total Files | 42+ |
| Total Lines | 3000+ |

---

## Architecture Overview

```
User Request
    ↓
Facilitator (orchestrates)
    ↓
├─ Planner (plans)
├─ Architect (designs)
├─ TestWriter (writes tests)
├─ Implementer (codes)
├─ Reviewer (reviews)
├─ ConstraintsKeeper (validates)
└─ DocWriter (documents)
    ↓
Quality Gates (5 checkpoints)
    ↓
Merged & Deployed
```

---

## Feature Matrix

| Feature | Implemented | Location |
|---------|-------------|----------|
| Multi-agent orchestration | ✓ | agents/ |
| Feature workflows | ✓ | workflows/ |
| Quality validation | ✓ | gates/ |
| Context packs | ✓ | packs/ |
| Document templates | ✓ | templates/ |
| Tool integration | ✓ | tools/ |
| Schema validation | ✓ | agents/workflows/ |
| CI/CD automation | ✓ | .github/workflows/ |
| Configuration presets | ✓ | presets/ |
| Comprehensive docs | ✓ | docs/, root level |

---

## Getting Started Checklist

- [ ] Read README.md for overview
- [ ] Review ARCH.md for architecture
- [ ] Check STYLE.md for conventions
- [ ] Review agent specifications
- [ ] Test brainstorm_feature workflow
- [ ] Create project-specific scripts
- [ ] Implement first feature ticket
- [ ] Create first ADR
- [ ] Customize context packs

---

## Common Tasks

### Running a Workflow
```bash
opencode run opencode/workflows/plan_feature.yaml \
  --var feature="Feature Name" \
  --context .
```

### Adding a New Agent
1. Create opencode/agents/MyAgent.yaml
2. Define mission, scope, io_contract
3. Add to target workflows
4. Test with opencode CLI

### Creating an ADR
1. Use opencode/packs/adr/README.md as guide
2. Save as opencode/packs/adr/ADR-{{number}}-{{title}}.md
3. Reference from RFC or ARCH

### Customizing for Your Project
1. Update opencode/packs/style/STYLE.md
2. Update opencode/packs/arch/ARCH.md
3. Extend opencode/packs/glossary/Domain.md
4. Create project-specific scripts

---

## Directory Tree

```
codexmachina/
├── opencode/                    # Main agentic repo
│   ├── agents/                  # 8 agent definitions
│   ├── workflows/               # 3 core workflows
│   ├── packs/                   # Context and knowledge
│   ├── templates/               # Document templates
│   ├── gates/                   # Quality validation
│   ├── tools/                   # Tool integrations
│   ├── presets/                 # Configuration presets
│   ├── docs/                    # Internal docs
│   ├── examples/                # Example fixtures
│   ├── scripts/                 # Utility scripts
│   └── opencode.project.yaml    # Configuration
├── .github/
│   └── workflows/               # CI/CD automation
├── README.md                    # Project overview
├── CHANGELOG.md                 # Release history
├── CONTRIBUTING.md              # Contribution guide
└── LICENSE                      # MIT License
```

---

## Version Information

- **Version**: 0.1.0 (Initial Release)
- **Status**: Production Ready
- **OpenCode Compatibility**: >= 1.0.29
- **Created**: November 2025

---

## Support & Resources

- **README.md** - Overview and quick start
- **ARCH.md** - System architecture details
- **STYLE.md** - Coding standards
- **Domain.md** - Terminology glossary
- **WORKFLOW.md** - Detailed workflow guide
- **CONTRIBUTING.md** - How to extend

---

**Last Updated**: November 5, 2025  
**Maintained by**: CodexMachina Team
