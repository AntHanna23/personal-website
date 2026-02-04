# Task: Update All Outdated Versions and Dependencies

**Priority:** High  
**Type:** Technical Debt / Maintenance  
**Estimated Effort:** Medium (4-8 hours)

## Overview
The personal website repository has multiple outdated components that need to be updated to their latest stable versions. This task covers updating the base Docker image, web server, frontend libraries, automation tooling, and CI/CD configurations.

## Background
This website serves as both a personal resume site and a testing ground for side projects. Keeping dependencies up-to-date is critical for:
- Security vulnerabilities patches
- Performance improvements
- Access to new features
- Compatibility with modern browsers and tools
- Easier future maintenance

## Components Requiring Updates

### 1. Docker Base Image
**Current:** `ubuntu:18.04`  
**Issue:** Ubuntu 18.04 reached End of Life (EOL) in May 2023  
**Action Required:**
- Update to `ubuntu:22.04` or `ubuntu:24.04` (latest LTS)
- Test nginx compatibility with new base image
- Update any apt package installations that may have changed

**Files to Update:**
- `Dockerfile` (line 1)

---

### 2. Frontend JavaScript Libraries
**Current Libraries with Outdated Versions:**
- jQuery 1.10.2 (released 2013, current is 3.7.x)
- jQuery Migrate 1.2.1
- Various jQuery plugins (scrollex, scrolly, etc.)

**Issues:**
- Security vulnerabilities in old jQuery versions
- Missing modern browser features
- Performance improvements in newer versions

**Action Required:**
- Update jQuery to latest 3.x version
- Update or remove jQuery Migrate (may not be needed with modern code)
- Update all jQuery plugins to compatible versions
- Test all interactive features on the site
- Update CDN references in HTML files

**Files to Update:**
- `anthonyhanna.com/assets/js/jquery.min.js`
- `anthonyhanna.com/Documentation/Stuff/js/jquery-1.10.2.min.js`
- `anthonyhanna.com/Documentation/Stuff/js/jquery-migrate-1.2.1.min.js`
- All HTML files referencing these libraries

---

### 3. FontAwesome Icons
**Current:** Appears to be using an older version  
**Action Required:**
- Update to latest FontAwesome (currently 6.x)
- Verify all icons still render correctly
- Update CSS references

**Files to Update:**
- `anthonyhanna.com/assets/css/fontawesome-all.min.css`
- `anthonyhanna.com/Documentation/Stuff/css/font-awesome/`

---

### 4. Nginx Web Server
**Current:** System-installed version from Ubuntu 18.04 repositories  
**Action Required:**
- With Ubuntu update, nginx will be updated automatically
- Review nginx.conf for deprecated directives
- Update SSL/TLS protocols (currently includes deprecated TLSv1 and TLSv1.1)
- Test configuration after update

**Files to Update:**
- `nginx.conf` (line 39 - SSL protocols)

**Recommended Change:**
```nginx
# Current: ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
# Updated: ssl_protocols TLSv1.2 TLSv1.3;
```

---

### 5. Ansible Playbooks and Python Dependencies
**Current Issues:**
- Using deprecated `python-pip` package (Python 2)
- Using old `docker-py` module (deprecated in favor of `docker`)
- Older Ansible module syntax

**Action Required:**
- Update to Python 3 and `python3-pip`
- Replace `docker-py` with `docker` Python package
- Update Ansible modules to current syntax
- Test deployment workflow end-to-end

**Files to Update:**
- `ansible-playbooks/deploy-website.yaml` (lines 20, 24)

**Recommended Changes:**
```yaml
# Replace python-pip with python3-pip
- python3-pip

# Replace docker-py with docker
pip: 
  name: docker
  state: present
```

---

### 6. GitLab CI/CD Configuration
**Current Issues:**
- Using potentially outdated Docker commands
- No version pinning for images
- Cleanup stage could be improved

**Action Required:**
- Review and update CI syntax if needed
- Consider adding version checks/reports
- Improve cleanup to only stop test containers (not all containers)
- Consider adding automated security scanning

**Files to Update:**
- `.gitlab-ci.yml`

---

### 7. Modernizr JavaScript Library
**Current:** Unknown version in Documentation section  
**Action Required:**
- Identify current version
- Update to latest (currently 3.x)

**Files to Update:**
- `anthonyhanna.com/Documentation/Stuff/js/modernizr.js`

---

## Testing Requirements

After all updates, the following must be verified:

### Functional Testing
- [ ] Website loads correctly at all routes
- [ ] All navigation links work
- [ ] PDF resume link works
- [ ] Documentation pages render correctly
- [ ] All JavaScript interactions function (scrolling, navigation, etc.)
- [ ] Mobile responsive design still works
- [ ] All icons display correctly

### Infrastructure Testing
- [ ] Docker image builds successfully
- [ ] Docker container starts and serves content
- [ ] Nginx serves all static content correctly
- [ ] GitLab CI/CD pipeline completes successfully
- [ ] Ansible playbooks deploy without errors
- [ ] Container restarts automatically as configured

### Security Testing
- [ ] No vulnerable dependencies (run npm audit or similar)
- [ ] SSL/TLS configuration is secure (no deprecated protocols)
- [ ] Docker image has no critical vulnerabilities
- [ ] HTML/JS has no XSS vulnerabilities

### Browser Compatibility Testing
Test in:
- [ ] Chrome/Edge (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Mobile browsers (iOS Safari, Chrome Mobile)

---

## Implementation Order

Recommended sequence to minimize risk:

1. **Create a backup branch** - Ensure you can rollback if needed
2. **Update Docker base image** - Foundation for everything else
3. **Update nginx configuration** - Remove deprecated SSL protocols
4. **Update frontend libraries** - jQuery, FontAwesome, Modernizr
5. **Update Ansible playbooks** - Python 3 migration
6. **Update CI/CD configuration** - Improved cleanup and checks
7. **Run full test suite** - Verify everything works
8. **Deploy to production** - With monitoring enabled

---

## Rollback Plan

If issues occur after deployment:
1. GitLab CI can redeploy previous working commit
2. Ansible playbook will build and deploy older container
3. Docker images are tagged, can manually switch to previous version
4. Keep old Ubuntu 18.04 base image available for emergency rollback

---

## Additional Considerations

### Nice-to-Have Enhancements (Optional)
- Add package-lock or dependency version tracking
- Implement automated dependency updates (like Dependabot)
- Add automated security scanning to CI/CD
- Consider migrating from jQuery to vanilla JavaScript or modern framework
- Add automated accessibility testing
- Implement automated performance testing

### Documentation Updates Needed
- Update README.md with new version requirements
- Document the update process for future reference
- Update any inline comments referencing old versions

---

## Success Criteria

This task is complete when:
- [ ] All components updated to latest stable versions
- [ ] All tests pass
- [ ] Website functions correctly in production
- [ ] No security vulnerabilities in dependencies
- [ ] Documentation updated
- [ ] Changes committed with clear commit messages

---

## Notes

- **Do not** remove or change any actual content/pages during updates
- **Preserve** all joke pages and side projects
- **Test thoroughly** before deploying to production
- **Monitor** site after deployment for any issues
- Consider doing updates incrementally if full update seems risky

---

**Created:** 2026-02-04  
**Status:** Ready for Implementation
