# OpenCode Agentic Repo Template (v1.0.29)

A language-agnostic, repo-scoped home for your **agents**, **workflows**, and **shared context packs** that you can drop into *any* project with minimal wiring.

This template is optimized for:

* **Reusability**: one repo → many projects (via submodule, subtree, or package release)
* **Clarity**: opinionated layout and naming
* **Safety**: guardrails and gates built-in
* **Automation**: CLI scripts + CI to validate agents/workflows before use

---

## Repo layout

```
/opencode/                          # Everything an agent needs lives under here
  opencode.project.yaml             # Top-level knobs, defaults, env, path aliases
  /agents/                          # Agent specs (YAML)
    Facilitator.yaml
    Planner.yaml
    Implementer.yaml
    Reviewer.yaml
    TestWriter.yaml
    Architect.yaml
    ConstraintsKeeper.yaml
    DocWriter.yaml
    _common.schema.yaml             # JSON Schema for agent spec validation
  /workflows/                       # Workflow graphs (YAML)
    brainstorm_feature.yaml
    plan_feature.yaml
    code_feature.yaml
    _common.schema.yaml             # JSON Schema for workflow validation
  /packs/                           # Reusable, versioned context packs
    /style/STYLE.md
    /arch/ARCH.md
    /glossary/Domain.md
    /adr/README.md                  # ADR usage guide (lightweight)
  /templates/                       # Markdown/JSON templates agents fill in
    RFC.md
    ONE-PAGER.md
    OPTIONS.md
    TestPlan.md
    MIGRATION.md
    CHANGELOG_ENTRY.md
    ticket.json
  /gates/                           # Quality gates (scripts)
    lint.sh
    format.sh
    tests.sh
    diffsize.sh
    adr_required.sh
  /tools/                           # Thin wrappers around common ops
    repo_map.sh
    repo_search.sh
    repo_edit.sh                    # Optional: guards write-scope
    http_request.sh
    diagram_mermaid.sh
  /presets/                         # Opinionated bundles (roles+tools+gates)
    minimal.yaml
    strict.yaml
  /examples/                        # Small runnable demos with fixture repos
    feature-rate-limits/
    feature-webhooks/
  /scripts/                         # DX utilities for maintainers
    check.yaml                      # Lints and validates YAML
    render-templates.sh             # Fill templates with sample vars (smoke test)
    release.sh                      # Tag + package as tarball for consumption
  /docs/
    WORKFLOW.md
    CONTRIBUTING.md
    STYLE.md                        # Optional house style for this repo
    ARCH.md                         # How this repo is structured

/.github/
  workflows/
    validate.yml                    # CI: validate agents/workflows/templates on PR
    release.yml                     # CI: publish release artifacts (tarballs)

README.md                           # Quickstart, consumption modes, versioning
CHANGELOG.md                        # Human-readable changes for consumers
LICENSE
```

> **Why nest under `/opencode/`?**
> Keeps everything namespaced so you can vendor this repo into a project (submodule/subtree) without path collisions.

---

## Quickstart (for *this* repo)

1. **Clone**

   ```bash
   git clone https://github.com/your-org/opencode-agents.git
   cd opencode-agents
   ```
2. **Validate** (ensure specs are sound)

   ```bash
   ./opencode/scripts/check.yaml
   ```
3. **Try a dry run** against the embedded examples

   ```bash
   # assumes opencode CLI installed and available as `opencode`
   opencode run ./opencode/workflows/brainstorm_feature.yaml \
     --var feature="Tenant Webhooks" \
     --context ./opencode/examples/feature-webhooks
   ```

---

## Consumption modes (use in *any* project)

### Option A — Git **submodule** (recommended for strict version pinning)

```bash
cd your-project
git submodule add https://github.com/your-org/opencode-agents.git vendor/opencode-agents
```

* Configure OpenCode to look for workflows in `vendor/opencode-agents/opencode/` or copy a preset into your project’s `opencode.project.yaml`.
* Update via `git submodule update --remote --merge`.

### Option B — Git **subtree** (simple, no submodule UX)

```bash
git subtree add --prefix vendor/opencode-agents \
  https://github.com/your-org/opencode-agents.git main --squash
```

* Pull updates with `git subtree pull` using the same args.

### Option C — **Release tarball** (immutable, vendorable)

* This repo publishes `opencode-agents-vX.Y.Z.tar.gz` with `/opencode` contents.
* Unpack into `vendor/opencode-agents/` and commit.

### Option D — **Org template repo**

* Create projects from this template, then maintain per-project forks if you need divergent defaults.

> **Tip:** keep **all** project-specific overrides in the *project repo* (e.g., `your-project/opencode.local.yaml`) so this shared repo stays generic.

---

## Wiring in a project (minimal)

In *your* project repo:

```
/your-project/
  opencode.project.yaml            # Points to vendored agents/workflows
  vendor/opencode-agents/          # submodule/subtree/tarball unpack
  docs/STYLE.md                    # optional project-specific overrides
  docs/ARCH.md
```

**`opencode.project.yaml` (project-side):**

```yaml
version: 1
include_paths:
  - vendor/opencode-agents/opencode
  - opencode.local                 # optional project overrides live here
runtime:
  env:
    MAX_DIFF_LINES: 400
    DEFAULT_PRESET: strict
  tools:
    repo.search: vendor/opencode-agents/opencode/tools/repo_search.sh
    repo.edit:   vendor/opencode-agents/opencode/tools/repo_edit.sh
    run.tests:   ./scripts/test.sh
    run.lint:    ./scripts/lint.sh
    run.format:  ./scripts/format.sh
```

> The **project** supplies implementation of `run.tests`, `run.lint`, etc. The **shared repo** supplies agent/workflow definitions and default gates.

---

## Example workflow (drop-in)

**`/opencode/workflows/code_feature.yaml`**

```yaml
name: code_feature
version: 1
inputs:
  - docs/RFCs/{{feature}}/RFC.md
  - docs/RFCs/{{feature}}/TestPlan.md
  - tickets/{{feature}}.json
agents:
  - use: Implementer
  - use: Reviewer
  - use: DocWriter
tools:
  - repo.search
  - repo.edit
  - run.tests
  - run.lint
  - run.format
  - run.build
  - git.branch
  - git.commit
  - git.pr
outputs:
  - pr:url
  - docs/CHANGELOG.md
  - reports/coverage.json
preset: ${DEFAULT_PRESET}
#gates are composable: presets/minimal.yaml or presets/strict.yaml
```

**`/opencode/presets/strict.yaml`**

```yaml
name: strict
version: 1
gates:
  - run.lint: pass
  - run.format: pass
  - run.tests: pass
  - diff.size:
      max_lines: ${MAX_DIFF_LINES}
  - adr_required:
      when_touching: ["api/*", "schemas/*"]
```

**`/opencode/agents/Implementer.yaml`** (spec excerpt)

```yaml
name: Implementer
mission: Write minimal code to satisfy prewritten tests with small, reviewable diffs.
scope_of_work:
  - Create a topic branch per ticket
  - Write failing tests, then code to green
  - Keep diff ≤ ${MAX_DIFF_LINES} lines per commit
out_of_scope:
  - Editing CI config or secrets
io_contract:
  inputs: [tickets/{{feature}}.json, docs/RFCs/{{feature}}/TestPlan.md]
  outputs: [commits, updated tests, green build]
quality_bars:
  - run.tests == pass
  - run.lint == pass
  - No new deps without ticket note
playbook:
  - Step 1: read TestPlan → write failing test
  - Step 2: minimal implementation
  - Step 3: run.lint, run.format, run.tests
  - Step 4: commit with conventional message
  - Step 5: repeat per acceptance criterion
tools: [repo.search, repo.edit, run.tests, run.lint, run.format, git.branch, git.commit]
guardrails:
  - Don’t touch /infra/secrets or .github/*
  - Respect coding conventions in packs/style/STYLE.md
stop_conditions:
  - All quality_bars met and diffs pushed
```

---

## Validation & CI

**Local validation**

```bash
./opencode/scripts/check.yaml        # validates YAML against schemas
./opencode/scripts/render-templates.sh --dry-run
```

**GitHub Actions** (`.github/workflows/validate.yml`)

```yaml
name: Validate OpenCode assets
on: [pull_request]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Validate YAML schemas
        run: ./opencode/scripts/check.yaml
      - name: Smoke test templates
        run: ./opencode/scripts/render-templates.sh --dry-run
```

**Release automation**

* Tag `vX.Y.Z` → CI builds `opencode-agents-vX.Y.Z.tar.gz` with the `/opencode` folder.
* Attach changelog section automatically using `CHANGELOG.md`.

---

## Versioning & compatibility

* **Semantic versioning** for this repo: bump **major** if you change schemas; **minor** for new agents/workflows; **patch** for fixes.
* Keep a **compat table** in `README.md` if OpenCode releases introduce breaking changes:

```
| OpenCode | This Repo |
|----------|-----------|
| 1.0.29   | ≥ 0.4.0   |
```

---

## Project overrides (keep shared repo generic)

In a consuming project, create `opencode.local/` for overrides without forking the shared repo:

```
/your-project/opencode.local/
  /agents/Implementer.yaml          # override specific fields (merged by key)
  /presets/strict.yaml              # adjust gates per project
  /packs/style/STYLE.md             # project style layered atop shared
```

> Use a simple **merge strategy**: local overrides take precedence. Keep a tiny `MERGE_RULES.md` to document behavior.

---

## DX niceties (recommended)

* **Makefile/justfile** in the project to wrap opencode commands:

  ```make
  brainstorm:
    opencode run vendor/opencode-agents/opencode/workflows/brainstorm_feature.yaml \
      --var feature="$(FEATURE)" --context .
  plan:
    opencode run vendor/opencode-agents/opencode/workflows/plan_feature.yaml \
      --var feature="$(FEATURE)" --context .
  code:
    opencode run vendor/opencode-agents/opencode/workflows/code_feature.yaml \
      --var feature="$(FEATURE)" --context .
  ```
* **Pre-commit hooks** to check YAML and templates when editing this repo.
* **Telemetry**: optional `reports/` with `tokens_used.csv`, `tests_added.csv` if your agent runtime emits them.

---

## Teaching note (how to keep this scalable)

1. Keep agent scopes small and explicit.
2. Promote stable prompts into `/presets/` and `/packs/`.
3. Add **gates** liberally; they catch more than clever prompts.
4. Treat the repo like a product: changelog, releases, compatibility table.
5. Make *project overrides* cheap—so teams don’t fork your shared source.

---

## Next steps

* Replace `your-org` and publish the repo as a GitHub **template**.
* Wire a sample consumer project (submodule or subtree) and verify: brainstorm → plan → code.
* Add one custom gate (e.g., `security_scan.sh`) to `/opencode/gates/` and surface it in `presets/strict.yaml`.
* Schedule a weekly 15‑minute retro to turn friction into one repo improvement.
