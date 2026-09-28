# Cairn Architecture Principles

> **Template Origin**: Official | **ArcKit Version**: 6.16.4 | **Command**: `/arckit:principles`

## Document Control

| Field | Value |
|-------|-------|
| **Document ID** | ARC-000-PRIN-v1.0 |
| **Document Type** | Architecture Principles |
| **Project** | Cairn — Global Architecture (Project 000) |
| **Classification** | OFFICIAL |
| **Status** | DRAFT |
| **Version** | 1.0 |
| **Created Date** | 2026-09-28 |
| **Last Modified** | 2026-09-28 |
| **Review Cycle** | Quarterly |
| **Next Review Date** | 2026-12-28 |
| **Owner** | Chris McKelt (Architecture Owner) |
| **Reviewed By** | [PENDING] |
| **Approved By** | [PENDING] |
| **Distribution** | Cairn architecture, engineering, product, clinical safety, privacy and pack authoring teams |

## Revision History

| Version | Date | Author | Changes | Approved By | Approval Date |
|---------|------|--------|---------|-------------|---------------|
| 1.0 | 2026-09-28 | ArcKit AI | Initial creation from `/arckit:principles` command | PENDING | PENDING |

---

## Executive Summary

This document sets the principles that govern every architecture and technology decision on the Cairn platform. Cairn guides a **participant** through a conversational **journey**, gathers **evidence** (what they say, what they capture, and what invited **contributors** add), and produces **briefs** that the participant approves before any **reviewer** or **organisation** sees them. The platform must serve several domains (for example clinical and professional competency) without the domains leaking into each other, and some of those domains are regulated.

Principles 1–12 are the **foundational principles** supplied by the Cairn architecture owner. They define what makes Cairn distinctive and are reproduced here with rationale, implications and validation gates added. Principles 13–23 are **supporting principles**. They apply standard architecture practice (data governance, security, observability, resilience, delivery) in a way that is consistent with, and subordinate to, the foundational set.

**Scope**: The Cairn core, every domain pack, every deployment (shared and regulated), and every supplier or third-party component in the participant's data path.
**Authority**: Cairn Architecture Review Board.
**Compliance**: Mandatory. Principles marked **NON-NEGOTIABLE** cannot be waived; all others need an approved, time-bound exception (Section VII).

**Philosophy**: The principles describe the *qualities and boundaries* the architecture must have, not the products that implement them. Two principles deliberately name concrete things because the architecture owner has made them boundary decisions rather than technology preferences: Principle 10 names the portability boundary and the class of managed agent services excluded from the core, and Principle 11 names the default residency region. Each is recorded as a principle-level constraint and should be backed by an Architecture Decision Record (ADR).

### Key Terms

| Term | Meaning in these principles |
|------|-----------------------------|
| Core | Domain-free platform code: journey engine, rules runtime, evidence store, consent, safety floor, model gateway, versioning |
| Pack | A versioned bundle holding everything domain-specific (see Principle 1 for its contents) |
| Regulated pack | A pack whose domain carries regulatory obligations (for example software as a medical device) |
| Participant | The person whose journey it is and who owns its content |
| Contributor | A person invited by the participant to add input to the journey |
| Reviewer | A person the participant approves to receive a brief |
| Organisation | A tenant body that sponsors journeys and may see only cohort aggregates |
| Evidence item | An utterance span, a capture (media or document) or a contribution, with provenance |
| Ask | A prompt or request made of the participant or a contributor |
| Brief | The participant-approved output shown to a reviewer |
| Burden budget | The cap on asks within a period, enforced by the core |
| Safety floor | The core's fixed, approved handling of self-harm and immediate danger |
| Model gateway | The single task-level service through which every model call is made |
| SOUP | Software of Unknown Provenance: third-party software not developed under the pack's own regulated lifecycle |

---

## I. Foundational Principles

### 1. The Core Is Domain-Free

**Category**: Application

**Principle Statement**:
Core code MUST NOT contain clinical, competency or any other domain vocabulary. Everything domain-specific MUST live in a pack: schema, coverage framework, rules, asks, safety content (above the floor), wording, capture protocols, brief template, tone signal policy, consent purposes, interoperability mapping, prompts and evaluation suite.

**Rationale**:
New domains must not need core releases, and regulated packs must not inherit changes made for other domains. A domain-free core is what makes both possible.

**Implications**:

- The core exposes generic concepts only (journey, ask, evidence item, rule, brief, consent purpose); packs give them meaning.
- The pack contract is a published, versioned interface. Adding a domain means authoring a pack, not changing the core.
- Core tests use synthetic, domain-neutral fixture packs.
- The safety floor (Principle 7) is the only content the core owns, and it is expressed in domain-neutral terms.
- If a pack needs a capability the core lacks, the capability is added to the core generically, never as a domain special case.

**Validation Gates**:

- [ ] CI checks core source against a domain-vocabulary deny-list and fails on a hit
- [ ] No core code path branches on a pack identifier or domain name
- [ ] A new pack can be installed and run end to end with no core code change
- [ ] Pack contract schema is versioned and published

**Example Scenarios**:

- ✅ Good: A competency pack needs a new question type, so the core gains a generic "structured choice" ask type that any pack can use.
- ❌ Bad: The core adds a `medication_list` field because the first clinical pack needs one.

**Common Violations**:

- Domain terms in core enums, table names, log messages or error text
- "Temporary" pack-specific feature flags in the core
- Core prompts that assume a domain

---

### 2. LLMs Converse; Deterministic Rules Decide (NON-NEGOTIABLE)

**Category**: Application

**Principle Statement**:
Language models MAY phrase replies, extract structured evidence from confirmed text, and shorten quotes. They MUST NOT decide what is detected, what is asked next, what is safe, or what appears in a brief. Those decisions MUST be made by deterministic, versioned rules.

**Rationale**:
Decisions must be explainable, reproducible and stable when the underlying model changes.

**Implications**:

- Detection, next-ask selection, safety decisions and brief composition run in a deterministic rules runtime. Given the same inputs and versions, it gives the same output.
- Model output is treated as a *proposal*. Extracted evidence becomes usable only after it is validated against the confirmed source text and schema.
- A shortened quote MUST remain a faithful subsequence of its source span (with visible elision), checked deterministically.
- Swapping the model bound to a task must not change any decision. It may change only phrasing, which is re-evaluated by the pack's evaluation suite.
- Every decision is replayable from the stored inputs and versions (Principle 12).

**Validation Gates**:

- [ ] Every decision point in the journey is mapped to a named rule, not a model call
- [ ] Decision replay test: re-running a journey with the same versions gives identical decisions
- [ ] Model outputs pass deterministic validation before they enter the evidence store
- [ ] Quote-shortening output is checked as a faithful subsequence of its source

**Example Scenarios**:

- ✅ Good: A model extracts a candidate date from a confirmed utterance. A rule checks that the span contains the date and records it as evidence.
- ❌ Bad: A prompt asks the model "what should we ask next?" and the journey follows its answer.

**Common Violations**:

- Using model confidence scores as detection thresholds
- Letting a model "summarise" evidence into a brief
- Agent-style tool loops in which the model chooses the next action

---

### 3. Every Claim Cites Evidence (NON-NEGOTIABLE)

**Category**: Application / Data

**Principle Statement**:
Every statement shown to a reviewer or participant MUST trace to one or more evidence items (an utterance span, a capture or a contribution) with provenance. Uncited text and model-synthesised interpretations MUST be blocked before display.

**Rationale**:
Reviewers and participants must be able to see where every statement came from. Citation is also the mechanism that keeps model output honest (Principle 2).

**Implications**:

- A brief is assembled from cited fragments, never from free text.
- Provenance records who or what produced the item, when, from which source, and under which versions (Principle 12).
- The rendering layer refuses to display any statement without a resolvable citation. Refusal is fail-closed.
- Fixed template wording from the pack (headings, labels) is not a claim, but it must not assert facts about the participant.

**Validation Gates**:

- [ ] Brief and display schemas make a citation mandatory for each statement
- [ ] Automated check blocks rendering of uncited statements
- [ ] Every citation resolves to a stored evidence item with provenance
- [ ] Evaluation suite includes adversarial cases that try to introduce uncited content

**Example Scenarios**:

- ✅ Good: The brief shows "Reports sleeping around four hours a night" linked to the exact utterance span.
- ❌ Bad: The brief says "Participant appears to be struggling with sleep", an interpretation with no span behind it.

**Common Violations**:

- Template text that embeds participant-specific assertions
- Citations that point at a whole conversation rather than a span
- "Explanatory" model text added around cited evidence

---

### 4. The Participant Owns the Journey (NON-NEGOTIABLE)

**Category**: Business / Data

**Principle Statement**:
Nothing MUST reach any audience without the participant's approval. Contributors MUST see only their own input. Organisations MUST see only aggregates above a minimum cohort size, and never individual content.

**Rationale**:
Participants share sensitive material only if they trust that it goes nowhere without their say. Trust is the product.

**Implications**:

- Access control is purpose-bound and consent-bound, and is evaluated on every read, not just at login.
- Approval is explicit, specific to the item and the audience, recorded as evidence, and revocable for future access.
- Contributor views are scoped to their own contributions; they never see the participant's other content or other contributors' input.
- Organisation reporting runs only on aggregates. The core sets a minimum cohort size; packs may raise it but not lower it. Small cells are suppressed, not rounded.
- Operators and support staff have no routine access to individual content; break-glass access is logged and reviewed.

**Validation Gates**:

- [ ] Every outbound path (brief, export, interoperability, notification) checks recorded participant approval
- [ ] Contributor access tests prove isolation from other content
- [ ] Aggregate queries enforce the minimum cohort size and small-cell suppression
- [ ] Revocation is honoured for all future access
- [ ] Break-glass access is logged, alerted and reviewed

**Example Scenarios**:

- ✅ Good: A participant approves two of five sections for their reviewer; the reviewer sees exactly those two.
- ❌ Bad: An organisation dashboard lets a manager drill from a cohort chart into one participant's answers.

**Common Violations**:

- Notifications that leak content in their preview text
- Analytics events that carry free text
- Cohort filters that can be narrowed until the group is re-identifiable

---

### 5. Describe, Never Evaluate

**Category**: Business

**Principle Statement**:
The platform MUST NOT produce diagnoses, ratings, rankings, severity scores or predictions about people. Measured change from baseline MUST stay internal unless a pack's regulatory profile explicitly allows it to be shown.

**Rationale**:
Cairn gathers and organises evidence. Judgement belongs to qualified people, and evaluative output would change the platform's regulatory and ethical standing.

**Implications**:

- Brief templates present evidence descriptively. Coverage shows what has been discussed, not how well.
- Internal measures (such as change from baseline) may drive deterministic rules, but they are not shown to anyone unless the pack's regulatory profile allows it.
- A pack's regulatory profile is a versioned, reviewed declaration. Changing it is a controlled change (Principle 9).
- Tone signals are governed by the pack's tone signal policy and are never presented as assessments of the person.

**Validation Gates**:

- [ ] Brief templates and UI copy reviewed for evaluative language
- [ ] No output schema contains score, rank, grade or risk-level fields about a person unless the regulatory profile permits them
- [ ] Display of baseline change is gated on the pack's regulatory profile
- [ ] Evaluation suite checks model phrasing for evaluative drift

**Example Scenarios**:

- ✅ Good: "Mentioned breathlessness in three of the last four check-ins" with citations.
- ❌ Bad: "Breathlessness: moderate (score 6/10), likely worsening".

**Common Violations**:

- Colour-coded red/amber/green status on participants
- Leaderboards or percentile comparisons across a cohort
- Model phrasing such as "this suggests..."

---

### 6. Respect the Participant's Energy

**Category**: Business

**Principle Statement**:
A burden budget MUST cap the asks made of a participant. The platform MUST NOT use streaks, badges, guilt prompts or other engagement mechanics.

**Rationale**:
Participants may be unwell, stretched or under pressure. The platform exists to reduce their effort, not to capture their attention.

**Implications**:

- The core enforces the burden budget; the pack sets its values within core limits, and the participant can lower them.
- The rules runtime prioritises asks within the budget. Asks that do not fit are deferred or dropped, never forced through.
- Reminders are neutral, rare and easy to turn off. There are no loss-framing messages.
- Journeys can be paused and resumed without penalty.

**Validation Gates**:

- [ ] Burden budget is enforced in the core and cannot be bypassed by a pack
- [ ] UI and copy reviewed for engagement mechanics and guilt framing
- [ ] Reminder frequency is capped and participant-configurable
- [ ] Journey pause/resume tested with no loss of state

**Example Scenarios**:

- ✅ Good: The budget is reached, so a lower-priority ask is deferred to next week.
- ❌ Bad: "You've broken your 7-day streak! Don't lose your progress."

**Common Violations**:

- Pack-specific asks that bypass the budget
- Growth-driven notification campaigns
- Progress bars designed to create completion pressure

---

### 7. Safety Has a Floor (NON-NEGOTIABLE)

**Category**: Business / Application

**Principle Statement**:
The core MUST always handle self-harm and immediate danger with fixed, approved messages. Packs MAY add red flags but MUST NOT weaken, replace or disable the floor. Safety logic MUST be deterministic. A classifier MAY add alerts but MUST NOT suppress a rule hit.

**Rationale**:
A participant in danger must get the same, approved response every time, whichever pack or model is in use.

**Implications**:

- Floor detection rules and messages are core-owned, versioned, clinically approved and domain-neutral.
- Pack red flags are additive only; the runtime merges them so that a pack rule can never remove a floor rule.
- Safety evaluation runs on every participant input before any model-generated reply is shown.
- A classifier can raise extra alerts; the combined result is the union of rule hits and classifier alerts, never an intersection.
- The floor acts towards the participant. Any disclosure to another party on safety grounds must be either a pack consent purpose the participant agreed to, or a legally required disclosure handled under documented policy (see Open Questions).

**Validation Gates**:

- [ ] Floor rules and messages are version-controlled and have recorded clinical approval
- [ ] Tests prove no pack configuration can disable or override a floor rule
- [ ] Tests prove classifier output cannot suppress a rule hit
- [ ] Safety evaluation runs before reply generation on every input
- [ ] Floor regression suite runs on every core and pack release

**Example Scenarios**:

- ✅ Good: A competency pack with no clinical content still triggers the floor message when a participant discloses intent to self-harm.
- ❌ Bad: A classifier scores a floor rule hit as "low risk", so the rule result is discarded.

**Common Violations**:

- Model-generated wording in safety responses
- Floor messages localised or reworded by packs
- Safety checks running after the reply is streamed

---

### 8. On-Device First

**Category**: Data / Technology

**Principle Statement**:
Media features MUST be computed on the participant's device. Raw audio, video and documents MUST NOT leave the device without explicit consent for that purpose.

**Rationale**:
Raw media is the most sensitive and identifying data Cairn handles. Keeping it on the device minimises exposure, storage liability and residency risk.

**Implications**:

- Capture protocols (in the pack) define which features the device extracts; only features leave by default.
- Consent to upload raw media is a separate, explicit consent purpose, specific and revocable.
- On-device processing components are versioned and stamped on their outputs (Principle 12).
- Devices that cannot compute features locally degrade gracefully (the capture is skipped or deferred); they do not upload raw media silently.

**Validation Gates**:

- [ ] Data flow review shows no raw media leaves the device without a consent check
- [ ] Network traffic tests confirm only features are sent by default
- [ ] Feature extractors are versioned and stamped
- [ ] Fallback behaviour on low-capability devices documented and tested

**Example Scenarios**:

- ✅ Good: A voice capture sends speech features and a confirmed transcript; the audio stays on the device.
- ❌ Bad: Audio is uploaded "temporarily" for server-side processing and deleted afterwards, without consent.

**Common Violations**:

- Crash reports or debug logs that attach media
- Server-side fallback that uploads raw media when the device is slow
- Document uploads treated as implied consent

---

### 9. Regulated Packs Are Isolated

**Category**: Technology

**Principle Statement**:
Regulated packs MUST run on a pinned, validated core release in their own deployment and data plane, and MUST receive core changes only through their own change control. Third-party components in a regulated pack's path MUST be treated as SOUP.

**Rationale**:
Regulated domains need a validated, controlled configuration. Changes made for other domains must not reach them unvalidated.

**Implications**:

- A regulated pack gets its own deployment, data stores, keys and model gateway bindings; nothing is shared at runtime with other packs.
- Core releases are promoted into a regulated deployment only after that pack's verification and validation and change control.
- A SOUP register lists every third-party component in the path (libraries, models, speech engines, managed services), with version, intended use, known anomalies and risk controls.
- The core must be releasable and pinnable as an immutable, identifiable artefact to make this possible.

**Validation Gates**:

- [ ] Each regulated pack has a separate deployment and data plane
- [ ] Deployed core version is pinned and matches the pack's validated release record
- [ ] Core promotion into a regulated deployment requires recorded change-control approval
- [ ] SOUP register is complete and reviewed for each release

**Example Scenarios**:

- ✅ Good: A core security fix ships to shared deployments immediately and to a regulated deployment two weeks later, after that pack's regression and change control.
- ❌ Bad: A regulated pack runs on the shared cluster's rolling core version.

**Common Violations**:

- Shared databases or caches across regulated and non-regulated packs
- "Latest" version tags in regulated deployment manifests
- Model version upgrades at the provider without a SOUP update

---

### 10. Portable Core, Native Adapters

**Category**: Technology

**Principle Statement**:
The container orchestration layer (Kubernetes, as ratified by the architecture owner) MUST be the portability boundary. Core and pack code MUST NOT import cloud-provider SDKs; cloud services MUST sit behind core-defined interfaces with provider-specific adapters. Managed agent services (for example AgentCore, Foundry Agent Service and Vertex Agent Engine) MUST stay out of the core.

**Rationale**:
Tenants and regulated packs may need different clouds. Portability keeps that choice open, and keeping managed agent runtimes out of the core protects deterministic control (Principle 2) and residency (Principle 11).

**Implications**:

- Storage, queues, secrets, key management, identity and model inference are reached through interfaces; adapters are the only code that knows the provider.
- Adapters may use cloud-native services fully. Portability applies to the core, not to the adapter.
- The same core artefact runs on any supported cloud with only adapter and configuration changes.
- Managed agent services may be evaluated for peripheral, non-core tooling only, under an approved exception.

**Validation Gates**:

- [ ] CI dependency check fails if core or pack modules import a cloud SDK
- [ ] Every cloud-dependent capability has an interface and at least one adapter
- [ ] Core deploys to a second supported environment using only adapter and configuration changes (portability test)
- [ ] No managed agent service is referenced from core or pack code

**Example Scenarios**:

- ✅ Good: The evidence store calls a `BlobStore` interface; the tenant's adapter maps it to that cloud's object storage.
- ❌ Bad: A core module calls a cloud SDK directly "because it's only one call".

**Common Violations**:

- Provider-specific identifiers or ARNs in core configuration schemas
- Utility libraries in the core that pull in cloud SDKs indirectly
- Orchestrating journeys through a managed agent runtime

---

### 11. Residency by Policy (NON-NEGOTIABLE)

**Category**: Data / Technology

**Principle Statement**:
All data stores and model inference MUST stay in the tenant's approved regions, **Australia by default**. Residency MUST be enforced by cloud policy and CI, not by convention. Every model call MUST go through the task-level model gateway, bound to a residency-compliant model. Any feature that can route inference outside the approved regions MUST be excluded.

**Rationale**:
Participants and tenants must be able to rely on where their data is stored and processed. Convention fails silently; policy fails loudly.

**Implications**:

- Region restrictions are applied as organisation-level cloud policy and as infrastructure-as-code checks in CI.
- The model gateway is the only path to inference. It binds each task to a specific model version hosted in an approved region and rejects unbound tasks.
- Provider features that may route requests across regions (cross-region inference, global endpoints, or provider-side "optimisation" routing) are disabled and blocked by policy.
- Backups, logs, telemetry, support tooling and disaster recovery sites fall within residency scope too.
- A tenant's approved regions are part of tenant configuration and are validated at deployment.

**Validation Gates**:

- [ ] Cloud policy denies resource creation outside approved regions
- [ ] CI fails infrastructure changes that target non-approved regions
- [ ] Gateway rejects model calls without a residency-compliant binding
- [ ] Egress controls block direct calls to model endpoints that bypass the gateway
- [ ] Backup, log and telemetry destinations verified in-region

**Example Scenarios**:

- ✅ Good: A new model is bound to the "extract" task only after its in-region hosting is confirmed and the pack's evaluation suite passes.
- ❌ Bad: A developer enables a provider's cross-region inference profile to get better throughput.

**Common Violations**:

- Observability or error-tracking services that ship data offshore
- SDK defaults that pick a global endpoint
- Direct model calls from a service that skip the gateway

---

### 12. Version Everything

**Category**: Application / Data

**Principle Statement**:
Core, pack, rule, prompt, model, speech-engine and algorithm versions MUST be stamped on every material output. Running journeys MUST stay pinned to their pack version until explicitly migrated.

**Rationale**:
Reproducibility (Principle 2), provenance (Principle 3) and regulated change control (Principle 9) all depend on knowing exactly what produced an output.

**Implications**:

- Every evidence item, decision, brief and export carries a version manifest.
- Packs, rules and prompts are immutable once released; changes create new versions.
- Journey migration to a new pack version is an explicit, logged operation with a defined migration path. Silent upgrades are prohibited.
- Several pack versions may run at once; the runtime resolves each journey's pinned version.

**Validation Gates**:

- [ ] Output schemas require a complete version manifest
- [ ] Released pack, rule and prompt versions are immutable
- [ ] Journey migration is explicit, logged and tested
- [ ] Runtime supports concurrent pack versions

**Example Scenarios**:

- ✅ Good: A brief produced in March shows exactly which pack, rules, prompt and model produced each fragment.
- ❌ Bad: A prompt is edited in place and all running journeys pick up the change.

**Common Violations**:

- Mutable "latest" references to prompts or models
- Version stamps on briefs but not on underlying evidence
- Hot-fixing rules in production without a new version

---

## II. Data Principles

### 13. Consent-Bound, Minimised Data

**Category**: Data

**Principle Statement**:
Personal data MUST be collected, used and retained only for consent purposes declared in the pack and agreed by the participant, and MUST be classified, minimised and deleted according to a defined retention policy.

**Rationale**:
Principles 4 and 8 depend on knowing why each piece of data exists. Purpose limitation is also a core obligation under Australian privacy law and comparable regimes.

**Implications**:

- Each data element is tagged with its classification and the consent purpose(s) that allow it.
- Processing checks the purpose at use, not only at collection.
- Retention and deletion are automated per purpose; deletion requests propagate to derived data and backups within a defined window.
- Pseudonymised identifiers are used wherever the processing does not need identity.

**Data Classification Tiers**:

1. **Public**: Published material with no restrictions.
2. **Internal**: Operational data with no participant content.
3. **Confidential**: Personal information and tenant commercial data.
4. **Restricted**: Participant content, health information, raw media and safety events.

**Validation Gates**:

- [ ] Every data store has a classification and a purpose mapping
- [ ] Retention policies are automated and tested
- [ ] Deletion propagates to derived data and backups within the defined window
- [ ] A privacy impact assessment exists for each pack handling Restricted data

**Common Violations**:

- Collecting "might be useful later" fields
- Reusing participant content for model training or product analytics without a consent purpose
- Retention defined in documentation but not enforced

---

### 14. Evidence Integrity and Lineage

**Category**: Data

**Principle Statement**:
The evidence store MUST be the single source of truth for everything a brief can say. Evidence items MUST be append-only, tamper-evident and traceable from source to every output that cites them.

**Rationale**:
Principles 3 and 12 only hold if evidence cannot change without trace, and if every output can be traced back to it.

**Implications**:

- Corrections create new evidence items that supersede, and link to, the original; nothing is overwritten.
- Derived stores (search indexes, aggregates) are read-only projections, rebuildable from the evidence store.
- Lineage links each brief fragment to its evidence items and to the rules and versions that selected it.
- Integrity checks (for example hash chaining) detect tampering.

**Validation Gates**:

- [ ] Evidence store rejects in-place updates and deletes outside the retention process
- [ ] Derived stores can be rebuilt from the evidence store
- [ ] Lineage is queryable from any brief fragment back to its source
- [ ] Integrity verification runs routinely and alerts on failure

**Common Violations**:

- Editing a transcript directly to "fix" a transcription error
- Briefs built from a cache that has drifted from the evidence store

---

## III. Integration Principles

### 15. Contract-First Interfaces and Standard Interoperability

**Category**: Application

**Principle Statement**:
Every boundary (core ↔ pack, core ↔ adapter, service ↔ service, platform ↔ external system) MUST be defined by a published, versioned contract. External interoperability MUST use recognised open interchange standards through the pack's interoperability mapping, and MUST pass through participant approval (Principle 4).

**Rationale**:
Contracts let the core, packs and adapters evolve independently. Standards-based interoperability avoids bespoke integrations per customer.

**Implications**:

- Interface specifications and event schemas are published and versioned, with a backward-compatibility policy.
- No service reads another service's data store directly.
- Asynchronous, event-based integration is preferred for non-interactive flows; events are versioned and carry the version manifest.
- Outbound interoperability messages are built from approved, cited content only.

**Validation Gates**:

- [ ] Interface and event contracts are published and versioned
- [ ] Contract tests run in CI for core ↔ pack and core ↔ adapter boundaries
- [ ] No cross-service database access
- [ ] Outbound interoperability checks participant approval

**Common Violations**:

- Packs reaching into core internals instead of the pack contract
- Customer-specific integration code in the core

---

## IV. Quality Attributes

### 16. Security by Design (NON-NEGOTIABLE)

**Category**: Technology

**Principle Statement**:
All components MUST implement defence in depth with zero-trust principles: every request authenticated and authorised, least privilege, encryption in transit and at rest, and continuous monitoring.

**Rationale**:
Cairn holds Restricted data about people at vulnerable moments. A breach would harm participants and destroy the trust the platform depends on.

**Mandatory Controls**:

- [ ] Multi-factor authentication for all staff and privileged access
- [ ] Service-to-service authentication with workload identity
- [ ] Secrets in a managed secrets service, never in code or configuration files
- [ ] Encryption at rest with tenant-scoped keys for Restricted data; regulated packs use their own keys
- [ ] Encrypted transport for all network communication
- [ ] Network segmentation between tenants, packs and planes
- [ ] Logging of all authentication, authorisation and break-glass events
- [ ] Regular penetration testing and continuous vulnerability scanning
- [ ] Prompt-injection and data-exfiltration testing of every model-facing path

**Compliance Frameworks** (apply as relevant to tenant and pack):

- Information security management aligned to ISO/IEC 27001
- Australian Privacy Act 1988 and the Australian Privacy Principles; state health records legislation where applicable
- For regulated packs: software lifecycle and risk management expected for software as a medical device (for example IEC 62304 and ISO 14971), as determined by each pack's regulatory profile

**Exceptions**: None. Individual control implementations may vary where compensating controls are approved.

**Validation Gates**:

- [ ] Threat model completed and reviewed for the core and each pack
- [ ] Security controls mapped to requirements
- [ ] Security testing plan defined and executed each release
- [ ] Incident response runbook, including breach notification, in place

---

### 17. Observability Without Content

**Category**: Technology

**Principle Statement**:
All components MUST emit structured logs, metrics and traces sufficient to operate the service, and telemetry MUST NOT contain participant content or direct identifiers.

**Rationale**:
We cannot operate what we cannot see, but telemetry is the most common route by which sensitive data escapes its controls.

**Implications**:

- Telemetry uses correlation IDs and pseudonymous identifiers, never utterances, transcripts, media or names.
- Model gateway telemetry records task, binding, versions, latency, tokens and outcome, not prompt or completion text.
- Service level objectives are defined for journey responsiveness, safety evaluation latency and brief generation.
- Telemetry stays in-region (Principle 11).

**Validation Gates**:

- [ ] Automated scanning of telemetry for content and identifiers
- [ ] Service level objectives and indicators defined with alerting and runbooks
- [ ] Distributed tracing covers the journey, rules runtime and model gateway
- [ ] Telemetry destinations verified in-region

**Common Violations**:

- Logging full model requests and responses "for debugging"
- Exception messages that include user input

---

### 18. Resilience, Availability and Performance

**Category**: Technology

**Principle Statement**:
Components MUST have defined availability, recovery (RTO/RPO) and performance targets, MUST degrade gracefully when dependencies fail, and MUST never degrade the safety floor.

**Rationale**:
Participants may engage at difficult moments. The platform must stay usable and safe when parts of it fail, especially the model provider.

**Implications**:

- If model inference is unavailable, the journey falls back to fixed pack wording; deterministic rules and the safety floor keep working (Principle 2 makes this possible).
- Timeouts, retries with backoff and circuit breakers on all external calls.
- Participant input is durably captured before processing, so no input is lost on failure.
- Disaster recovery sites and backups stay within approved regions.

**Validation Gates**:

- [ ] Availability, RTO, RPO and latency targets defined per component
- [ ] Fault-injection testing includes model gateway and provider outages
- [ ] Safety floor verified to work with all models unavailable
- [ ] Backup restore tested; recovery sites in-region
- [ ] Load testing performed at expected peak

---

### 19. Accessible and Inclusive by Default

**Category**: Business / Application

**Principle Statement**:
Participant, contributor and reviewer experiences MUST meet recognised web and mobile accessibility standards (WCAG 2.2 AA as a minimum) and SHOULD support low-bandwidth, low-literacy and multilingual use as packs require.

**Rationale**:
The people who most need low-burden, respectful journeys (Principle 6) often face the most barriers to access.

**Validation Gates**:

- [ ] Automated and manual accessibility testing each release
- [ ] Testing with assistive technologies and with participants who use them
- [ ] Plain-language review of core and pack wording

---

## V. Development Practices

### 20. Everything as Code, Including Policy

**Category**: Technology

**Principle Statement**:
Infrastructure, configuration, cloud policy, residency controls, packs, rules and prompts MUST be defined as code, version-controlled, reviewed and deployed through automated pipelines.

**Rationale**:
Principles 9, 11 and 12 depend on reproducible, auditable configuration. Manual change creates drift that no one can validate.

**Validation Gates**:

- [ ] All infrastructure and policy defined as code
- [ ] No manual production changes; drift detection alerts on divergence
- [ ] Packs, rules and prompts built and released as versioned artefacts

---

### 21. Evaluation-Gated Change

**Category**: Technology

**Principle Statement**:
No change to core, pack, rule, prompt, model binding or speech engine MUST reach production without passing automated tests and the relevant evaluation suites, including the safety floor regression suite.

**Rationale**:
Model and prompt behaviour cannot be verified by unit tests alone. Evaluation suites are how Principles 2, 3, 5 and 7 are demonstrated on each change.

**Implications**:

- Test pyramid for code: unit, contract and end-to-end tests.
- Each pack owns an evaluation suite covering extraction accuracy, citation integrity, evaluative-language drift, tone policy and pack red flags.
- Changing a model binding in the gateway is a release, gated by evaluation, not a configuration toggle.
- Evaluation data is synthetic or consented for that purpose (Principle 13).

**Validation Gates**:

- [ ] Automated tests and evaluation suites run in CI and block on failure
- [ ] Safety floor regression suite runs on every core and pack release
- [ ] Model binding changes go through the same gate as code
- [ ] Evaluation datasets have documented provenance and consent basis

---

### 22. Continuous Delivery with Supply-Chain Assurance

**Category**: Technology

**Principle Statement**:
All changes MUST pass through automated build, test, security scan and deployment pipelines that produce signed, identifiable artefacts with a software bill of materials.

**Rationale**:
Signed artefacts and SBOMs are what make pinned core releases (Principle 9) and SOUP registers trustworthy.

**Validation Gates**:

- [ ] Pipelines include dependency, container and code vulnerability scanning
- [ ] Artefacts are signed and verified at deployment
- [ ] SBOM generated for every release and fed into SOUP registers for regulated packs
- [ ] Rollback tested

---

### 23. Decisions Are Recorded

**Category**: Application

**Principle Statement**:
Significant architecture decisions, including every exception to these principles, MUST be recorded as Architecture Decision Records with context, options considered and consequences.

**Rationale**:
Principles are enforced through decisions. Recording them keeps the reasoning available to future teams and to regulated-pack auditors.

**Validation Gates**:

- [ ] ADR exists for each significant decision, including the Principle 10 portability boundary and the Principle 11 default region
- [ ] Each ADR references the principles it applies or departs from

---

## VI. Principle Precedence

When principles appear to pull against each other, apply this order. Higher items win, and the conflict should be recorded in an ADR.

1. **Safety floor** (Principle 7)
2. **Participant ownership and consent** (Principles 4, 13)
3. **Residency and security** (Principles 11, 16)
4. **Deterministic decisions and cited evidence** (Principles 2, 3, 14)
5. **Describe, never evaluate; respect energy** (Principles 5, 6)
6. **Structural principles** (Principles 1, 8, 9, 10, 12, 15)
7. **Quality attributes and delivery practices** (Principles 17–23)

**Known interactions and how they resolve**:

| Interaction | Resolution |
|-------------|------------|
| Safety floor (7) vs participant ownership (4) | The floor acts towards the participant without needing approval. Disclosure to anyone else still needs a consent purpose or a documented legal basis. |
| LLMs converse (2) vs every claim cites (3) | Model extraction and quote shortening are allowed only because their output is validated against, and cites, confirmed source spans. |
| On-device first (8) vs residency (11) | Features and consented media that leave the device are then subject to residency like any other data. |
| Portable core (10) vs residency by policy (11) | Residency is enforced in native adapters and cloud policy; the core stays provider-neutral. |
| Regulated isolation (9) vs security patching (16) | Security fixes are fast-tracked through the regulated pack's own change control, never pushed around it. |
| Graceful degradation (18) vs LLMs converse (2) | Losing the model degrades phrasing only, because decisions never depended on it. |

---

## VII. Exception Process

### Requesting Architecture Exceptions

Principles are mandatory unless the Cairn Architecture Review Board approves a documented exception.

**Cannot be waived** (NON-NEGOTIABLE): Principles 2, 3, 4, 7, 11 and 16. Only the *implementation* of a control may vary, with approved compensating controls.

**Valid Exception Reasons** (for all other principles):

- Technical constraints that prevent compliance
- Regulatory or legal requirements
- Transitional state during migration
- Time-boxed pilot or proof of concept that uses no real participant data

**Exception Request Requirements**:

- [ ] Justification with business and technical rationale
- [ ] Alternative approach and compensating controls
- [ ] Risk assessment and mitigation plan
- [ ] Expiry date (exceptions are time-bound)
- [ ] Remediation plan to reach compliance
- [ ] ADR recording the decision (Principle 23)

**Approval Process**:

1. Submit the exception request to the architecture owner.
2. Review by the Architecture Review Board, with clinical safety and privacy leads for anything touching Principles 4–8 or 13.
3. For regulated packs, approval also goes through that pack's change control.
4. Record the exception in the project's architecture documentation.
5. Review all open exceptions quarterly.

---

## VIII. Governance and Compliance

### Architecture Review Gates

**Discovery / Alpha**:

- [ ] Principles understood by the delivery team
- [ ] High-level approach aligns with the foundational principles
- [ ] No obvious violations of NON-NEGOTIABLE principles

**Beta / Design**:

- [ ] Detailed architecture documented
- [ ] Compliance with each principle validated
- [ ] Exceptions requested and approved
- [ ] Safety, privacy and residency principles validated by their leads

**Pre-Production**:

- [ ] Implementation matches approved architecture
- [ ] All validation gates passed
- [ ] Automated enforcement (below) active in CI and cloud policy
- [ ] Operational readiness verified

### Enforcement Mechanisms

These principles are enforced by automation wherever possible rather than by review alone.

| Principle | Primary enforcement |
|-----------|---------------------|
| 1 Domain-free core | CI vocabulary deny-list lint on core source |
| 2 Deterministic decisions | Decision replay tests; architecture review of decision points |
| 3 Cited evidence | Fail-closed citation check at render time; evaluation suite |
| 4 Participant ownership | Consent-aware access checks; cohort-size enforcement in aggregate queries |
| 7 Safety floor | Floor regression suite; merge-order tests for pack red flags |
| 9 Regulated isolation | Deployment manifests pinned to validated release; separate data planes |
| 10 Portable core | CI import check blocking cloud SDKs in core and pack modules |
| 11 Residency | Cloud region-deny policy; CI infrastructure checks; gateway binding rejection; egress control |
| 12 Version everything | Schema validation of version manifests on outputs |
| 17 Observability without content | Automated telemetry content scanning |
| 21 Evaluation-gated change | CI evaluation gates, including model binding changes |

### Enforcement

- Architecture reviews are mandatory for the core and for every new pack.
- Violations must be fixed before production deployment.
- Approved exceptions are time-bound and reviewed quarterly.
- Live systems are reviewed for continued compliance.

### Open Questions for Ratification

These points are implied by the principles but not yet decided. They should be resolved by ADR before v1.1.

1. **Minimum cohort size**: The core floor value for organisation aggregates (Principle 4) and the small-cell suppression rule.
2. **Safety disclosure beyond the participant**: Whether any pack may escalate a safety event to a third party, and if so under which consent purpose or legal basis (Principles 4 and 7).
3. **Burden budget limits**: Core minimum and maximum limits within which packs set values (Principle 6).
4. **Regulatory profile schema**: Contents of a pack's regulatory profile, including when baseline change may be shown (Principles 5 and 9).
5. **Supported cloud set**: Which providers get adapters first, and the portability test environment (Principle 10).

---

## IX. Appendix

### Principle Summary Checklist

| # | Principle | Category | Criticality | Validation |
|---|-----------|----------|-------------|------------|
| 1 | The Core Is Domain-Free | Application | CRITICAL | Vocabulary lint, pack-only domain addition |
| 2 | LLMs Converse; Deterministic Rules Decide | Application | NON-NEGOTIABLE | Decision replay, rule mapping |
| 3 | Every Claim Cites Evidence | Application / Data | NON-NEGOTIABLE | Fail-closed citation check |
| 4 | The Participant Owns the Journey | Business / Data | NON-NEGOTIABLE | Approval checks, cohort enforcement |
| 5 | Describe, Never Evaluate | Business | CRITICAL | Schema and copy review, eval drift check |
| 6 | Respect the Participant's Energy | Business | HIGH | Burden budget enforcement, copy review |
| 7 | Safety Has a Floor | Business / Application | NON-NEGOTIABLE | Floor regression suite |
| 8 | On-Device First | Data / Technology | CRITICAL | Network traffic tests, consent checks |
| 9 | Regulated Packs Are Isolated | Technology | CRITICAL | Pinned release, SOUP register |
| 10 | Portable Core, Native Adapters | Technology | HIGH | SDK import check, portability test |
| 11 | Residency by Policy | Data / Technology | NON-NEGOTIABLE | Cloud policy, CI checks, gateway binding |
| 12 | Version Everything | Application / Data | CRITICAL | Version manifest schema |
| 13 | Consent-Bound, Minimised Data | Data | CRITICAL | Purpose mapping, automated retention |
| 14 | Evidence Integrity and Lineage | Data | CRITICAL | Append-only store, integrity checks |
| 15 | Contract-First Interfaces | Application | HIGH | Contract tests |
| 16 | Security by Design | Technology | NON-NEGOTIABLE | Threat model, penetration testing |
| 17 | Observability Without Content | Technology | HIGH | Telemetry content scanning |
| 18 | Resilience, Availability and Performance | Technology | HIGH | Fault injection, DR tests |
| 19 | Accessible and Inclusive by Default | Business / Application | HIGH | Accessibility testing |
| 20 | Everything as Code, Including Policy | Technology | HIGH | Drift detection |
| 21 | Evaluation-Gated Change | Technology | CRITICAL | CI evaluation gates |
| 22 | Continuous Delivery with Supply-Chain Assurance | Technology | HIGH | Signed artefacts, SBOM |
| 23 | Decisions Are Recorded | Application | MEDIUM | ADR coverage |

---

**Document Version History**

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-09-28 | ArcKit AI | Initial draft from architecture owner's foundational principles |

## External References

> This section provides traceability from generated content back to source documents.
> Follow citation instructions in the project's citation reference guide.

### Document Register

| Doc ID | Filename | Type | Source Location | Description |
|--------|----------|------|-----------------|-------------|
| *None provided* | — | — | — | Principles 1–12 supplied directly by the architecture owner in the command input |

### Citations

| Citation ID | Doc ID | Page/Section | Category | Quoted Passage |
|-------------|--------|--------------|----------|----------------|
| — | — | — | — | — |

### Unreferenced Documents

| Filename | Source Location | Reason |
|----------|-----------------|--------|
| — | — | — |

---

**Generated by**: ArcKit `/arckit:principles` command
**Generated on**: 2026-09-28
**ArcKit Version**: 6.16.4
**Project**: Cairn — Global Architecture (Project 000)
**Model**: Claude Opus 5.5 (claude-opus-5-5)

<!-- arckit-provenance:start -->

## Build Provenance

*Stamped automatically by the ArcKit plugin's `provenance-stamp.mjs` PostToolUse hook. Complements (does not replace) the human-authored footer above. Carries only fields the model can't authoritatively self-report: build context from `.arckit/state.json` and effort levels derived from command frontmatter + the silent-downgrade matrix.*

| Field | Value |
|-------|-------|
| Requested Effort | `high` |
| Effective Effort | _unknown — model not parsed from existing footer_ |
| Stamped at | 2026-09-28T22:09:08.546Z |

<!-- arckit-provenance:end -->
