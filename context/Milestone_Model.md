# Milestone Model Definition (Epic-as-Milestone)

This repository uses **GitHub Milestones** to represent **Epics**.

A Milestone is the strategic container for a set of related issues that together
deliver a measurable outcome.

Milestones are the source of truth for:
- Objective
- Acceptance criteria
- Success metrics
- Scope / out-of-scope
- Decomposition plan
- Optional proof of concept (POC)
- Risks and dependencies

All of the above must be written in the **Milestone Description** field.

---

# What Is a Milestone (Epic)?

A Milestone (Epic):
- Represents a strategic initiative
- Contains multiple implementation issues
- May span multiple sprints
- Has measurable acceptance criteria
- May include cross-functional work (UI + NGINX + Docker + Ansible)

Milestones do NOT:
- Receive weights
- Get sprint assignments
- Act as implementation tickets

---

# Milestone Description Template (Required Structure)

When creating a Milestone, the Description field MUST include:

## Objective
- What strategic goal does this milestone accomplish?

## Acceptance Criteria
- What must be true for the milestone to be considered complete?

## Success Metrics
- How will success be measured (security, performance, reliability, UX, etc.)?

## In Scope
- What work is included?

## Out of Scope
- What work is explicitly excluded?

## Decomposition Plan
- High-level breakdown of expected child issues/workstreams.

## Proof of Concept (Optional)
- If a POC is needed, define scope and validation criteria.

## Risks & Dependencies
- Known risks, external dependencies, or sequencing constraints.

---

# Milestone → Issue Relationship Rules

Each implementation issue should:
- Belong to **at most one** Milestone.
- Align with the Milestone Objective.
- Contribute directly to Milestone Acceptance Criteria.

Rules:
- If an issue does not clearly align with the milestone, it must be removed and
  placed back in backlog (no milestone) or moved to a different milestone.
- Cross-cutting issues are allowed, but must still align with milestone outcomes.

---

# Issue Requirements When Assigned to a Milestone

Any issue assigned to a Milestone must have:
- 1 × `type:` label
- ≥1 × `area:` label
- Project fields populated before Sprint-Ready:
  - Priority
  - Risk
  - Weight
  - Status (per WORKFLOW.md)
  - Sprint (when planned)

Issues should include clear acceptance criteria so milestone completion is
verifiable.

---

# Decomposition Rules

If a milestone contains work that is:
- Too broad (multiple independent initiatives), OR
- Likely to exceed a reasonable number of issues (target 6–20), OR
- Contains many large items (multiple Weight 8–13 issues), OR
- Has ambiguous deliverables

Then:
- Refine scope in the Milestone Description, and/or
- Split into multiple milestones.

Additionally:
- Any issue estimated above Weight 13 must be decomposed before it can become
  Sprint-Ready (use label `needs-decomposition`).

---

# Milestone Completion Criteria

A Milestone may be closed ONLY if:
- All issues assigned to the milestone are closed, AND
- The Milestone Acceptance Criteria (in Description) are satisfied, AND
- The Milestone Success Metrics have been met or explicitly assessed.

Closing a milestone is a governance action that signals the epic outcome is
delivered (not just “tickets closed”).

---

# AI Behavioral Contract (Milestones)

When processing milestone-related work, the AI must:

1. Use the Milestone Description as the source of truth for:
   - Objective, acceptance criteria, success metrics, scope, risks.
2. Validate that each issue assigned to the milestone aligns with the milestone.
3. Recommend decomposition of issues or scope when items are oversized.
4. Flag scope creep when new issues do not map to milestone outcomes.
5. Prevent use of milestones as implementation tickets (no weights/sprints on milestones).

---

# Example Milestone Description (Abbreviated)

Objective:
- Improve production hardening and security posture for the site.

Acceptance Criteria:
- TLS configuration hardened and validated.
- Required security headers enabled.
- No critical container vulnerabilities remain.

Success Metrics:
- Security scan reports 0 critical findings.
- TLS evaluation improves relative score/baseline.
- Site performance does not regress.

In Scope:
- NGINX headers + TLS tuning, container scanning, deploy validation.

Out of Scope:
- Major site redesign, adding a backend.

Decomposition Plan:
- Security headers issue
- TLS hardening issue
- Container scanning issue
- Verification + rollout checklist issue

POC (Optional):
- Trial security header set in staging before production rollout.

Risks & Dependencies:
- TLS changes can cause client compatibility issues; validate with rollback plan.
