# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-11-05

### Added

- Initial release of OpenCode agentic repository template for CodexMachina
- 8 specialized agents: Facilitator, Planner, Architect, TestWriter, Implementer, Reviewer, ConstraintsKeeper, DocWriter
- 3 core workflows: brainstorm_feature, plan_feature, code_feature
- Agent and workflow JSON schemas for validation
- Quality gates: lint, format, tests, diffsize, adr_required
- Tool wrappers: repo_search, repo_map, repo_edit, http_request, diagram_mermaid
- Context packs: STYLE.md, ARCH.md, Domain.md, ADR guide
- Document templates: RFC, TestPlan, ONE-PAGER, OPTIONS, CHANGELOG_ENTRY, ticket.json
- Configuration presets: minimal and strict
- GitHub Actions CI workflows: validate and release
- Comprehensive documentation and glossary

### Project Structure

```
opencode/
├── agents/                    # 8 agent specifications
├── workflows/                 # 3 workflow definitions
├── packs/                     # Context packs and knowledge
├── templates/                 # Document templates
├── gates/                     # Quality gates
├── tools/                     # Tool integrations
├── presets/                   # Configuration presets
├── scripts/                   # Utility scripts
└── docs/                      # Documentation

.github/
└── workflows/                 # CI/CD automation
```

### Architecture Highlights

- **Separation of Concerns**: Each agent has clearly defined scope and guardrails
- **Quality Gates**: Automated enforcement of code quality, style, and test standards
- **Documentation First**: All decisions documented in RFCs and ADRs
- **Constraint Compliance**: Built-in policy enforcement through ConstraintsKeeper agent
- **Extensible Design**: Easy to add custom agents, workflows, and tools

### Documentation

- README.md with quick start and overview
- ARCH.md with system architecture and design principles
- STYLE.md with coding conventions
- Domain.md with glossary of terms
- ADR guide for documenting decisions
- Templates for RFC, test plans, and changelog entries

---

## Future Roadmap

### Planned Features

- [ ] Example fixture repositories for testing workflows
- [ ] Validation scripts with Python (schemas, templates)
- [ ] Advanced scheduling and parallel agent execution
- [ ] Historical metrics and analytics
- [ ] Multi-project coordination
- [ ] Integration with Jira, GitHub Issues, Linear, etc.
- [ ] Custom hooks and plugins
- [ ] Agent performance profiling
- [ ] Decision history and audit trails

### Enhancement Ideas

- [ ] Support for async agent operations
- [ ] Workflow visualization and debugging
- [ ] Agent capability discovery
- [ ] Dynamic resource allocation
- [ ] Cost tracking for agent execution
- [ ] Multi-language agent support
- [ ] Event-driven workflow triggers
- [ ] Rollback and recovery mechanisms

---

## Version History

| Version | Status | Date | Notes |
|---------|--------|------|-------|
| 0.1.0 | Active | 2025-11-05 | Initial release |

---

## Upgrading

See `CHANGELOG.md` in your project root for breaking changes and migration guides.

For significant API changes, check the compatibility matrix at the top of README.md.
