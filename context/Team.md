# Team Roster (Simulated)

This repository simulates a small product team maintaining and evolving a
containerized personal website deployed via NGINX and Ansible.

Stack:
- Static HTML/CSS
- NGINX
- Docker
- Ansible
- Linux-based hosting

The purpose of this team file is to provide deterministic ownership and
assignment rules for AI-assisted ticket triage and sprint planning.

---

# Team Structure

## Product

### Avery Cole — Product Manager
- Owns: backlog quality, prioritization, sprint goals, roadmap
- Reviews: all `priority: p0` and `risk: high` issues
- Not assigned engineering implementation tasks

---

## Engineering

### Jordan Blake — Technical Lead (Full-Stack / Architecture)
- Seniority: Senior
- Owns: cross-cutting architecture, high-risk changes, production incidents
- Strengths:
  - System design
  - NGINX + container integration
  - Deployment troubleshooting
- Default for:
  - `risk: high`
  - Cross-area issues
  - Production outages

---

### Riley Chen — Frontend Engineer
- Seniority: Mid-level
- Owns:
  - HTML structure
  - CSS styling
  - Accessibility
  - SEO improvements
- Strengths:
  - Layout refactors
  - Responsive design
  - UX polish
- Default labels:
  - `area: ui`
  - `type: feature` (frontend)
  - `type: bug` (frontend rendering)

---

### Sam Patel — Web Server / NGINX Engineer
- Seniority: Senior
- Owns:
  - nginx.conf
  - Reverse proxy config
  - Caching rules
  - Compression + performance tuning
  - Routing
- Strengths:
  - Header configuration
  - TLS tuning
  - Rate limiting
- Default labels:
  - `area: nginx`
  - `area: server`
  - `area: performance`

---

### Morgan Rivera — DevOps / Container Engineer
- Seniority: Senior
- Owns:
  - Dockerfile
  - Docker image optimization
  - Container security
  - Build process
- Strengths:
  - Multi-stage builds
  - Minimal base images
  - CI integration
- Default labels:
  - `area: docker`
  - `area: build`
  - `area: infra`

---

### Casey Morgan — Infrastructure Automation (Ansible)
- Seniority: Mid-level
- Owns:
  - Ansible playbooks
  - Inventory management
  - Deployment automation
  - Idempotency validation
- Strengths:
  - Deployment workflows
  - Server provisioning
  - Configuration drift correction
- Default labels:
  - `area: ansible`
  - `area: deployment`
  - `area: automation`

---

### Taylor Brooks — Security Engineer
- Seniority: Senior
- Owns:
  - TLS configuration
  - Security headers
  - SSH hardening
  - Container scanning
  - Secret handling
- Strengths:
  - Hardening nginx
  - Secure Docker images
  - Dependency audits
- Default labels:
  - `area: security`
  - `risk: high`
  - `priority: p0` (security-related)

---

### Parker Lee — Observability / Reliability
- Seniority: Mid-level
- Owns:
  - Logging
  - NGINX access log analysis
  - Health checks
  - Uptime monitoring
- Strengths:
  - Monitoring setup
  - Alert thresholds
  - Performance metrics
- Default labels:
  - `area: monitoring`
  - `area: reliability`

---

# Ownership Map (Label → Default Assignee)

- `area: ui` → Riley Chen
- `area: nginx` → Sam Patel
- `area: server` → Sam Patel
- `area: performance` → Sam Patel
- `area: docker` → Morgan Rivera
- `area: build` → Morgan Rivera
- `area: infra` → Morgan Rivera
- `area: ansible` → Casey Morgan
- `area: deployment` → Casey Morgan
- `area: automation` → Casey Morgan
- `area: security` → Taylor Brooks
- `area: monitoring` → Parker Lee
- `area: reliability` → Parker Lee

Fallback:
- Multiple `area:*` labels → assign to Jordan Blake (Tech Lead) for triage.
- No `area:*` label → assign to Jordan Blake.

---

# Capacity Model (For Sprint Simulation)

Story point capacity per sprint:

- Jordan Blake: 8 pts (architecture-heavy)
- Riley Chen: 12 pts
- Sam Patel: 10 pts
- Morgan Rivera: 10 pts
- Casey Morgan: 10 pts
- Taylor Brooks: 6 pts (reviews + high-risk only)
- Parker Lee: 8 pts

---

# Assignment Rules (For AI Triage)

1. Identify primary `area:*` label.
2. Assign to default owner.
3. If `risk: high` OR `priority: p0`:
   - Add Jordan Blake as reviewer.
4. If security-related:
   - Add Taylor Brooks as reviewer or co-assignee.
5. If cross-area:
   - Assign to Jordan Blake for decomposition.
6. Respect sprint capacity limits when assigning new sprint work.

