# SaaS profile

**Goal:** add organization-level audit export without violating tenant isolation. **Authority:** product owner accepts scope; security owner approves data exposure; release owner approves production rollout. **Roles:** Architect, Developer, Tester, Security Reviewer, Memory Manager.

Success requires authorization tests, cross-tenant negative tests, schema compatibility, performance threshold, operator runbook, rollback, and staged monitoring. The loop cannot pass review while a critical security finding is open. Decisions record retention format and backward compatibility; memory records verified platform constraints.

Anti-pattern: treating a green happy-path test as validation of tenant safety.
