# Workflow Definition

This file defines the official lifecycle of an issue in this repository.

The workflow exists to simulate an AI-assisted project management pipeline with
clear validation gates and sprint-readiness criteria.

This is a governance contract. Issues may not advance unless all required
conditions are satisfied.

---

# Lifecycle States

The canonical lifecycle is:

1. Intake
2. Triage
3. Enrichment
4. Validation
5. Approval (if required)
6. Sprint-Ready
7. In Progress
8. Review
9. Done

Project Status field should reflect these states.

---

# 1. Intake

Trigger:
- Engineer reports bug
- Feature request created
- Improvement proposed

Minimum Required:
- Clear title
- Basic description

At this stage:
- Labels may be incomplete
- No weight required
- No assignee required

Next step → Triage

---

# 2. Triage

Objective:
Classify and assign ownership domain.

Required by end of Triage:
- 1 × `type:` label
- ≥1 × `area:` label
- 1 × `priority:` label
- 1 × `risk:` label

Rules:
- If multiple `area:` labels → assign to Tech Lead for decomposition review
- If security-related → add `security-review`
- If unclear scope → add `needs-decomposition`

Next step → Enrichment

---

# 3. Enrichment

Objective:
Ensure issue has enough information to be actionable.

Required:
- Clear problem statement
- Acceptance criteria
- Defined technical scope
- Suggested weight (Fibonacci)

If missing information:
- Return to Triage
- Add comment requesting clarification

Next step → Validation

---

# 4. Validation

Objective:
Verify metadata and sizing are correct.

Must confirm:
- Labels conform to LABEL_TAXONOMY.md
- Weight aligns with WEIGHTING_SYSTEM.md
- Assignee matches TEAM.md ownership map
- Issue is not oversized (>13 or unclear scope)

If issue:
- Is oversized → add `needs-decomposition`
- Is high risk → require Tech Lead review
- Is priority p0 → require Tech Lead review
- Is security-related → require Security review

If valid → move to Approval (if required) or Sprint-Ready

---

# 5. Approval (Conditional Stage)

Approval required if:
- `risk: high`
- `priority: p0`
- `approval-required` label present

Approval authority:
- Tech Lead (Jordan Blake)
- Security (Taylor Brooks) for security issues
- PM (Avery Cole) for scope change or roadmap impact

If rejected:
- Return to Enrichment with feedback

If approved:
- Remove `approval-required`
- Proceed to Sprint-Ready

---

# 6. Sprint-Ready

An issue is Sprint-Ready ONLY if:

- All required labels exist:
  - `type:`
  - `area:`
  - `priority:`
  - `risk:`
- Weight assigned (1–13 Fibonacci)
- Primary assignee assigned
- Acceptance criteria defined
- No `needs-decomposition`
- No outstanding approval requirement

Sprint-Ready issues may be added to a Sprint (Project Iteration field).

---

# 7. In Progress

Entry criteria:
- Assigned to active sprint
- Assignee confirmed capacity

Rules:
- Scope changes require PM acknowledgment
- Major risk discovery may move issue back to Validation

---

# 8. Review

Entry criteria:
- Implementation complete
- Validation checklist executed

If applicable:
- PR created
- Reviewers assigned (via GitHub PR reviewer system)

If changes requested:
- Return to In Progress

If approved:
- Move to Done

---

# 9. Done

Definition:
- Code merged (if applicable)
- Deployment successful
- Acceptance criteria verified
- No open blockers

Close issue.

---

# Decomposition Rules

If an issue:
- Exceeds Weight 13
- Touches 3+ technical areas
- Cannot be completed in one sprint
- Has unclear deliverables

Then:
- Add `needs-decomposition`
- Assign to Tech Lead
- Split into smaller child issues
- Link to parent Epic

---

# Escalation Matrix

| Condition | Required Action |
|-----------|-----------------|
| risk: high | Tech Lead review |
| priority: p0 | Immediate triage + Tech Lead |
| security issue | Security review required |
| Cross-area conflict | Tech Lead decision |
| Oversized | Decompose before sprint |

---

# Capacity Rule

Before adding to sprint:
- Verify assignee has capacity (see TEAM.md).
- Do not exceed sprint weight limits.

If capacity exceeded:
- Move issue to next sprint.

---

# AI Behavioral Contract

When triaging issues, the AI must:

1. Classify using LABEL_TAXONOMY.md
2. Assign weight using WEIGHTING_SYSTEM.md
3. Assign owner using TEAM.md
4. Validate completeness using this workflow
5. Only mark Sprint-Ready if all criteria satisfied

The AI may not bypass governance stages.

