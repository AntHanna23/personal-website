# Label Taxonomy

This taxonomy defines all allowed labels in the repository.
Labels are structured with prefixes for deterministic AI classification.

Format:
<prefix>: <value>

No free-form labels should be created outside this taxonomy.

---

# 1. TYPE (Required)

Defines the nature of the work.

- type: bug
- type: feature
- type: chore
- type: refactor
- type: spike
- type: epic

Rules:
- Exactly ONE `type:` label per issue.
- Epics must use `type: epic`.

---

# 2. AREA (Required for implementation issues)

Defines technical ownership domain.

Frontend:
- area: ui

Web Server:
- area: nginx
- area: server
- area: performance

Containerization:
- area: docker
- area: build
- area: infra

Automation:
- area: ansible
- area: deployment
- area: automation

Security:
- area: security

Reliability:
- area: monitoring
- area: reliability

Rules:
- At least ONE `area:` label required unless `type: epic`.
- Multiple `area:` labels allowed if cross-cutting.
- If more than one `area:` label exists → assign to Tech Lead for triage.

---

# 3. PRIORITY (Required)

Defines urgency and business impact.

- priority: p0  (Production outage / critical security)
- priority: p1  (High impact, urgent)
- priority: p2  (Normal priority)
- priority: p3  (Low priority / enhancement)

Rules:
- Exactly ONE `priority:` label required.
- `priority: p0` requires Tech Lead review.

---

# 4. RISK (Required for implementation work)

Defines technical or operational risk.

- risk: low
- risk: medium
- risk: high

Rules:
- Exactly ONE `risk:` label required.
- `risk: high` requires Tech Lead review.
- Security issues default to `risk: high`.

---

# 5. STATUS (Optional — Prefer Project Field Instead)

If not using Project status fields, these may be used.

- status: triage
- status: ready
- status: in-progress
- status: review
- status: blocked
- status: done

NOTE:
If GitHub Project has a Status field, do NOT use status labels.

---

# 6. SPECIAL WORKFLOW LABELS

Used to trigger AI or governance behaviors.

- needs-decomposition
- approval-required
- security-review
- blocked: external
- blocked: dependency

---

# Label Usage Constraints

Every implementation issue MUST have:

- 1 × `type:`
- ≥1 × `area:`
- 1 × `priority:`
- 1 × `risk:`

Epics MUST have:

- `type: epic`
- `priority:`
- Optional `risk:`

---

# Example Valid Issue Label Set

Example 1 (Frontend bug):
- type: bug
- area: ui
- priority: p2
- risk: low

Example 2 (NGINX security fix):
- type: bug
- area: nginx
- area: security
- priority: p0
- risk: high
- security-review

Example 3 (Docker refactor):
- type: refactor
- area: docker
- priority: p2
- risk: medium
