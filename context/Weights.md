# Weighting System (Fibonacci)

This repo uses **Fibonacci weights** to estimate effort and uncertainty.
Weights are used for sprint planning and capacity simulation.

Allowed weights:
**1, 2, 3, 5, 8, 13**

Rules:
- Each issue must have exactly ONE weight value recorded (preferably in a GitHub Project numeric field named `Weight`).
- If uncertain, pick the next higher Fibonacci value.
- If an item is larger than 13, it must be decomposed into smaller issues.

---

# What the Weights Mean

## Weight 1 — Trivial / Very Low Risk
Work that is straightforward, well-understood, and local.

Typical examples:
- Fix typo in HTML/CSS/docs
- Small CSS tweak
- Update a single config value with known outcome

Signals:
- No new tests required (or trivial)
- No deployment risk
- No cross-file refactor

---

## Weight 2 — Small / Low Risk
Small change with a couple moving parts.

Typical examples:
- Add a new section to the site with existing styling patterns
- Add a small nginx header (already used elsewhere)
- Small Dockerfile change (e.g., copy path fix)

Signals:
- Touches 2–3 files
- Minimal verification steps
- Low chance of rollback

---

## Weight 3 — Medium / Clear Scope
Normal-sized work, requires care but still predictable.

Typical examples:
- Add a new page + navigation updates
- Basic nginx routing changes (rewrite rules / location blocks)
- Ansible change that modifies a deployment step (still standard)

Signals:
- Requires a validation checklist
- Might need test/update to automation
- Some risk of breaking deploy if done incorrectly

---

## Weight 5 — Larger / Multiple Components
Cross-file or cross-area change; may require coordination.

Typical examples:
- Add caching strategy + verify behavior
- Refactor Docker build to multi-stage
- Add Ansible role refactor affecting multiple tasks
- Introduce a CI step (linting, build validation)

Signals:
- Multiple areas touched (e.g., `area: nginx` + `area: docker`)
- Requires more thorough rollout validation
- Moderate uncertainty / might need iteration

---

## Weight 8 — Significant / High Uncertainty or High Risk
Complex change or work with meaningful production impact.

Typical examples:
- TLS hardening changes + header policy overhaul
- Zero-downtime deploy approach with rollback plan
- Major nginx config restructure
- Large automation rewrite with new assumptions

Signals:
- Requires rollout plan + rollback strategy
- Likely to require review from Tech Lead and/or Security
- Unknowns that will be resolved during implementation

---

## Weight 13 — Very Large / Should Usually Be Split
This is close to “too big” and should be decomposed unless there is a strong reason not to.

Typical examples:
- Replatforming deployment process end-to-end
- Major architecture change across nginx + docker + ansible simultaneously
- Full observability stack addition (metrics + logs + alerts)

Rules:
- Must include a decomposition plan and/or be part of an epic.
- Prefer splitting into multiple issues ≤ 8.

---

# Weight Selection Checklist (Use This Order)

1. **How many areas?**
   - 1 area → likely ≤ 3
   - 2 areas → likely 5
   - 3+ areas → likely 8–13 or decomposed

2. **Risk level?**
   - `risk: low` → typically 1–3
   - `risk: medium` → typically 3–5
   - `risk: high` → typically 5–13 (plus review)

3. **Unknowns?**
   - If approach is unclear → increase weight by one Fibonacci step.

4. **Can it be validated quickly?**
   - Yes → keep lower
   - No / requires staged rollout → increase

---

# Decomposition Rule

If a ticket:
- exceeds weight 13, OR
- cannot be completed in one sprint with confidence,

then it must be split into smaller issues with clear deliverables.

Use label:
- `needs-decomposition`

---

# Examples

## Example A (Static site tweak)
- type: chore
- area: ui
- risk: low
- priority: p3
→ Weight: 1

## Example B (NGINX header update + verify)
- type: chore
- area: nginx
- risk: medium
- priority: p2
→ Weight: 3

## Example C (Docker multi-stage build refactor)
- type: refactor
- area: docker
- risk: medium
- priority: p2
→ Weight: 5

## Example D (TLS + security headers policy overhaul)
- type: bug
- area: nginx
- area: security
- risk: high
- priority: p1
→ Weight: 8
