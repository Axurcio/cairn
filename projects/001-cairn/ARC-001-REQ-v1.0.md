# Project Requirements: Cairn — Longitudinal Guidance and Evidence Platform

> **Template Origin**: Official | **ArcKit Version**: 6.16.4 | **Command**: `/arckit:requirements`

## Document Control

| Field | Value |
|-------|-------|
| **Document ID** | ARC-001-REQ-v1.0 |
| **Document Type** | Business and Technical Requirements |
| **Project** | Cairn — Longitudinal Guidance and Evidence Platform (Project 001) |
| **Classification** | OFFICIAL |
| **Status** | DRAFT |
| **Version** | 1.0 |
| **Created Date** | 2026-09-28 |
| **Last Modified** | 2026-09-28 |
| **Review Cycle** | Monthly |
| **Next Review Date** | 2026-10-28 |
| **Owner** | Chris McKelt (Architecture Owner) |
| **Reviewed By** | [PENDING] |
| **Approved By** | [PENDING] |
| **Distribution** | Project Team, Architecture Team, Clinical Safety, Privacy |

## Revision History

| Version | Date | Author | Changes | Approved By | Approval Date |
|---------|------|--------|---------|-------------|---------------|
| 1.0 | 2026-09-28 | ArcKit AI | Initial creation from `/arckit:requirements` command | [PENDING] | [PENDING] |

## Document Purpose

This document turns the Cairn Solution Design v0.2 into testable requirements for architecture reviews, design reviews, vendor RFPs and test planning. It is governed by the global architecture principles in `ARC-000-PRIN-v1.0`. **P1–P23** in this document refer to those principles.

**How to read it**:

- Where the solution design and the principles disagree, the requirement follows the principles. The disagreement is recorded in **Requirement Conflicts & Resolutions** so that it can be decided openly, not buried.
- Priorities use MoSCoW (MUST_HAVE, SHOULD_HAVE, COULD_HAVE, WONT_HAVE). Non-functional and integration requirements also carry a criticality.
- **Phase** refers to the design's delivery roadmap: Phase 0 discovery, Phase 1 core platform plus Parkinson's pilot, Phase 2 mentorship pack, Phase 3 second cloud, Phase 4 productisation.
- Targets marked **(proposed)** are starting values. They must be confirmed in Phase 0 or during the pilot before they become acceptance thresholds.
- Inline markers such as `[CSD-C1]` cite the solution design (see External References).

> ⚠️ **Stakeholder analysis missing.** No `ARC-001-STKE` artefact exists yet. The stakeholders below are provisional and derived from the solution design. Run `/arckit:stakeholders` and then re-baseline this document (v1.1) so that each requirement traces to named stakeholder goals.

---

## Executive Summary

### Business Context

Cairn supports people through journeys that unfold over weeks, months or years: a person living with Parkinson's preparing for infrequent specialist visits, or a mentee working towards development goals between mentoring sessions. In both cases, what matters happens between the conversations. The person forgets the details, the counterpart sees a snapshot, and the time together is spent reconstructing the past instead of deciding what to do next.

Cairn lets the participant talk, type, capture media and complete guided activities over time. It turns those interactions into a structured, cited timeline, uses versioned rules to spot patterns and gaps, asks for the next useful piece of evidence within a strict burden budget, and prepares a brief that the participant approves before anyone else sees it [CSD-C2].

The strategic bet is that one domain-free core, extended by versioned Domain Packs, can serve regulated healthcare and unregulated personal development without either domain leaking into the other. The platform must also run on more than one cloud, keep data and inference in the tenant's approved regions (Australia by default), and use language models and a long-term memory service only in ways that never make them the authority [CSD-C1].

### Objectives

- Prove that one domain-free core can run materially different journeys (Parkinson's symptom capture and mentorship) through versioned Domain Packs.
- Give participants a low-burden way to record their experience over months and arrive at clinician or mentor conversations with an evidence-backed brief they approved.
- Make every governed decision explainable and replayable, and every statement shown to a person traceable to evidence.
- Protect participants through consent-bound sharing, a core safety floor, data residency, isolated regulated deployments and zero cross-journey access by default.
- Stay portable across clouds, models, speech engines and memory providers through a small set of certified configurations.

### Expected Outcomes

- (proposed) At least 70% of scheduled reviewer sessions for active pilot participants are preceded by a participant-approved brief.
- (proposed) Reviewers rate brief usefulness at 4 out of 5 or higher.
- 100% of material claims in briefs cite evidence; 100% of deterministic decisions replay identically; zero critical safety misses at any release.
- The mentorship pack ships in Phase 2 with no domain-specific core changes.
- A second cloud is certified in Phase 3 with no product fork.

### Project Scope

**In Scope**:

- Participant mobile and responsive web experience: voice, text, photo, video and document capture, guided activities, timeline review, correction and approval
- Core services: tenant, participant and relationship management; journeys; conversation; evidence and provenance; activities; pattern engine; planner; durable workflows; reports; consent and policy; Domain Pack registry; integration gateway; model gateway; long-term memory service
- Core safety floor for self-harm and immediate danger
- Reference Domain Packs: Parkinson's symptom capture (Phase 1 pilot) and mentorship (Phase 2)
- Reviewer experience: secure briefs, evidence packs and share links for clinicians, mentors and other trusted counterparts
- Organisation reporting limited to aggregates above a minimum cohort size
- Certified deployment configurations: AWS first (Phase 1), a second cloud (Phase 3)
- Pack evaluation harness, pack lifecycle and certification records

**Out of Scope**:

- General-purpose autonomous agents; unrestricted medical diagnosis or treatment advice; automated employment decisions [CSD-C3]
- Diagnoses, ratings, rankings, severity scores or predictions about people (P5), except where a pack's approved regulatory profile allows a specific measure to be shown
- Language models deciding what is detected, what is asked next, what is safe or what appears in a brief (P2)
- Managed agent services in the core (P10)
- Cross-journey linkage between a person's journeys in v1 (a future, explicitly consented capability)
- Use of participant content to train or fine-tune models without a separate consent purpose
- Semantic or agent memory as a source of truth or policy engine [CSD-C3]
- Participants under 18 in v1 (see assumption A-1)
- Pack authoring tooling for third parties before Phase 4

---

## Stakeholders

| Stakeholder | Role | Organization | Involvement Level |
|-------------|------|--------------|-------------------|
| S-1 Participant (patient, mentee) | Primary user; owns the journey | Tenant's users | Requirements source, user acceptance |
| S-2 Contributor (carer, peer, feedback provider) | Adds input at the participant's invitation | Participant's network | User acceptance |
| S-3 Reviewer (clinician, mentor, coach) | Receives participant-approved briefs | Health service or programme | Requirements source, user acceptance |
| S-4 Tenant organisation (health service, employer, programme sponsor) | Buyer and operator of a programme | Customer | Decision maker for deployment and programme scope |
| S-5 Programme coordinator | Runs a programme; sees aggregates only | Customer | Requirements source |
| S-6 Pack author and domain owner (clinical advisory group, programme designer) | Owns pack content, rules and evaluation cases | Cairn or partner | Requirements definition |
| S-7 Clinical safety and regulatory lead | Safety floor approval, regulated pack assurance | Cairn | Safety and regulatory sign-off |
| S-8 Privacy officer | Privacy impact, consent model, residency | Cairn | Privacy sign-off |
| S-9 Platform operator and SRE | Runs data planes and certified configurations | Cairn or tenant | Operational acceptance |
| S-10 Architecture owner (Chris McKelt) and Architecture Review Board | Principles, design authority, exceptions | Cairn | Technical oversight |
| S-11 Product owner and executive sponsor (not yet named) | Business case, prioritisation | Cairn | Decision maker |

---

## Business Requirements

### BR-001: One Core, Many Domains

**Description**: Deliver a single domain-free core platform on which materially different journeys run as versioned Domain Packs, proven first with Parkinson's symptom capture and mentorship [CSD-C30].

**Rationale**: New domains must not need core releases, and regulated packs must not inherit other domains' changes (P1, P9).

**Success Criteria**:

- The mentorship pack ships in Phase 2 with zero core changes that introduce domain vocabulary
- The core vocabulary lint passes on every release
- Phase 4 gate: a third domain is built mainly as pack configuration plus bounded extensions

**Priority**: MUST_HAVE

**Stakeholder**: S-10, S-11

---

### BR-002: Evidence-Backed Preparation for Human Conversations

**Description**: Help participants capture experience over weeks to years, structure it into evidence, and arrive at conversations with a clinician or mentor holding a brief they approved [CSD-C2].

**Rationale**: The product's value is continuity between infrequent human conversations.

**Success Criteria**:

- (proposed) At least 70% of scheduled reviewer sessions for active pilot participants are preceded by a participant-approved brief
- (proposed) Reviewer-rated usefulness of 4 out of 5 or higher
- (proposed) At least 80% of participants agree the brief reflects what they wanted to raise

**Priority**: MUST_HAVE

**Stakeholder**: S-1, S-3

---

### BR-003: Participant Ownership and Trust

**Description**: Participants control what is shared, with whom and for how long. Contributors see only their own input. Organisations see only aggregates.

**Rationale**: Participants share sensitive material only if nothing goes anywhere without their say (P4, NON-NEGOTIABLE).

**Success Criteria**:

- 100% of disclosures have a matching participant approval record
- Zero unauthorised disclosure incidents
- (proposed) Revocation takes effect for all new access within 60 seconds

**Priority**: MUST_HAVE

**Stakeholder**: S-1, S-8

---

### BR-004: Explainable Decisions and Cited Outputs

**Description**: Detection, next-ask selection, safety and brief content are decided by versioned deterministic rules, and every statement shown to a person cites evidence [CSD-C7].

**Rationale**: Decisions must be explainable, reproducible and stable across model changes, and they form the basis of regulated assurance (P2, P3).

**Success Criteria**:

- 100% deterministic replay of decisions for the same inputs and versions
- 100% material-claim evidence coverage in briefs [CSD-C28]
- Swapping the model bound to a task changes no decision in the replay suite

**Priority**: MUST_HAVE

**Stakeholder**: S-3, S-7, S-10

---

### BR-005: Low Burden, No Engagement Mechanics

**Description**: Cap the asks made of each participant and never use streaks, badges, guilt prompts or other engagement mechanics.

**Rationale**: Participants may be unwell or stretched; the platform exists to reduce their effort (P6).

**Success Criteria**:

- Every evaluation persona stays within its pack's burden budget
- (proposed) At least 80% of pilot participants rate the effort as acceptable
- Release review finds no engagement mechanics or guilt framing

**Priority**: MUST_HAVE

**Stakeholder**: S-1

---

### BR-006: Safety Floor Across Every Domain

**Description**: The core responds to self-harm and immediate danger with fixed, approved messages in every pack, whatever the pack or model.

**Rationale**: A participant in danger must get the same approved response every time (P7, NON-NEGOTIABLE).

**Success Criteria**:

- Zero critical misses on curated floor cases; any critical miss blocks release [CSD-C29]
- The floor works offline and with every model unavailable

**Priority**: MUST_HAVE

**Stakeholder**: S-1, S-7

---

### BR-007: Regulatory Readiness for Regulated Packs

**Description**: Host regulated packs in isolated, pinned and validated deployments. The Parkinson's pack is treated as regulated until its intended-purpose assessment concludes otherwise.

**Rationale**: The Parkinson's pack does not diagnose, score severity or recommend treatment [CSD-C20], but on-device motor and voice features could still bring it within medical device regulation. The determination must come before the pilot (P9).

**Success Criteria**:

- A documented regulatory determination (intended purpose and classification) exists before the Parkinson's pilot starts
- The regulated deployment runs a pinned core release that matches its validation record
- A complete SOUP register exists for every regulated release

**Priority**: MUST_HAVE

**Stakeholder**: S-7, S-11

---

### BR-008: Deploy Where the Customer Needs, Within Their Residency

**Description**: Deploy the same product to AWS, Azure or Google Cloud through certified configurations, keeping all data and inference in the tenant's approved regions, Australia by default [CSD-C36].

**Rationale**: Buyers choose their cloud and region for governance reasons, and participants must be able to rely on where their data lives (P10, P11).

**Success Criteria**:

- A second cloud is certified in Phase 3 without a product fork
- Cloud policy compliance reports show zero resources or inference outside approved regions

**Priority**: MUST_HAVE

**Stakeholder**: S-4, S-8, S-10

---

### BR-009: Safe Use in Employer-Sponsored Programmes

**Description**: Mentoring content never becomes performance-management data. There is no hidden scoring, and sharing with HR or managers is off by default and possible only with explicit participant approval [CSD-C21].

**Rationale**: Power imbalance between employer and participant would destroy trust and create employment and privacy risk (P4, P5).

**Success Criteria**:

- Zero HR or manager data flows without a per-share participant approval
- Prohibited-decision tests pass for every mentorship release

**Priority**: MUST_HAVE (Phase 2)

**Stakeholder**: S-1, S-4

---

### BR-010: Replaceable AI and Memory Components

**Description**: Models, speech engines and the long-term memory provider can be replaced without changing governed decisions or canonical records. Long-term memory is non-authoritative [CSD-C1].

**Rationale**: Model and memory technology is changing fast; the product must not be locked to one provider or one release.

**Success Criteria**:

- All governed-workflow tests pass with the memory provider disabled (null provider)
- Replacing the memory provider needs no core or pack code change
- Replacing a model binding passes the replay suite and the pack evaluation suite

**Priority**: MUST_HAVE

**Stakeholder**: S-10

---

### BR-011: Organisational Insight Without Individual Exposure

**Description**: Tenants see programme-level aggregates (reach, participation, burden) only, above a minimum cohort size.

**Rationale**: Sponsors need evidence that programmes work, but must never see individual content (P4).

**Success Criteria**:

- Aggregates below the core minimum cohort size are suppressed
- Tests prove no individual content is reachable from organisation views

**Priority**: SHOULD_HAVE (Phase 2)

**Stakeholder**: S-4, S-5

---

### BR-012: Scalable Pack Authoring and Certification

**Description**: Packs move through a governed lifecycle with evaluation evidence and a named certification authority, and (Phase 4) authoring tooling lets approved authors build packs without core engineers.

**Rationale**: The platform only scales if new domains can be added safely without core releases (P1, P21).

**Success Criteria**:

- Every production pack has certification evidence against a named certified configuration
- (Phase 4) A pack author builds and certifies a pack without core code changes

**Priority**: SHOULD_HAVE

**Stakeholder**: S-6, S-10

---

## Functional Requirements

### User Personas

#### Persona 1: Participant Living with Parkinson's

- **Role**: Adult living with Parkinson's, seeing a GP and a movement-disorder clinician every three to six months
- **Goals**: Remember and explain what changed between visits, including daily-life impact; decide what to raise
- **Pain Points**: Fatigue; tremor makes typing hard; a soft voice can defeat speech recognition; short appointments; details forgotten by the day of the visit
- **Technical Proficiency**: Low to Medium

#### Persona 2: Mentee in an Employer-Sponsored Programme

- **Role**: Professional in a 6–12 month mentoring programme with monthly sessions
- **Goals**: Make progress on development goals; capture concrete examples as they happen; use sessions well
- **Pain Points**: Examples forgotten between sessions; worry that the employer can read reflections
- **Technical Proficiency**: High

#### Persona 3: Contributor (Carer or Peer)

- **Role**: Family carer, peer or feedback provider invited by the participant
- **Goals**: Add observations (for example sleep or falls) without being given access to the participant's private content
- **Pain Points**: Unclear what is shared and with whom
- **Technical Proficiency**: Low to Medium

#### Persona 4: Clinician Reviewer

- **Role**: GP or neurologist receiving a participant-approved brief before a visit
- **Goals**: A one-page, cited summary that separates "not reported" from "not asked"; access to the source evidence when needed
- **Pain Points**: No time to read long diaries; unstructured histories; uncertainty about where claims came from
- **Technical Proficiency**: Medium

#### Persona 5: Mentor Reviewer

- **Role**: Mentor preparing for a session
- **Goals**: See the mentee's selected priorities, progress, recent examples and open actions
- **Pain Points**: Loses continuity between infrequent sessions
- **Technical Proficiency**: High

#### Persona 6: Programme Coordinator and Tenant Administrator

- **Role**: Runs a programme for a health service or employer
- **Goals**: Invite participants, configure the programme, see aggregate participation and burden
- **Pain Points**: Must show value to sponsors without ever seeing individual content
- **Technical Proficiency**: Medium

#### Persona 7: Pack Author and Domain Owner

- **Role**: Member of a clinical advisory group or programme design team
- **Goals**: Author coverage models, rules, asks, templates and evaluation cases; see evaluation results before release
- **Pain Points**: Depends on engineers for every change; needs confidence a change is safe
- **Technical Proficiency**: High

#### Persona 8: Clinical Safety and Regulatory Lead

- **Role**: Approves safety floor content and certifies regulated pack releases
- **Goals**: Traceable evidence of verification, validation and change control
- **Pain Points**: Assurance evidence scattered across tools
- **Technical Proficiency**: Medium

---

### Use Cases

#### UC-1: Record an Experience by Voice

**Actor**: Participant (Persona 1)

**Preconditions**:

- Active journey bound to a pack version; participant authenticated on a registered device
- Voice capture enabled in participant preferences

**Main Flow**:

1. Participant records a short voice entry.
2. System transcribes on the device and runs the safety floor on the transcript immediately.
3. System shows the transcript; participant confirms it with a single action or edits it.
4. System sends the confirmed text to extraction, which proposes structured observations with source spans.
5. System validates the proposals, stores the evidence with provenance and version manifest, and re-evaluates pack rules.
6. Planner selects one next action or none; the companion phrases it.

**Postconditions**:

- Evidence item, observations, pattern evaluations and planner decision stored with versions
- Raw audio remains on the device

**Alternative Flows**:

- **Alt 3a**: If the participant does not confirm, the utterance is kept as unconfirmed evidence and no extraction runs until it is confirmed.
- **Alt 2a**: If on-device transcription is unavailable and the participant has granted the server transcription consent purpose, audio is transcribed in-region and not retained.

**Exception Flows**:

- **Ex 1**: If the model gateway is unavailable, extraction is queued and the companion uses fixed pack wording.

**Business Rules**:

- Extraction runs only on confirmed text (P2); the safety floor never waits for confirmation (P7)
- Raw audio leaves the device only under an explicit consent purpose (P8)

**Priority**: CRITICAL

---

#### UC-2: Receive the Next Useful Ask

**Actor**: Participant (Persona 1 or 2)

**Preconditions**:

- Journey has coverage gaps or triggered rules; burden budget has capacity

**Main Flow**:

1. Pattern engine evaluates pack rules over the timeline, baseline, coverage and goals.
2. Planner filters eligible actions by cooldowns, burden budget, safety and permissions.
3. Planner selects one action by deterministic priority, or none.
4. Durable workflow schedules the ask for the participant's preferred time.
5. Companion phrases the ask, using permitted recalled context for tone and continuity only.

**Postconditions**:

- Planner decision recorded with inputs and versions; budget consumption recorded

**Alternative Flows**:

- **Alt 3a**: If no candidate fits the budget, the planner records "no action" and nothing is sent.

**Exception Flows**:

- **Ex 1**: If memory recall times out, phrasing proceeds without recalled context.

**Business Rules**:

- Recalled memory can change wording, never the selected action (P2)

**Priority**: CRITICAL

---

#### UC-3: Prepare, Approve and Share a Brief

**Actor**: Participant; Reviewer (Persona 4 or 5)

**Preconditions**:

- Reviewer relationship exists; pack defines a brief template for that audience

**Main Flow**:

1. Participant requests a brief, or a workflow prepares one before a scheduled session.
2. System assembles the brief deterministically from the template, confirmed records and evidence links.
3. System blocks any statement without a resolvable citation.
4. Participant reviews, removes or corrects items, and approves specific sections for the reviewer.
5. System issues a time-bound secure link or an approved structured export.
6. Reviewer opens the brief and can drill into cited evidence the participant approved.

**Postconditions**:

- Approval, share and access events recorded; brief stamped with its version manifest

**Alternative Flows**:

- **Alt 4a**: If the participant declines, nothing is shared and the draft is kept only for the participant.

**Exception Flows**:

- **Ex 1**: If recipient verification fails, access is denied and the participant is notified.

**Business Rules**:

- No brief reaches any audience without participant approval (P4)
- The brief separates "not observed", "not reported" and "not asked / not covered" [CSD-C18]

**Priority**: CRITICAL

---

#### UC-4: Safety Floor Triggered

**Actor**: Participant

**Preconditions**:

- Any active journey in any pack, online or offline

**Main Flow**:

1. Participant input (typed, or transcribed and not yet confirmed) matches a floor rule.
2. System shows the fixed, approved floor message and support options before any model-generated reply.
3. System records a safety event with rule version and evidence reference.
4. Pack red-flag rules and any classifier alerts are added; they never remove the floor response.

**Postconditions**:

- Safety event recorded; normal planning for that turn suspended as the floor rule defines

**Alternative Flows**:

- **Alt 2a**: If the device is offline, the on-device floor shows the same message; the event syncs later.

**Exception Flows**:

- **Ex 1**: If model inference is unavailable, the floor still operates (it never depends on models).

**Business Rules**:

- Disclosure of a safety event to anyone other than the participant requires a consent purpose agreed at enrolment or a documented legal basis (see Conflict C-4)

**Priority**: CRITICAL

---

#### UC-5: Contributor Adds an Observation

**Actor**: Contributor (Persona 3)

**Preconditions**:

- Participant has invited the contributor with a defined scope and expiry

**Main Flow**:

1. Contributor receives a content-free invitation notification and signs in.
2. Contributor answers the ask or adds an observation within the permitted scope.
3. System stores the contribution as evidence attributed to the contributor.
4. Participant sees the contribution and decides whether it can appear in briefs.

**Postconditions**:

- Contribution stored with provenance; contributor can see only their own input

**Alternative Flows**:

- **Alt 1a**: If the invitation has expired or been revoked, access is refused.

**Exception Flows**:

- **Ex 1**: If a contribution matches a floor rule, the floor response is shown to the contributor and a safety event is recorded against the journey.

**Business Rules**:

- Contributors never see the participant's other content or other contributors' input (P4)

**Priority**: HIGH

---

#### UC-6: Revoke Sharing or Delete Evidence

**Actor**: Participant

**Preconditions**:

- Existing share, relationship or evidence item

**Main Flow**:

1. Participant revokes a share or relationship, or deletes an evidence item or the whole journey.
2. System blocks new access immediately and records the revocation.
3. System deletes or supersedes the evidence according to retention rules and marks derived records for recalculation.
4. Memory service deletes corresponding memories and verifies derived observations and mental models no longer hold the information [CSD-C13].
5. System confirms completion to the participant.

**Postconditions**:

- No future access; derived stores, memory banks and backups cleared within the deletion window

**Alternative Flows**:

- **Alt 4a**: If memory verification fails, the journey's memory bank is rebuilt from canonical records.

**Exception Flows**:

- **Ex 1**: If a legal hold applies, the participant is told which items are retained and why.

**Business Rules**:

- Copies already delivered to a reviewer's own systems cannot be recalled; the participant is told this before approving any export

**Priority**: HIGH

---

#### UC-7: Migrate Journeys to a New Pack Version

**Actor**: Pack author; tenant administrator

**Preconditions**:

- New pack version certified for the deployment's certified configuration

**Main Flow**:

1. Pack author publishes a migration plan with the new version.
2. Administrator selects journeys to migrate; the system shows the impact (rules, coverage, templates).
3. System migrates each journey explicitly, recording old and new versions.
4. Existing evidence keeps its original version stamps; new outputs use the new version.

**Postconditions**:

- Migrated journeys pinned to the new version; others remain pinned to the old version

**Alternative Flows**:

- **Alt 3a**: For regulated packs, migration requires the pack's change-control approval first.

**Exception Flows**:

- **Ex 1**: If a journey fails migration checks, it stays on the old version and is reported.

**Business Rules**:

- No silent upgrades (P12)

**Priority**: MEDIUM

---

### Functional Requirements Detail

**Group A: Tenancy, participants and relationships**

#### FR-001: Tenant and Deployment Configuration

**Description**: Administrators define a tenant with its approved region set, certified configuration, enabled pack versions and minimum cohort size (at or above the core minimum).

**Relates To**: BR-008, BR-011 · P4, P11

**Acceptance Criteria**:

- [ ] Given a tenant with an approved region set, when a deployment is provisioned, then every data store, worker and model binding is checked against that set and provisioning fails on any mismatch
- [ ] Given a tenant minimum cohort size below the core minimum, when it is saved, then it is rejected
- [ ] Every tenant configuration change is versioned and audited

**Data Requirements**:

- **Inputs**: Tenant profile, approved regions, certified configuration ID, enabled pack versions
- **Outputs**: Versioned tenant configuration
- **Validations**: Regions permitted by cloud policy; configuration is certified

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Residency and certified configurations are set per tenant.

**Complexity**: MEDIUM

**Dependencies**: FR-047, NFR-C-004

**Assumptions**: Each regulated pack runs in its own data plane (P9)

---

#### FR-002: Participant Onboarding and Preferences

**Description**: Onboard participants with consent capture and preferences: input mode, language and plain-language level, interaction length, cadence, quiet periods, and a personal ask limit no higher than the pack's.

**Relates To**: BR-003, BR-005 · P6, P13, P19

**Acceptance Criteria**:

- [ ] Given a participant sets a lower ask limit than the pack default, when the planner runs, then it uses the lower limit
- [ ] Given onboarding is incomplete, when the participant tries to record, then nothing is captured until the required consent purposes are granted
- [ ] Explicit preferences always override memory-derived context [CSD-C40]

**Data Requirements**:

- **Inputs**: Preferences, consent grants
- **Outputs**: Participant profile
- **Validations**: Personal limit no higher than the pack budget; consent text version recorded

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Participant agency and burden control start at onboarding.

**Complexity**: MEDIUM

**Dependencies**: FR-036

**Assumptions**: Adult participants only in v1 (A-1)

---

#### FR-003: Relationships, Contributors and Reviewers

**Description**: Participants invite trusted people as contributors or reviewers, each with a role, scope, read and write rights, and expiry. Participants can revoke any relationship at any time.

**Relates To**: BR-003, UC-3, UC-5 · P4

**Acceptance Criteria**:

- [ ] Given a contributor signs in, then they see only their own contributions and the asks addressed to them
- [ ] Given a reviewer signs in, then they see only content the participant approved for them
- [ ] Given a revocation, then new access is refused within 60 seconds (proposed) and the event is audited
- [ ] Relationship read rights are stored as explicit, scoped, revocable participant approvals

**Data Requirements**:

- **Inputs**: Invitee identity, role, scope, rights, expiry
- **Outputs**: Relationship record
- **Validations**: Role must be one the pack defines

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: P4 is non-negotiable.

**Complexity**: HIGH

**Dependencies**: FR-036, NFR-SEC-002

**Assumptions**: Invitees can authenticate with a supported method

---

#### FR-004: Multiple Journeys and Cross-Journey Isolation

**Description**: A participant can hold several journeys, such as a health journey and a mentoring journey. No journey or pack can read or infer from another journey's data, including memory; the default is zero cross-domain access [CSD-C37]. Cross-journey linkage is WONT_HAVE for v1.

**Relates To**: BR-001, BR-003 · P4, P13

**Acceptance Criteria**:

- [ ] Given journeys A and B for one participant, when pack logic for B queries data, then A's records are unreachable (store-as-A, read-as-B test)
- [ ] Given memory recall in journey B, then journey A's memory bank is never queried
- [ ] Notifications and navigation never reveal the existence or content of another journey to a relationship

**Data Requirements**:

- **Inputs**: Journey context from the authenticated session
- **Outputs**: Journey-scoped access decisions
- **Validations**: Journey ID derived server-side, never taken from the client

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Health and workplace data must never mix silently.

**Complexity**: HIGH

**Dependencies**: FR-041, NFR-SEC-007

**Assumptions**: Linkage is deferred until a consent model exists

---

**Group B: Journeys and Domain Packs**

#### FR-005: Journey Bound to One Pack Version

**Description**: Each journey is created within a tenant for one participant and bound to exactly one immutable pack version. That version fixes terminology, schemas, rules, activities, planner policy, safety policy, templates and memory policy [CSD-C5].

**Relates To**: BR-001, BR-004 · P12

**Acceptance Criteria**:

- [ ] Given a running journey, when a new pack version is published, then the journey continues on its pinned version
- [ ] The runtime serves several pack versions at once
- [ ] Every output from the journey carries the pinned pack version

**Data Requirements**:

- **Inputs**: Pack version ID
- **Outputs**: Journey record
- **Validations**: Pack version is Pilot or Certified for this deployment

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Outputs must be reproducible from known versions.

**Complexity**: MEDIUM

**Dependencies**: FR-007

**Assumptions**: None

---

#### FR-006: Explicit Journey Migration

**Description**: Moving journeys to a new pack version is an explicit, audited operation with a pack-supplied migration plan and an impact preview.

**Relates To**: UC-7 · P9, P12

**Acceptance Criteria**:

- [ ] Migration records the old and new version per journey; existing evidence keeps its original stamps
- [ ] For a regulated pack, migration is blocked until change-control approval is recorded
- [ ] A journey that fails migration checks stays on its old version and is reported

**Data Requirements**:

- **Inputs**: Migration plan, journey selection
- **Outputs**: Migration records
- **Validations**: Target version certified for the deployment's configuration

**Priority**: SHOULD_HAVE (Phase 2)

**Rationale**: No silent upgrades.

**Complexity**: HIGH

**Dependencies**: FR-005, FR-009

**Assumptions**: Phase 1 pilot needs no migration

---

#### FR-007: Signed Pack Registry and Compatibility

**Description**: Packs are signed, versioned bundles held in version control and the pack registry. The runtime loads only signed packs and checks compatibility with the running core: an exact release pin for regulated packs, a declared range for others [CSD-C33].

**Relates To**: BR-001, BR-007 · P9, P12, P22

**Acceptance Criteria**:

- [ ] Unsigned or tampered packs are rejected at load
- [ ] A regulated pack that declares a version range instead of an exact core release is rejected
- [ ] Released pack versions cannot be changed

**Data Requirements**:

- **Inputs**: Pack bundle and signature
- **Outputs**: Registry entry
- **Validations**: Signature, schema and compatibility checks

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Pack integrity underpins isolation and replay.

**Complexity**: MEDIUM

**Dependencies**: NFR-SEC-008

**Assumptions**: None

---

#### FR-008: Pack Contract Validation

**Description**: The registry checks that every pack declares its intended purpose, target participants, allowed and prohibited decisions, evidence model, safety boundaries, privacy classification, human roles and evaluation gates [CSD-C4]. The pack must also include terminology, extraction schemas, coverage model, rules, activities, planner policy, tone policy, report templates, integration mappings, consent purposes, regulatory profile and memory policy.

**Relates To**: BR-001, BR-012 · P1, P5

**Acceptance Criteria**:

- [ ] A pack missing a required component fails registration with a specific error
- [ ] A pack cannot weaken the safety floor or lower core minimums (cohort size, budget ceiling)
- [ ] The regulatory profile alone decides whether baseline change or instrument scores may be displayed

**Data Requirements**:

- **Inputs**: Pack bundle
- **Outputs**: Validation report
- **Validations**: A schema for each component

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Domain meaning and responsibility must live in the pack, not in prompts.

**Complexity**: MEDIUM

**Dependencies**: FR-007

**Assumptions**: None

---

#### FR-009: Pack Lifecycle States

**Description**: Packs move through Draft, Reviewed, Pilot, Certified, Deprecated and Retired [CSD-C39], and the runtime enforces what each state allows.

**Relates To**: BR-007, BR-012 · P9, P21

**Acceptance Criteria**:

- [ ] Draft packs run only in development environments
- [ ] Pilot packs run only for enrolled pilot tenants with enhanced monitoring
- [ ] Deprecated packs accept no new journeys; Retired packs block use but keep artefacts for audit and replay
- [ ] Every transition records its approver and evidence

**Data Requirements**:

- **Inputs**: Transition request, evidence
- **Outputs**: Lifecycle history
- **Validations**: Approver holds the required role

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: The Parkinson's pilot needs certification discipline from the start.

**Complexity**: MEDIUM

**Dependencies**: FR-047

**Assumptions**: Certification authority named in Phase 0

---

#### FR-010: Bounded Pack Extension Services

**Description**: Where domain logic cannot be declarative (for example a clinical interchange mapping or a domain feature algorithm), a pack may supply a bounded extension service that runs outside the core behind a published contract.

**Relates To**: BR-001 · P1, P15

**Acceptance Criteria**:

- [ ] Extension services use only published core APIs and receive only data the consent policy allows
- [ ] Extension services are versioned, signed and stamped in version manifests
- [ ] The core runs with no extension service loaded

**Data Requirements**:

- **Inputs**: Contracted API calls
- **Outputs**: Contracted responses
- **Validations**: Contract tests

**Priority**: SHOULD_HAVE (Phase 1)

**Rationale**: Avoids an over-generic pack language while keeping domain code out of the core.

**Complexity**: HIGH

**Dependencies**: FR-034

**Assumptions**: None

---

**Group C: Conversation and capture**

#### FR-011: Text and Voice Conversation Turns

**Description**: Participants converse by text or voice. Voice is transcribed on the device by default. Server-side transcription is used only when the participant has granted a transcription consent purpose; the audio is processed in-region and deleted once the transcript is confirmed.

**Relates To**: BR-002, UC-1 · P8, P11

**Acceptance Criteria**:

- [ ] Given default settings, when the participant records voice, then no raw audio leaves the device (network capture test)
- [ ] Given transcription consent, then audio is transcribed through the model gateway in an approved region and not kept after confirmation
- [ ] The speech engine and version are stamped on every transcript

**Data Requirements**:

- **Inputs**: Text or audio
- **Outputs**: Utterance evidence and transcript
- **Validations**: Consent purpose present for any upload

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Voice-first access without routine audio upload.

**Complexity**: HIGH

**Dependencies**: INT-002, NFR-U-002

**Assumptions**: Participant devices can transcribe on-device (A-3)

---

#### FR-012: Transcript Confirmation

**Description**: After a voice turn, the participant confirms the transcript with a single action or edits it [CSD-C38]. Extraction runs only on confirmed text; typed text counts as confirmed on send. The safety floor runs on the unconfirmed transcript straight away.

**Relates To**: UC-1 · P2, P6, P7

**Acceptance Criteria**:

- [ ] Given an unconfirmed transcript, then no extraction and no memory retain occur
- [ ] Given an edit, then both the original and the edited text are kept with provenance
- [ ] Confirmation takes one action and is never automatic
- [ ] Given a floor match in an unconfirmed transcript, then the floor response is shown without waiting for confirmation

**Data Requirements**:

- **Inputs**: Transcript
- **Outputs**: Confirmed utterance
- **Validations**: Confirmation event recorded

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Resolves Conflict C-5 between P2 and burden.

**Complexity**: MEDIUM

**Dependencies**: FR-011, FR-026

**Assumptions**: None

---

#### FR-013: Guided Activities Runner

**Description**: The core runs pack-defined activities: conversation prompts, questionnaires and forms, reflections, guided media captures, practice and role-play, document evidence and external evidence. Each has prerequisites, modalities, consent requirements, completion criteria and report visibility.

**Relates To**: BR-002 · P1, P5

**Acceptance Criteria**:

- [ ] Activities are defined entirely in the pack; the core has no activity-specific code
- [ ] Activity attempts are stored with provenance and versions
- [ ] Role-play and practice produce descriptive evidence only; scores or grades are blocked unless the regulatory profile allows them

**Data Requirements**:

- **Inputs**: Activity definition, participant responses
- **Outputs**: Activity attempt
- **Validations**: Schema for each activity

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: One reusable mechanism for gathering evidence across domains.

**Complexity**: HIGH

**Dependencies**: FR-008, FR-029

**Assumptions**: None

---

#### FR-014: On-Device Media Features and Consented Uploads

**Description**: Guided media captures compute features on the device according to the pack's capture protocol, and only features leave by default. Raw audio, video, photos and documents are uploaded only under an explicit, specific, revocable consent purpose.

**Relates To**: BR-003 · P8, P13

**Acceptance Criteria**:

- [ ] Default capture sends only features and metadata (network test)
- [ ] An upload requires a consent purpose naming the item and the purpose; revocation stops future use and triggers deletion where the purpose requires it
- [ ] A device that cannot compute features skips or defers the capture and never uploads silently
- [ ] Feature extractor versions are stamped on outputs

**Data Requirements**:

- **Inputs**: Capture
- **Outputs**: Derived features; optional evidence object
- **Validations**: Quality metadata present

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Raw media is the most identifying data Cairn handles.

**Complexity**: HIGH

**Dependencies**: NFR-P-005

**Assumptions**: None

---

#### FR-015: Offline Capture and On-Device Safety Floor

**Description**: The app captures entries offline in an encrypted local store and syncs later. Floor rules and messages also run on the device, so the floor works offline.

**Relates To**: BR-006 · P7, P8

**Acceptance Criteria**:

- [ ] Offline entries sync with their original timestamps and without duplicates
- [ ] A floor match offline shows the same approved message as online
- [ ] The local store is encrypted and wiped on remote session revocation

**Data Requirements**:

- **Inputs**: Offline entries
- **Outputs**: Synced evidence
- **Validations**: Idempotent sync keys

**Priority**: SHOULD_HAVE (Phase 1)

**Rationale**: Connectivity is unreliable; the floor must not depend on the network.

**Complexity**: MEDIUM

**Dependencies**: FR-026, NFR-SEC-009

**Assumptions**: None

---

**Group D: Extraction and evidence**

#### FR-016: Schema-Constrained Extraction

**Description**: Extraction calls the model gateway with the pack's schema to propose structured events and observations from confirmed text, each citing its source spans. Proposals are checked deterministically (schema, span resolution, permitted codes) before storage.

**Relates To**: BR-004, UC-1 · P2, P3

**Acceptance Criteria**:

- [ ] Every stored observation cites at least one span in confirmed evidence
- [ ] Proposals that fail schema or span checks are discarded and logged without content
- [ ] Extractor, prompt and model binding versions are stamped on every observation
- [ ] Observations stay proposals until the participant confirms them, directly or through brief approval (FR-032)

**Data Requirements**:

- **Inputs**: Confirmed text, pack schema
- **Outputs**: Events and observations
- **Validations**: Schema, span offsets, pack vocabulary

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Models may extract; they never decide.

**Complexity**: HIGH

**Dependencies**: FR-012, FR-046

**Assumptions**: None

---

#### FR-017: Append-Only Evidence with Provenance

**Description**: Evidence (utterance spans, captures, contributions, external records) is stored append-only with provenance and a version manifest. A correction creates a new item that supersedes and links to the original.

**Relates To**: BR-004 · P3, P12, P14

**Acceptance Criteria**:

- [ ] In-place updates are rejected; deletion happens only through the retention and deletion process
- [ ] Integrity verification detects tampering and raises an alert
- [ ] Every citation resolves to an evidence item with provenance

**Data Requirements**:

- **Inputs**: Evidence items
- **Outputs**: Evidence and provenance records
- **Validations**: Integrity hash on write

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Citations are only meaningful if evidence cannot change without trace.

**Complexity**: HIGH

**Dependencies**: DR-002

**Assumptions**: None

---

#### FR-018: Participant Timeline Review and Correction

**Description**: Participants view their timeline, see what was extracted and why each ask was made, correct and annotate entries, skip asks, delete evidence, and see who has viewed their shared content.

**Relates To**: BR-003, UC-6 · P4, P13

**Acceptance Criteria**:

- [ ] A correction creates superseding evidence, and later briefs use the corrected version
- [ ] Each rule-triggered ask shows its reason in plain language
- [ ] The participant sees an access log of who viewed their shared content and when

**Data Requirements**:

- **Inputs**: Participant corrections and annotations
- **Outputs**: Superseding evidence; access log view
- **Validations**: Correction linked to original item

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Participant agency; supports privacy access and correction rights.

**Complexity**: MEDIUM

**Dependencies**: FR-017

**Assumptions**: None

---

#### FR-019: Coverage Tracking

**Description**: Track coverage against the pack's coverage model using states that separate not asked, not reported, reported, needs detail and complete, so outputs can distinguish "not observed", "not reported" and "not asked / not covered" [CSD-C18].

**Relates To**: BR-002, BR-004 · P1, P3

**Acceptance Criteria**:

- [ ] Coverage state changes only through rules evaluated on evidence
- [ ] Coverage state history is recorded
- [ ] Brief templates can render each state distinctly

**Data Requirements**:

- **Inputs**: Evidence, coverage model
- **Outputs**: Coverage items with state history
- **Validations**: States are those the pack defines

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Reviewers must know whether something was absent or never discussed.

**Complexity**: MEDIUM

**Dependencies**: FR-020

**Assumptions**: None

---

**Group E: Patterns, planning and workflows**

#### FR-020: Deterministic Pattern Engine

**Description**: Evaluate pack rules over the timeline, baseline, coverage and goals: temporal, change from baseline, coverage gap, completeness, consistency, progress or stall, and safety adjacency. Record each evaluation with its inputs, rule version and result. Conflicting evidence produces a clarification ask; it is never silently reconciled.

**Relates To**: BR-004, UC-2 · P2, P12

**Acceptance Criteria**:

- [ ] The same inputs and versions always give the same result (replay test)
- [ ] Each evaluation references the exact input records it used
- [ ] A consistency rule produces a clarification candidate, never an automatic reconciliation
- [ ] Rules cannot call language models; they may call only approved algorithms (FR-021)

**Data Requirements**:

- **Inputs**: Timeline, baseline, coverage, goals, rule definitions
- **Outputs**: Pattern evaluations
- **Validations**: Rule schema; declared input types

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Detection must be explainable and replayable.

**Complexity**: HIGH

**Dependencies**: FR-017, FR-021

**Assumptions**: None

---

#### FR-021: Algorithm Plug-ins and Derived Features

**Description**: Rules may call approved, versioned algorithms such as rolling statistics, change-point detection, trend analysis, similarity and validated domain models. Outputs are recorded as derived features with version and quality metadata and never bypass the rule, planner or report policy [CSD-C10].

**Relates To**: BR-004 · P2, P5, P12

**Acceptance Criteria**:

- [ ] Algorithm outputs are identical for the same inputs and version (stochastic methods are seeded)
- [ ] Derived features and change from baseline are never shown to any audience unless the pack's regulatory profile allows it
- [ ] Features below the pack's quality threshold are excluded from rule evaluation

**Data Requirements**:

- **Inputs**: Evidence, features
- **Outputs**: Derived features
- **Validations**: Algorithm version registered and approved

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Algorithms inform rules; they are not decisions or conclusions.

**Complexity**: HIGH

**Dependencies**: FR-020

**Assumptions**: None

---

#### FR-022: Deterministic Planner

**Description**: The planner selects a single next action, or none [CSD-C9], from eligible actions. It uses pack policy, rule triggers, coverage gaps, goals, due workflow actions, cooldowns, the burden budget, safety, permissions and deterministic priority. No language model takes part in selection.

**Relates To**: BR-004, BR-005, UC-2 · P2, P6

**Acceptance Criteria**:

- [ ] 100% deterministic replay of planner decisions
- [ ] Each decision records its candidates, the filters applied and the reason for the choice
- [ ] The planner never selects an action the pack prohibits
- [ ] "No action" is a valid, recorded outcome

**Data Requirements**:

- **Inputs**: Evaluations, coverage, budget state, permissions
- **Outputs**: Next action record
- **Validations**: Action is in the pack's allowed set

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: What is asked next must be explainable and stable across model changes.

**Complexity**: HIGH

**Dependencies**: FR-020, FR-023

**Assumptions**: None

---

#### FR-023: Burden Budget and Reminders

**Description**: The core enforces the burden budget (pack values within core bounds; the participant may lower them), quiet periods and cooldowns. Reminders are neutral, capped and easy to switch off. There are no streaks, badges, points, leaderboards or loss-framed messages.

**Relates To**: BR-005 · P6

**Acceptance Criteria**:

- [ ] Asks beyond the budget are deferred or dropped (tested for every evaluation persona)
- [ ] A paused journey resumes without penalty and without a flood of catch-up asks
- [ ] The engagement-mechanics review checklist passes for every release

**Data Requirements**:

- **Inputs**: Budget settings, ask history
- **Outputs**: Budget state
- **Validations**: Pack values within core bounds

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Participants' energy is limited and must be respected.

**Complexity**: MEDIUM

**Dependencies**: FR-002

**Assumptions**: Core bounds decided in Phase 0 (principles open question 3)

---

#### FR-024: Durable Long-Running Workflows

**Description**: Waits, reminders, reviews, escalations and multi-step activities run as durable workflows that survive restarts and span months, with workflow versioning so deployments do not break running journeys.

**Relates To**: BR-002 · P12, P18

**Acceptance Criteria**:

- [ ] Crash, retry and replay tests show no lost state and idempotent side effects
- [ ] Workflow changes are versioned; in-flight workflows continue deterministically
- [ ] Workflow payloads that contain participant data are encrypted with keys held in the tenant data plane

**Data Requirements**:

- **Inputs**: Workflow triggers
- **Outputs**: Scheduled actions, workflow history
- **Validations**: Idempotency keys on side effects

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Journeys last months; state must never be lost.

**Complexity**: HIGH

**Dependencies**: INT-004

**Assumptions**: None

---

**Group F: Companion**

#### FR-025: Companion Phrasing

**Description**: The companion phrases the planner-selected action, or an acknowledgement, through the model gateway. It uses canonical state, the pack's tone policy, explicit preferences and permitted recalled context, and it cannot change the action. Any reference to the participant's past must cite evidence. If the model or its output check fails, fixed pack wording is used.

**Relates To**: BR-004, UC-2 · P2, P3, P5, P18

**Acceptance Criteria**:

- [ ] The companion's output always corresponds to the planner-selected action (checked before display)
- [ ] Every factual reference to past content carries a citation that resolves to evidence; otherwise the reference is removed or fixed wording is used
- [ ] Tone adaptation never states an emotion or condition as fact
- [ ] Evaluation suite: zero uncited factual assertions and zero evaluative statements in the reviewed sample

**Data Requirements**:

- **Inputs**: Next action, canonical state, tone policy, recalled context
- **Outputs**: Companion message with citations
- **Validations**: Action match; citation resolution; wording rules

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Models converse; they must not decide or invent.

**Complexity**: HIGH

**Dependencies**: FR-022, FR-042, FR-046

**Assumptions**: None

---

**Group G: Safety and intended purpose**

#### FR-026: Core Safety Floor

**Description**: The core deterministically detects self-harm and immediate-danger content in every participant and contributor input (typed or transcribed, confirmed or not) before any model reply. It shows fixed, clinically approved messages and support options. Floor content is core-owned, versioned and domain-neutral.

**Relates To**: BR-006, UC-4 · P7

**Acceptance Criteria**:

- [ ] Floor evaluation precedes reply generation on every turn (trace test)
- [ ] The floor works with all models disabled and when offline (FR-015)
- [ ] Floor rules and messages carry a recorded clinical approval and version
- [ ] Any critical miss on curated floor cases blocks the release

**Data Requirements**:

- **Inputs**: Every inbound input
- **Outputs**: Floor response; safety event
- **Validations**: Approved floor version in use

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: P7 is non-negotiable.

**Complexity**: HIGH

**Dependencies**: None

**Assumptions**: Clinical approval of floor content available before the pilot

---

#### FR-027: Additive Pack Red Flags and Classifier Alerts

**Description**: Packs add red-flag rules and fixed messages. The runtime merges them so that no pack rule removes or overrides a floor rule. A classifier may raise extra alerts; the result is always the union of rule hits and classifier alerts.

**Relates To**: BR-006 · P7

**Acceptance Criteria**:

- [ ] Tests prove no pack configuration can disable or override a floor rule
- [ ] Tests prove a classifier cannot suppress a rule hit
- [ ] Pack red flags run before normal planning and can suspend planning as the pack defines

**Data Requirements**:

- **Inputs**: Pack safety policy
- **Outputs**: Merged safety rule set
- **Validations**: Merge is additive only

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Packs can raise the floor but never lower it.

**Complexity**: MEDIUM

**Dependencies**: FR-026

**Assumptions**: None

---

#### FR-028: Safety Events and Escalation Routes

**Description**: Record every safety event with its rule version and evidence reference, and route it to human review where the pack defines this. Disclosure of a safety event to anyone other than the participant needs a consent purpose agreed at enrolment (for example a nominated support person) or a documented legal basis (see Conflict C-4).

**Relates To**: BR-003, BR-006, UC-4 · P4, P7

**Acceptance Criteria**:

- [ ] Every escalation route in a pack names its consent purpose or legal basis; a pack without one fails validation
- [ ] At enrolment, the participant is told exactly who may be contacted and when
- [ ] Safety events appear in the participant's own timeline

**Data Requirements**:

- **Inputs**: Safety events, escalation policy
- **Outputs**: Review tasks; disclosure records
- **Validations**: Consent purpose or legal basis present

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Safety and participant ownership must both hold.

**Complexity**: HIGH

**Dependencies**: FR-027, FR-036

**Assumptions**: The legal-basis policy is decided in Phase 0

---

#### FR-029: Prohibited Decisions and Intended-Purpose Gate

**Description**: Enforce each pack's prohibited decisions and intended purpose on every output. The Parkinson's pack makes no diagnosis, severity score or treatment recommendation [CSD-C20]. The mentorship pack makes no performance rating, promotion recommendation or mental-health diagnosis.

**Relates To**: BR-007, BR-009 · P5

**Acceptance Criteria**:

- [ ] Output schemas contain no score, rank, grade or risk-level field about a person unless the regulatory profile permits it
- [ ] Adversarial evaluation (requests outside the intended purpose) produces no prohibited output
- [ ] The companion answers out-of-purpose requests with fixed pack wording

**Data Requirements**:

- **Inputs**: Pack manifest (allowed and prohibited decisions)
- **Outputs**: Gate decisions
- **Validations**: Output schema and wording rules

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Drifting into diagnosis or rating would change the regulatory and ethical position.

**Complexity**: HIGH

**Dependencies**: FR-008

**Assumptions**: None

---

**Group H: Briefs, sharing and exports**

#### FR-030: Deterministic Brief Assembly

**Description**: Briefs and participant summaries are assembled deterministically from the pack's template, confirmed records and evidence links. Every statement carries a resolvable citation, and rendering fails closed on any uncited statement.

**Relates To**: BR-002, BR-004, UC-3 · P3, P5

**Acceptance Criteria**:

- [ ] Given a template section, when the brief is assembled, then every statement links to evidence with provenance
- [ ] Given an uncited statement, then rendering blocks it and logs the event without content
- [ ] The brief separates "not observed", "not reported" and "not asked / not covered" [CSD-C18]
- [ ] Report, pack, rule, prompt, model and algorithm versions are stamped on the output

**Data Requirements**:

- **Inputs**: Template, confirmed records, evidence
- **Outputs**: Brief with version manifest
- **Validations**: Citation resolution; wording rules

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Reports are projections of evidence, not model opinion.

**Complexity**: HIGH

**Dependencies**: FR-017, FR-019

**Assumptions**: None

---

#### FR-031: Quote Shortening and Language Adaptation

**Description**: A model may shorten a quote or adapt its language only under constraint. A shortened quote must be a faithful subsequence of its source with visible elision. Adapted text (plain-language or translated) is marked as adapted and always links to the verbatim original.

**Relates To**: BR-004 · P2, P3

**Acceptance Criteria**:

- [ ] A deterministic check confirms every shortened quote is a subsequence of its source span; failures fall back to the full quote
- [ ] Adapted text is labelled as adapted and shows the original on demand
- [ ] Adapted text never appears in a brief without the participant's approval

**Data Requirements**:

- **Inputs**: Source span
- **Outputs**: Shortened or adapted text with link to the original
- **Validations**: Subsequence check

**Priority**: SHOULD_HAVE (Phase 1)

**Rationale**: Keeps briefs short without losing faithfulness.

**Complexity**: MEDIUM

**Dependencies**: FR-030, FR-046

**Assumptions**: None

---

#### FR-032: Participant Approval Before Sharing

**Description**: The participant reviews, corrects and approves each brief section, evidence item and export for each audience before it is shared. Approval is specific, recorded and revocable for future access. No pack may define a sharing workflow that skips participant approval (see Conflict C-4).

**Relates To**: BR-003, UC-3 · P4

**Acceptance Criteria**:

- [ ] Every outbound path (brief, export, interoperability message, notification) checks for a recorded approval and fails closed without one
- [ ] Approval is per item and per audience; approving one reviewer does not approve another
- [ ] Before approving an export, the participant is told that copies delivered to external systems cannot be recalled

**Data Requirements**:

- **Inputs**: Draft brief, participant decisions
- **Outputs**: Approval records
- **Validations**: Approver is the participant (or their authorised representative, if the pack allows)

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: P4 is non-negotiable.

**Complexity**: MEDIUM

**Dependencies**: FR-030, FR-036

**Assumptions**: Authorised representatives are out of scope for v1 unless a pack requires them

---

#### FR-033: Secure Share Links and Evidence Packs

**Description**: Participants share approved briefs and participant-selected evidence packs (quotes, clips, documents, activity outputs) through time-bound secure links with access logging and optional recipient verification.

**Relates To**: BR-002, UC-3 · P4, P8

**Acceptance Criteria**:

- [ ] Links expire at the time set (proposed default 14 days) and can be revoked at once
- [ ] Every access is logged and visible to the participant
- [ ] Raw media is included only if the participant consented to its upload and selected it
- [ ] Recipient verification (one-time code to a known address) is available per share

**Data Requirements**:

- **Inputs**: Approved content, recipient, expiry
- **Outputs**: Share link; access log
- **Validations**: Approval present; link unguessable

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Reviewers need easy, safe access without accounts in every case.

**Complexity**: MEDIUM

**Dependencies**: FR-032

**Assumptions**: None

---

#### FR-034: Structured Exports Through Pack Interoperability Mapping

**Description**: Approved content can be exported as structured data (for example a clinical document or observations for the Parkinson's pack, a learning-record payload for mentorship, or generic JSON) through the pack's interoperability mapping.

**Relates To**: BR-002 · P1, P4, P15

**Acceptance Criteria**:

- [ ] Exports contain only approved, cited content
- [ ] Mappings live in the pack or a pack extension service, never in the core
- [ ] Each export records destination, content, versions and approval

**Data Requirements**:

- **Inputs**: Approved records
- **Outputs**: Standard payloads
- **Validations**: Payload schema validation for the target standard

**Priority**: SHOULD_HAVE (Phase 1 for the clinical projection)

**Rationale**: Reviewers work in their own systems.

**Complexity**: HIGH

**Dependencies**: FR-010, INT-006, INT-007

**Assumptions**: None

---

#### FR-035: Participant Data Export

**Description**: Participants can export their whole journey (evidence, observations, consents, shares and access log) in machine-readable and human-readable formats.

**Relates To**: BR-003 · P4, P13

**Acceptance Criteria**:

- [ ] Export completes within 24 hours (proposed) and is delivered only to the authenticated participant
- [ ] Export includes provenance and version manifests
- [ ] Memory-derived context held about the participant is included (FR-044)

**Data Requirements**:

- **Inputs**: Journey records
- **Outputs**: JSON bundle plus a readable document
- **Validations**: Completeness check against record counts

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Participant ownership and privacy access rights.

**Complexity**: MEDIUM

**Dependencies**: FR-044

**Assumptions**: None

---

**Group I: Consent**

#### FR-036: Purpose-Based Consent Enforcement

**Description**: Consent grants record purpose, modality, recipient, expiry and the version of the wording shown. The policy engine checks current consent and purpose on every read, write, model call, memory call, share and integration. Revocation stops future use at once and triggers deletion where the purpose requires it.

**Relates To**: BR-003 · P4, P13

**Acceptance Criteria**:

- [ ] Every data access path calls the policy engine; a missing check fails a CI architecture test
- [ ] Revocation blocks new use within 60 seconds (proposed) and schedules any required deletion
- [ ] Consent purposes come from the pack; the core defines only the mechanism
- [ ] Consent history is immutable and viewable by the participant

**Data Requirements**:

- **Inputs**: Consent grants and revocations
- **Outputs**: Policy decisions; consent history
- **Validations**: Purpose exists in the pack's taxonomy

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Privacy and consent are executable platform data.

**Complexity**: HIGH

**Dependencies**: FR-008

**Assumptions**: None

---

**Group J: Organisation and operations**

#### FR-037: Organisation Aggregate Reporting

**Description**: Tenants see programme aggregates (enrolment, activity volume, burden adherence, brief completion) only above the minimum cohort size, with small-cell suppression and no drill-down to individuals.

**Relates To**: BR-011 · P4

**Acceptance Criteria**:

- [ ] Any cell below the minimum cohort size is suppressed, not rounded
- [ ] Filters cannot be combined to narrow a cohort below the minimum (differencing test)
- [ ] No free text or individual content appears in any organisation view

**Data Requirements**:

- **Inputs**: Aggregated metrics
- **Outputs**: Organisation dashboard
- **Validations**: Cohort-size check on every query

**Priority**: SHOULD_HAVE (Phase 2)

**Rationale**: Sponsors need evidence of value without seeing individuals.

**Complexity**: MEDIUM

**Dependencies**: DR-008

**Assumptions**: Minimum cohort size decided in Phase 0

---

#### FR-038: Tenant Administration Without Content Access

**Description**: Tenant administrators manage programmes, invitations, enabled packs and relationships at programme level without any access to participant content.

**Relates To**: BR-003, BR-011 · P4

**Acceptance Criteria**:

- [ ] Administrator roles have no permission that returns participant content (permission matrix test)
- [ ] Administrative actions are audited

**Data Requirements**:

- **Inputs**: Programme configuration
- **Outputs**: Programme records
- **Validations**: Role-based permission checks

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Operating a programme must not require seeing content.

**Complexity**: LOW

**Dependencies**: NFR-SEC-002

**Assumptions**: None

---

#### FR-039: Break-Glass Access

**Description**: Exceptional support access to participant content uses a break-glass workflow: a stated reason, second-person approval, time-boxed access, full audit and alerting.

**Relates To**: BR-003 · P4, P16

**Acceptance Criteria**:

- [ ] Access without approval is impossible; approval expires automatically (proposed maximum 4 hours)
- [ ] Every break-glass session raises an alert and is reviewed
- [ ] (SHOULD) The participant is told that support accessed their content, unless an investigation forbids it

**Data Requirements**:

- **Inputs**: Request, reason, approver
- **Outputs**: Time-boxed grant; audit trail
- **Validations**: Approver differs from requester

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Operators have no routine access to content.

**Complexity**: MEDIUM

**Dependencies**: NFR-C-002

**Assumptions**: None

---

**Group K: Long-term memory**

#### FR-040: Memory Provider Interface and Null Provider

**Description**: Application and pack code use only Cairn's long-term memory interface: retain, recall, observations, mental model, delete, export, and an optional pack-gated reflect. Hindsight is the default adapter; a null provider is always available. Only the adapter may use the provider's SDK.

**Relates To**: BR-010 · P10, P12

**Acceptance Criteria**:

- [ ] A CI dependency check fails if any module other than the memory adapter imports the provider SDK
- [ ] All governed-workflow tests pass with the null provider
- [ ] Memory provider version, provider configuration and pack memory policy version are stamped in the version manifest

**Data Requirements**:

- **Inputs**: Interface calls
- **Outputs**: Provider-neutral results
- **Validations**: Interface contract tests

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Keeps the memory provider replaceable and non-authoritative [CSD-C1].

**Complexity**: MEDIUM

**Dependencies**: INT-003

**Assumptions**: The Phase 0 spike confirms Hindsight for the pilot (A-7)

---

#### FR-041: Memory Isolation and Authorisation

**Description**: There is one memory bank per tenant and journey [CSD-C11]. Bank identifiers are derived server-side from authenticated state, and client-supplied identifiers are rejected. Every retain and recall is preceded by a policy check on actor, participant, journey, purpose, data class, pack and current consent. Provider-side PII filtering is defence in depth only [CSD-C12]. No mobile or web client reaches the memory service directly.

**Relates To**: BR-003, BR-010 · P4, P13, P16

**Acceptance Criteria**:

- [ ] Store-as-A, read-as-B tests across tenants, journeys and domains show zero leakage; any leak blocks release
- [ ] A request that carries a client-supplied bank identifier is rejected
- [ ] Network policy allows only the Cairn memory adapter to reach the memory service

**Data Requirements**:

- **Inputs**: Authenticated context, purpose
- **Outputs**: Authorised memory calls
- **Validations**: Server-derived bank identifier

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Memory inherits the sensitivity of its source and must never weaken its protection.

**Complexity**: HIGH

**Dependencies**: FR-036, NFR-SEC-007

**Assumptions**: None

---

#### FR-042: Retain and Recall Behaviour

**Description**: Retain, asynchronously, only consented projections of confirmed content, with canonical source IDs, occurred-at time, pack version and purpose. Recall runs after the planner has selected the action and supplies context to the companion only. Failure or unavailability does not block the governed workflow [CSD-C8].

**Relates To**: BR-010, UC-2 · P2, P13, P18

**Acceptance Criteria**:

- [ ] Unconfirmed content, and content the pack's memory policy excludes (by default safety events and raw media), is never retained
- [ ] Recall has a time budget (NFR-P-003); on timeout the turn continues without it
- [ ] Every retained item has a memory projection record linking it to canonical IDs

**Data Requirements**:

- **Inputs**: Confirmed content, source IDs, purpose
- **Outputs**: Memory projection records; recalled context
- **Validations**: Consent and memory policy checks

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Long-term context improves conversation without becoming a second truth.

**Complexity**: MEDIUM

**Dependencies**: FR-040, FR-041, DR-009

**Assumptions**: None

---

#### FR-043: Memory Signals Never Govern

**Description**: Recalled memories, provider observations, mental models and reflect outputs never feed the pattern engine, planner, safety evaluation, coverage state or brief content, and in v1 they are never promoted into canonical records [CSD-C31] (see Conflict C-2).

**Relates To**: BR-004, BR-010 · P2, P3

**Acceptance Criteria**:

- [ ] Architecture test: the pattern engine, planner, safety and report modules have no dependency on the memory interface
- [ ] Replay with memory disabled gives identical governed decisions
- [ ] Any memory-derived text shown to the participant meets the citation rules in FR-025

**Data Requirements**:

- **Inputs**: Not applicable (a constraint)
- **Outputs**: Not applicable
- **Validations**: Module dependency rules

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Probabilistic synthesis must not decide or appear as fact.

**Complexity**: MEDIUM

**Dependencies**: FR-040

**Assumptions**: None

---

#### FR-044: Memory Deletion, Export and Transparency

**Description**: When a source record is deleted or its consent revoked, remove the corresponding memories and verify that derived observations and mental models no longer hold the information [CSD-C13]. Deleting a journey deletes its whole bank. If verification fails, rebuild the bank from canonical records. Participants can see, in plain language, the standing context the memory holds about them and delete it. Bank export and import are used only for controlled migration within residency rules.

**Relates To**: BR-003, UC-6 · P13, P14

**Acceptance Criteria**:

- [ ] Deleted sources are absent from recall, observations and mental models within the deletion window (proposed 24 hours)
- [ ] Rebuilding a bank from canonical records is supported and tested
- [ ] The participant can view and delete memory-derived context about them

**Data Requirements**:

- **Inputs**: Deletion or revocation events
- **Outputs**: Deletion verification records
- **Validations**: Post-deletion recall probes

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Deletion must reach every derived copy, including learned summaries.

**Complexity**: HIGH

**Dependencies**: FR-042, DR-006

**Assumptions**: None

---

#### FR-045: Restricted Reflect

**Description**: The provider's reflect capability is off by default. A pack may enable it only for non-governed participant assistance [CSD-C14]. Its output is never shown as a statement about the participant unless every statement cites canonical evidence and passes the FR-030 citation check. Reflect is always disabled for regulated packs and for diagnosis, referral, employment, permission or other prohibited decisions.

**Relates To**: BR-004 · P2, P3, P5

**Acceptance Criteria**:

- [ ] A regulated pack whose manifest enables reflect fails validation
- [ ] Uncited reflect output never reaches a display surface (test)

**Data Requirements**:

- **Inputs**: Participant request, recalled context
- **Outputs**: Cited assistance text
- **Validations**: Citation check

**Priority**: COULD_HAVE (Phase 2)

**Rationale**: Optional assistance must not bypass P2 and P3.

**Complexity**: MEDIUM

**Dependencies**: FR-030, FR-043

**Assumptions**: None

---

**Group L: Model gateway**

#### FR-046: Task-Level Model Gateway

**Description**: Every model call goes through the task-level model gateway: extraction, companion phrasing, quote shortening, embeddings, speech-to-text, and inference the memory provider uses internally. Each task is bound to a named model version hosted in an approved region, and unbound tasks are rejected. Changing a binding is an evaluated release. Model tools, where a pack allows them, are read-only and cannot change permissions, consent, sharing or configuration.

**Relates To**: BR-008, BR-010 · P2, P11, P17, P21

**Acceptance Criteria**:

- [ ] Egress controls block model endpoints except through the gateway (test)
- [ ] The gateway rejects calls for unbound tasks and for bindings outside approved regions
- [ ] The gateway records task, binding, versions, latency, tokens and outcome, never prompt or completion text
- [ ] CI blocks a binding change until the pack evaluation suites pass

**Data Requirements**:

- **Inputs**: Task request with purpose
- **Outputs**: Model response plus metadata
- **Validations**: Binding, region and purpose checks

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: One enforcement point for residency, versioning and evaluation of every model call.

**Complexity**: HIGH

**Dependencies**: INT-001, INT-003

**Assumptions**: Residency-compliant models are available in approved regions for each task (see risk R-3)

---

**Group M: Evaluation and certification**

#### FR-047: Evaluation Harness and Certified Configurations

**Description**: Run pack evaluation suites against an exact certified configuration: cloud, regions, model bindings, speech engine, memory provider version and configuration, pack versions and platform release [CSD-C24]. Suites cover synthetic timelines, extraction labels, safety cases, faithfulness, burden, fairness and accessibility cohorts, adversarial cases and memory tests. Results are stored as certification evidence.

**Relates To**: BR-004, BR-006, BR-012 · P21

**Acceptance Criteria**:

- [ ] Promotion to production is blocked unless every gate passes for that exact configuration
- [ ] The certified configuration registry lists each configuration with its evidence and approver
- [ ] Gates include 100% material-claim coverage, zero critical safety misses, 100% planner replay and zero cross-bank leakage

**Data Requirements**:

- **Inputs**: Evaluation datasets, configuration
- **Outputs**: Evaluation reports; certification records
- **Validations**: Dataset provenance and consent basis

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: Quality evidence applies to a named combination, not to "any cloud, any model".

**Complexity**: HIGH

**Dependencies**: FR-009

**Assumptions**: Evaluation data is synthetic or consented for that purpose

---

**Group N: Reference Domain Packs**

#### FR-048: Reference Pack A: Parkinson's Symptom Capture

**Description**: A patient-held visit-preparation diary. Coverage spans motor and non-motor domains, context (onset, frequency, side) and daily-life impact. Activities include voice and text diary, resting-hands capture, finger tapping, walk and turn, sustained vowel, reading, and optional handwriting or wearable evidence. Outputs are a one-page clinician brief, a patient-selected evidence pack and a clinical interchange projection.

**Relates To**: BR-002, BR-007 · P5, P8, P9

**Acceptance Criteria**:

- [ ] The pack passes contract validation and clinical advisory group review
- [ ] The clinician brief fits one printed page and every statement cites evidence
- [ ] Motor and voice features are computed on the device and not displayed unless the regulatory profile allows it
- [ ] Memory policy: separate bank, mental models limited to communication preferences, reflect disabled
- [ ] The regulatory determination is complete before the pilot (BR-007)

**Data Requirements**:

- **Inputs**: Participant entries, captures, carer contributions
- **Outputs**: Clinician brief, evidence pack, clinical projection
- **Validations**: Pack evaluation suite

**Priority**: MUST_HAVE (Phase 1)

**Rationale**: The first real domain to prove the platform, and the regulated one.

**Complexity**: HIGH

**Dependencies**: FR-008, FR-026, FR-034, INT-006

**Assumptions**: A clinical advisory group is available (A-8)

---

#### FR-049: Reference Pack B: Mentorship

**Description**: Covers goals, competencies, strengths, blockers, concrete examples, agreed actions and reflections. Activities include short reflections, goal reviews, example capture, role-play (descriptive only), meeting preparation, action follow-up, evidence upload and optional feedback requests. Outputs are a mentee progress view, a pre-session mentor brief, a meeting agenda, an evidence portfolio and an end-of-programme summary. Manager and HR access is off by default and there is no hidden scoring.

**Relates To**: BR-001, BR-009 · P1, P4, P5

**Acceptance Criteria**:

- [ ] The pack ships with no core changes (BR-001)
- [ ] Any sharing with managers or HR requires a per-share participant approval (Conflict C-8)
- [ ] Prohibited-decision adversarial tests pass
- [ ] Feedback providers are contributors and see only their own input

**Data Requirements**:

- **Inputs**: Reflections, examples, goals, feedback
- **Outputs**: Mentor brief, progress view, portfolio
- **Validations**: Pack evaluation suite

**Priority**: MUST_HAVE (Phase 2)

**Rationale**: The abstraction proof, and the power-imbalance test case.

**Complexity**: HIGH

**Dependencies**: FR-003, FR-029, INT-007

**Assumptions**: A pilot employer tenant is available for Phase 2

---

## Non-Functional Requirements (NFRs)

### Performance Requirements

#### NFR-P-001: Interaction Responsiveness

**Requirement** (proposed targets):

- Safety floor message shown within 1 second (95th percentile) of input receipt on the server, and within 300 ms on the device
- Voice transcript displayed within 2 seconds (95th percentile) of end of speech
- Companion reply ready within 3 seconds (95th percentile) of a confirmed turn; replies are checked before display, so an immediate acknowledgement is shown while the reply is prepared
- Planner decision within 300 ms (95th percentile); pattern evaluation for a turn within 1 second (95th percentile) for journeys up to 24 months long

**Measurement Method**: Distributed tracing on the server; real-user monitoring on the device; synthetic journeys in pre-production

**Load Conditions**:

- Peak load: 50 concurrent sessions per data plane (pilot); 1,000 per data plane (certified production)
- Average load: 1 turn per second (pilot); 20 turns per second (certified production)
- Data volume: up to 5,000 evidence items per journey

**Priority**: MUST_HAVE (HIGH)

**Rationale**: Slow responses add burden (P6), and safety responses must be immediate (P7).

---

#### NFR-P-002: Timeline, Brief and Share Performance

**Requirement** (proposed targets):

- Timeline view of the latest 90 days loads within 2 seconds (95th percentile)
- Brief assembly within 10 seconds (95th percentile) for journeys up to 24 months and 5,000 evidence items
- Secure share link opens within 3 seconds (95th percentile)

**Measurement Method**: Tracing and synthetic tests against reference journeys

**Priority**: MUST_HAVE (HIGH)

**Rationale**: Reviewers often open briefs minutes before a session.

---

#### NFR-P-003: Memory Recall Budget

**Requirement**: Memory recall completes within 500 ms (95th percentile), with a hard timeout of 1 second after which the turn continues without recalled context. Retain and background consolidation run asynchronously and never add to interactive latency.

**Measurement Method**: Gateway and memory adapter tracing

**Priority**: SHOULD_HAVE (MEDIUM)

**Rationale**: Memory improves phrasing; it must never slow the governed flow.

---

#### NFR-P-004: Throughput

**Requirement**: Sustain 5 turns per second per data plane in the pilot and 100 turns per second per certified production data plane (proposed). Background workloads (memory consolidation, evaluation runs, exports) run in separate worker pools so they cannot starve interactive traffic.

**Scalability**: Horizontal scaling to 3× the Year 2 projection without architectural change

**Priority**: SHOULD_HAVE (MEDIUM)

**Rationale**: Interactive and batch loads must not interfere.

---

#### NFR-P-005: On-Device Efficiency

**Requirement** (proposed targets, validated against a device floor agreed in Phase 0):

- Feature extraction for a 30-second guided capture completes within 10 seconds on reference mid-range devices
- On-device transcription runs at or faster than real time
- A typical daily session of up to 10 minutes uses no more than 3% battery

**Measurement Method**: Device lab testing on the reference device list

**Priority**: SHOULD_HAVE (HIGH)

**Rationale**: P8 only works if on-device processing is practical on participants' own devices.

---

### Availability and Resilience Requirements

#### NFR-A-001: Availability Target

**Requirement**: Participant interaction and sharing achieve 99.5% monthly availability in the pilot and 99.9% in certified production. The safety floor is available whenever the app runs, including offline.

- Maximum planned downtime: 4 hours per month
- Maximum unplanned downtime: 8.8 hours per year (certified production)

**Maintenance Windows**: Outside 07:00–22:00 in the participant's local time zone (AEST/AEDT for Australian tenants)

**Priority**: MUST_HAVE (HIGH)

**Rationale**: Participants engage at unpredictable, sometimes difficult moments.

---

#### NFR-A-002: Disaster Recovery

**RPO (Recovery Point Objective)**: 5 minutes for evidence, consent and approval records; 15 minutes for other canonical data. Memory banks need no RPO because they are rebuilt from canonical records.

**RTO (Recovery Time Objective)**: 8 hours (pilot); 2 hours (certified production) (proposed)

**Backup Requirements**:

- Backup frequency: continuous point-in-time recovery for databases; daily snapshots for object storage
- Backup retention: 35 days, aligned with the deletion window (DR-006)
- Geographic backup location: approved regions only (for Australian tenants, for example a second Australian region)

**Failover Requirements**:

- Automatic failover to secondary region: NO in the pilot (runbook-driven); warm standby in a second approved region for certified production
- Failover time: within the RTO

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: Evidence and consent records are irreplaceable; recovery must stay inside residency (P11).

---

#### NFR-A-003: Graceful Degradation

**Requirement**: The system degrades as follows, and the safety floor never degrades:

- Model gateway unavailable: fixed pack wording; extraction queued
- Memory unavailable: null provider; personalisation degrades, the journey does not [CSD-C34]
- Server transcription unavailable: on-device transcription or text entry
- External integrations unavailable: queued with retry; the participant is told
- Workflow engine interrupted: no loss; on recovery, due asks are re-planned within the burden budget rather than delivered in a flood

**Resilience Patterns Required**:

- [ ] Circuit breaker for external dependencies
- [ ] Retry with exponential backoff
- [ ] Timeout on all network calls
- [ ] Bulkhead isolation for critical resources
- [ ] Graceful degradation with reduced functionality

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: P18; model and memory outages degrade wording only, because decisions never depend on them (P2).

---

#### NFR-A-004: Long-Duration Workflow Durability

**Requirement**: Journeys running 24 months or more keep workflow state across deployments, restarts and regional failover. Chaos tests show zero lost workflow state and no duplicate asks or notifications.

**Priority**: MUST_HAVE (HIGH)

**Rationale**: A lost reminder or duplicated ask breaks trust over a long journey.

---

### Scalability Requirements

#### NFR-S-001: Horizontal Scaling

**Requirement**: Stateless services and workers scale horizontally without code changes.

**Growth Projections** (proposed; to be validated by the business case):

- Year 1: up to 500 participants, 1 tenant, 1 data plane (pilot)
- Year 2: 10,000 active journeys across up to 10 data planes
- Year 3: 50,000 active journeys across up to 30 data planes; largest data plane 20,000 journeys

**Scaling Triggers**: Scale out when CPU exceeds 70%, memory exceeds 80% or queue depth exceeds agreed thresholds; inference capacity is managed through gateway quotas

**Priority**: MUST_HAVE (HIGH)

**Rationale**: Growth comes from more tenants and data planes, not one giant shared system.

---

#### NFR-S-002: Data Volume Scaling

**Requirement**: Support up to 10,000 evidence items and 2 GB of consented uploaded media per journey over 5 years (proposed), with most raw media remaining on devices.

**Data Archival Strategy**: Evidence older than 24 months moves to a lower-cost tier while staying citable; deletion follows DR-006

**Priority**: SHOULD_HAVE (MEDIUM)

**Rationale**: Journeys last years; the evidence behind old citations must stay available.

---

#### NFR-S-003: Data Plane Provisioning at Scale

**Requirement**: The control plane manages at least 50 data planes. Provisioning a new data plane in an existing certified configuration is fully automated and completes within 1 working day (proposed).

**Priority**: SHOULD_HAVE (MEDIUM)

**Rationale**: Per-tenant and regulated data planes (P9) must be cheap to create.

---

### Security Requirements

#### NFR-SEC-001: Authentication

**Requirement**: All users authenticate through OAuth 2.0 / OpenID Connect via an identity adapter (a cloud identity service or federation with the customer's identity provider).

**Multi-Factor Authentication (MFA)**:

- Required for: staff, operators, tenant administrators, pack authors, reviewers with accounts, and every break-glass session
- MFA methods: phishing-resistant authenticators (passkeys, platform authenticators, hardware keys) for staff; SMS codes are not accepted as a staff second factor
- Participants and contributors: passkeys or device biometrics as the default low-friction method; email or SMS codes only for recovery
- External reviewers on share links: recipient verification (FR-033)

**Session Management**:

- Session timeout: 15 minutes of inactivity for staff and administrators; 30 minutes for participant web sessions
- Absolute session timeout: 12 hours; mobile sessions use device-bound refresh tokens that can be revoked remotely
- Re-authentication required for: sharing, exports, consent changes, deletion and break-glass

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: Strong for staff, low-friction for participants (see Conflict C-10).

---

#### NFR-SEC-002: Authorization

**Requirement**: Attribute- and purpose-based access control, deny by default, evaluated on every request using actor, relationship, journey, purpose, data class, consent and pack policy. Services authenticate to each other with workload identities.

**Roles and Permissions**: Participant, contributor, reviewer, programme coordinator, tenant administrator, pack author, clinical safety lead, operator and break-glass operator, as defined in FR-003, FR-037, FR-038 and FR-039. A permission matrix test runs in CI.

**Privilege Elevation**: Only through break-glass (FR-039)

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: Access decisions depend on purpose and consent, not only on role (P4, P13).

---

#### NFR-SEC-003: Data Encryption

**Requirement**:

- Data in transit: TLS 1.2 or higher (1.3 preferred) on every connection, including mutual TLS between services
- Data at rest: AES-256 or equivalent for every store, including backups, object storage, memory banks, workflow history, search and vector indexes, and the on-device store
- Key management: cloud key management through an adapter; keys scoped per tenant for Restricted data; separate keys for each regulated pack; a customer-managed key option

**Encryption Scope**:

- [ ] Database encryption at rest
- [ ] Backup encryption
- [ ] File storage encryption
- [ ] Application-level field encryption for direct identifiers
- [ ] Application-level encryption of workflow payloads (FR-024)

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: P16; Restricted data about people at vulnerable moments.

---

#### NFR-SEC-004: Secrets Management

**Requirement**: No secrets (API keys, passwords, certificates) in code, configuration files or pack bundles. Secret scanning runs in CI.

**Secrets Storage**: The cloud's managed secrets service, reached through an adapter

**Secrets Rotation**: Automatic rotation at least every 90 days, and immediately after any suspected exposure

**Priority**: MUST_HAVE (HIGH)

**Rationale**: P16.

---

#### NFR-SEC-005: Vulnerability Management

**Requirement**:

- Dependency and container scanning in CI/CD (no unresolved critical or high findings at release)
- Static application security testing (SAST)
- Dynamic application security testing (DAST)
- Penetration testing: annually, and before each new certified configuration goes live, by an external team; includes the mobile apps and model-facing paths

**Remediation SLA**:

- Critical vulnerabilities: 48 hours where an exploit exists, otherwise 7 days
- High vulnerabilities: 14 days
- Medium vulnerabilities: 30 days
- Regulated deployments receive fixes through a fast-track path in their own change control, never around it (P9)

**Priority**: MUST_HAVE (HIGH)

**Rationale**: P16, P22.

---

#### NFR-SEC-006: AI and Prompt-Injection Security

**Requirement**: Participant, contributor, document and recalled-memory content is always passed to models as data, never as instructions. Model outputs are schema-validated. Model tools are bounded and read-only, and no model can alter permissions, consent, sharing or configuration. Adversarial evaluation covers prompt injection through uploaded documents, contributor input and memory poisoning; the release gate is zero permission escalation and zero prohibited actions.

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: Language models are exposed to untrusted content on every turn.

---

#### NFR-SEC-007: Tenant, Journey and Pack Isolation Testing

**Requirement**: Automated store-as-A, read-as-B tests across tenants, journeys, packs and data planes cover databases, object storage, memory banks, search and vector indexes, caches, workflow history and logs [CSD-C27]. The tests run in CI and before every certified release; any leak blocks the release.

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: Isolation is a core promise to participants and to regulated packs.

---

#### NFR-SEC-008: Supply Chain Integrity

**Requirement**: Packs and deployment artefacts are signed and verified at load and deploy time. Each release produces a software bill of materials and provenance attestations, and dependencies are pinned. Regulated packs keep a SOUP register covering models, speech engines, the memory provider, the workflow engine, libraries and base images.

**Priority**: MUST_HAVE (HIGH)

**Rationale**: P9, P22.

---

#### NFR-SEC-009: Mobile App Security

**Requirement**: The on-device store is encrypted with platform-protected keys. App attestation is used where the platform supports it. Remote session revocation wipes local data. Push notifications and previews carry no content. Sensitive screens are masked in the app switcher. A compromised device (rooted or jailbroken) is treated as a risk signal that limits sharing and export.

**Priority**: MUST_HAVE (HIGH)

**Rationale**: The device holds raw media and offline entries (P8).

---

### Compliance and Regulatory Requirements

#### NFR-C-001: Data Privacy Compliance

**Applicable Regulations** (Australian tenants; applicability to be confirmed by legal counsel):

- Privacy Act 1988 (Cth) and the Australian Privacy Principles. Health information is sensitive information. The most relevant principles are APP 1 (open management), APP 3 (collection of sensitive information with consent), APP 5 (notification), APP 6 (use and disclosure), APP 8 (cross-border disclosure), APP 11 (security and destruction), APP 12 (access) and APP 13 (correction)
- The Notifiable Data Breaches scheme
- State and territory health records legislation where a tenant is covered (for example Victoria, New South Wales and the ACT)
- The Privacy and Other Legislation Amendment Act 2024: assess the automated decision-making transparency obligations (commencing December 2026) against the planner and pattern engine
- Tenant-specific regimes outside Australia (for example GDPR) where a tenant operates there

**Compliance Requirements**:

- [ ] Participant access, correction, deletion and portability (FR-018, FR-035, FR-044)
- [ ] Consent management and audit trail (FR-036)
- [ ] Privacy by design and by default (P13)
- [ ] Suspected breaches triaged within 24 hours and assessed within 30 days; notification runbook in place
- [ ] Privacy impact assessment for the core and for each pack before its pilot

**Data Residency**: The tenant's approved regions, Australia by default (NFR-C-004)

**Data Retention**: Per consent purpose and pack (DR-006)

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: Cairn holds sensitive personal and health information.

---

#### NFR-C-002: Audit Logging

**Requirement**: A tamper-evident audit trail for authentication, authorisation decisions on Restricted data, consent changes, approvals, shares and accesses, exports, deletions, break-glass sessions, pack lifecycle transitions, model binding changes, configuration changes and safety events (metadata only).

**Audit Log Contents** (for sensitive operations):

- Who: user or service identity
- What: action performed
- When: timestamp (UTC, millisecond precision)
- Where: system component and data plane
- Why: purpose, request ID, relationship or consent reference
- Result: success or failure, plus versions for decisions

**Log Retention**: 7 years (proposed), or longer where a pack's obligations require it; logs contain no participant content

**Log Integrity**: Hash-chained or write-once storage in approved regions

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: Participants, tenants and regulators must be able to see who did what and why.

---

#### NFR-C-003: Regulatory and Assurance Reporting

**Requirement**: Generate reports that demonstrate compliance without exposing content.

**Report Types**:

- Residency attestation: monthly per data plane (resources, regions, model bindings, policy compliance) for the tenant and privacy officer
- Participant access report: on demand, for the participant
- Certification evidence pack: per certified configuration (evaluation results, SOUP register, software bill of materials, approvals) for the clinical safety lead and auditors
- Consent and disclosure summary: quarterly, aggregate, per tenant
- Safety event summary: monthly, pseudonymised, per pack, for clinical safety review

**Priority**: SHOULD_HAVE (HIGH)

**Rationale**: Assurance must be demonstrable, not asserted.

---

#### NFR-C-004: Residency Enforcement

**Requirement**: All data stores, backups, logs, telemetry, workflow history, memory banks and model inference stay in the tenant's approved regions. Participant content, evidence and model prompts stay in the tenant data plane [CSD-C23]. Enforcement is by cloud policy that denies resources outside approved regions, infrastructure checks in CI, model gateway binding checks and egress controls. Provider features that could route inference outside the approved regions are disabled and blocked. An approved region set may contain several regions in one jurisdiction (for example two Australian regions), and routing within that set is allowed. The control plane holds no participant content.

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: P11 is non-negotiable.

---

#### NFR-C-005: Regulated Pack Assurance

**Requirement**: Before the Parkinson's pilot, document the pack's intended purpose and its classification under Australian therapeutic goods regulation for software. If the pack is, or may become, a medical device, apply:

- A software lifecycle aligned with IEC 62304
- Risk management aligned with ISO 14971
- Health software product safety aligned with IEC 82304-1
- A quality management system proportionate to the device class (for example ISO 13485)
- A clinical safety case, SOUP register, pinned validated core release and pack-level change control

The intended-purpose gate (FR-029) applies to features, wording, reports and model behaviour.

**Priority**: MUST_HAVE (CRITICAL)

**Rationale**: The regulatory position must be set deliberately, not reached by drift (P9).

---

#### NFR-C-006: Responsible AI Governance

**Requirement**: Align with Australia's AI Ethics Principles and current Australian Government guidance on safe and responsible AI adoption. For each model binding, record the task, model version, evaluation results and known limitations. Tell participants plainly where AI is used (phrasing, extraction, memory) and that decisions are made by rules. Human oversight comes through reviewers and clinical safety review, and fairness and accessibility are evaluated by cohort (FR-047).

**Priority**: MUST_HAVE (HIGH)

**Rationale**: Transparency about AI use supports trust and meets emerging obligations.

---

### Usability Requirements

#### NFR-U-001: User Experience

**Requirement**: The participant experience must be usable by people with low technical proficiency, fatigue or motor symptoms.

**UX Standards**:

- Consistent with the Cairn design system (to be created)
- Accessibility: WCAG 2.2 Level AA compliance
- Mobile responsive design
- Browser support: the latest two versions of Chrome, Safari, Edge and Firefox; mobile operating system support defined by the device floor agreed in Phase 0
- Plain-language content at or below a Year 8 reading level by default (proposed)
- A voice option for every participant task, one-step correction and undo
- Touch targets of at least 48 × 48 dp in the participant app, well above the WCAG minimum, because of tremor
- (proposed) System Usability Scale score of 75 or more with representative participants, including people living with Parkinson's

**User Onboarding**: Guided, skippable onboarding of 10 minutes or less; contextual help

**Priority**: MUST_HAVE (HIGH)

**Rationale**: P6 and P19; the people who most need the product face the most barriers.

---

#### NFR-U-002: Accessibility

**Requirement**: WCAG 2.2 Level AA compliance across the participant, contributor and reviewer experiences.

**Accessibility Features**:

- [ ] Keyboard navigation for all functions
- [ ] Screen reader compatibility (VoiceOver and TalkBack)
- [ ] High contrast mode
- [ ] Adjustable font sizes (platform dynamic type)
- [ ] Alt text for images
- [ ] Captions for video and audio
- [ ] Tremor-tolerant interaction: no precise drags or time-limited gestures
- [ ] Speech recognition evaluated on representative voices, including soft or slurred speech; word error rate target set per pack (proposed 15% or lower on the Parkinson's evaluation set), with correction always available

**Testing**: Automated accessibility testing in CI/CD, manual testing with assistive technologies, and sessions with participants with disability

**Priority**: MUST_HAVE (HIGH)

**Rationale**: P19; voice is the main input for people who struggle to type.

---

#### NFR-U-003: Localization and Internationalization

**Requirement**: English (Australia) at launch; further languages supplied by packs.

**Localization Scope**:

- [ ] UI text translation (core and pack wording)
- [ ] Date/time format per locale, including Australian time zones and daylight saving
- [ ] Currency formatting (not currently used)
- [ ] Number and unit formatting
- [ ] Right-to-left (RTL) languages (Phase 4)

Safety floor messages are localised only by the core, with clinical approval; packs cannot reword them.

**Priority**: SHOULD_HAVE (MEDIUM)

**Rationale**: Language barriers increase burden and risk.

---

### Maintainability and Supportability Requirements

#### NFR-M-001: Observability Without Content

**Requirement**: Instrument every component for monitoring and troubleshooting, and keep participant content and direct identifiers out of telemetry (P17; see Conflict C-9).

**Telemetry Requirements**:

- **Logging**: Structured logs with correlation IDs and pseudonymous identifiers only, aggregated in-region
- **Metrics**: Request rate, errors and duration for every service; business measures such as asks sent, budget deferrals and briefs approved
- **Tracing**: Distributed tracing across app, rules runtime, planner, model gateway, memory adapter and workflows
- **Dashboards**: Real-time operational dashboards per data plane
- **Alerts**: Alerts based on service level objectives, each with a runbook. Objectives cover floor latency, turn latency, brief assembly, deletion completion and workflow lag

Model gateway telemetry never includes prompt or completion text. Automated scanning of telemetry detects content and identifiers and raises an alert.

**Log Levels**: DEBUG, INFO, WARN, ERROR, FATAL; DEBUG is disabled in production data planes

**Priority**: MUST_HAVE (HIGH)

**Rationale**: We cannot operate what we cannot see, but telemetry is a common leak path.

---

#### NFR-M-002: Documentation

**Requirement**: Documentation for operators, developers, pack authors and participants.

**Documentation Types**:

- [ ] Architecture documentation (C4 model)
- [ ] API documentation (OpenAPI 3.1 and AsyncAPI specifications)
- [ ] Pack contract specification and authoring guide
- [ ] Architecture Decision Records, including the Kubernetes portability boundary and the Australian default region
- [ ] Runbooks for operational procedures
- [ ] Troubleshooting guides
- [ ] Plain-language participant guide to how Cairn works and where AI is used
- [ ] Admin guides

**Documentation Format**: Markdown in the repository

**Documentation Currency**: Updated within 10 working days of a change; the pack contract specification is updated with every core release

**Priority**: MUST_HAVE (MEDIUM)

**Rationale**: Pack authors and regulated-pack auditors depend on accurate contracts.

---

#### NFR-M-003: Operational Runbooks

**Requirement**: Runbooks for common operational tasks and incident response.

**Runbook Coverage**:

- [ ] Deployment procedures
- [ ] Rollback procedures
- [ ] Backup and restore procedures
- [ ] Incident response for common failure modes
- [ ] Scaling procedures
- [ ] Disaster recovery procedures
- [ ] Safety floor incident (suspected miss or wrong message)
- [ ] Residency policy violation
- [ ] Suspected cross-tenant or cross-journey leak
- [ ] Memory deletion verification failure and bank rebuild
- [ ] Model provider or speech engine outage
- [ ] Break-glass review

**Priority**: MUST_HAVE (HIGH)

**Rationale**: The incidents that matter most here are safety, privacy and residency incidents.

---

#### NFR-M-004: Domain-Free Core and Dependency Rules

**Requirement**: CI enforces the architecture's structural rules: a domain-vocabulary deny-list lint on core code; a check that core and pack modules import no cloud SDK; provider SDKs only inside adapters; and module dependency rules within the modular monolith [CSD-C6]. For example, the planner, pattern engine, safety and report modules may not depend on the memory interface or call the model gateway.

**Priority**: MUST_HAVE (HIGH)

**Rationale**: P1, P2, P10; boundaries erode unless machines check them.

---

#### NFR-M-005: Everything as Code and Drift Detection

**Requirement**: Infrastructure, cloud policy, residency controls, packs, rules, prompts, model bindings and certified configurations are defined as code and deployed through pipelines. There are no manual production changes, and drift raises an alert within 1 hour.

**Priority**: MUST_HAVE (HIGH)

**Rationale**: P20; certified configurations must be reproducible.

---

#### NFR-M-006: Evaluation-Gated Delivery

**Requirement**: Pipelines run unit, contract, end-to-end, replay, floor regression, isolation and pack evaluation suites and block on failure. Model binding changes and memory provider upgrades pass the same gates as code [CSD-C15]. Shared data planes can release at least weekly; regulated data planes release through their own change control. Rollback is tested for every release.

**Priority**: MUST_HAVE (HIGH)

**Rationale**: P21, P22.

---

### Portability and Interoperability Requirements

#### NFR-I-001: API Standards

**Requirement**: Synchronous APIs follow OpenAPI 3.1; events are specified with AsyncAPI.

**API Design Principles**:

- Resource-oriented design with standard HTTP methods
- JSON request and response format
- Major version in the path (for example /v1/); minor versions are additive only
- Consistent error format (RFC 9457 problem details)
- At least 6 months' notice before a deprecated version is removed; the pack contract uses semantic versioning

**Priority**: MUST_HAVE (HIGH)

**Rationale**: P15; packs, adapters and clients evolve independently.

---

#### NFR-I-002: Integration Capabilities

**Requirement**: The integration gateway supports external systems through tenant-approved connectors, and every outbound flow checks participant approval.

**Integration Patterns**:

- [ ] RESTful API integration
- [ ] Event-driven integration (pub/sub) behind an internal event abstraction
- [ ] File-based integration (secure file export)
- [ ] Database replication (not permitted across system boundaries)
- [ ] Signed webhooks for notifications

**Integration SLA**: 99% of queued outbound messages delivered within 5 minutes; failures retried with backoff and moved to a dead-letter queue with alerting

**Priority**: SHOULD_HAVE (MEDIUM)

**Rationale**: Reviewers and programmes use their own systems.

---

#### NFR-I-003: Data Portability

**Requirement**: Participants can export their data (FR-035), and tenants can export programme configuration and, with participants' authority, journeys when they leave.

**Export Formats**: JSON (machine-readable) and PDF (human-readable); standard clinical or learning-record formats through pack mappings

**Export Scope**: A complete journey export or a selected export

**Import Capability**: Journey and memory bank import between data planes for controlled migration, within residency rules

**Priority**: MUST_HAVE (HIGH)

**Rationale**: Participant ownership and tenant exit.

---

#### NFR-I-004: Cloud Portability

**Requirement**: The same core artefacts deploy to AWS, Azure and Google Cloud through certified configurations, with Kubernetes as the portability boundary (P10) and every cloud service behind an adapter. Each deployment has one cloud data path [CSD-C36]. The Phase 3 portability test deploys to a second cloud with adapter and configuration changes only. Running core workloads outside Kubernetes (for example serverless containers) needs an approved exception (see Conflict C-7) [CSD-C25].

**Priority**: MUST_HAVE (HIGH)

**Rationale**: Buyers choose clouds; the product must not fork.

---

## Integration Requirements

### External System Integrations

#### INT-001: Integration with Model Providers (through the Model Gateway)

**Purpose**: Language model inference for extraction, companion phrasing, quote shortening and embeddings.

**Integration Type**: Real-time API

**Data Exchanged**:

- **From Cairn to provider**: Task prompts containing confirmed participant content (Restricted), per request
- **From provider to Cairn**: Completions and embeddings

**Integration Pattern**: Request/response through the model gateway, one binding per task, with a provider adapter per certified configuration (for example Amazon Bedrock, Azure AI Foundry, Vertex AI or in-cluster models). Provider-side content logging is disabled, and contracts prohibit training on Cairn data.

**Authentication**: Workload identity over private endpoints

**Error Handling**: Timeout, one retry, circuit breaker; fixed pack wording for replies; extraction queued

**SLA**: Latency within NFR-P-001; inference only in approved regions

**Owner**: Platform team; certified configuration owner

**Priority**: CRITICAL

---

#### INT-002: Integration with Speech-to-Text Engines

**Purpose**: Transcription of voice turns.

**Integration Type**: On-device library (default); real-time API (consented server path)

**Data Exchanged**:

- **From Cairn to engine**: Audio, only on the server path under the transcription consent purpose
- **From engine to Cairn**: Transcript with word timings

**Integration Pattern**: On-device engine by default. The server path uses a self-hosted in-cluster engine or a cloud speech service in an approved region, through the gateway. Server audio is deleted after the transcript is confirmed.

**Authentication**: Workload identity

**Error Handling**: Fall back to text entry; the participant is told

**SLA**: Word error rate within the pack target (NFR-U-002)

**Owner**: Platform team; the pack owner validates accuracy for the pack's population

**Priority**: HIGH

---

#### INT-003: Integration with the Long-Term Memory Provider (Hindsight)

**Purpose**: Journey-scoped recall, observations and mental models for conversational continuity.

**Integration Type**: Real-time API (recall); asynchronous (retain, consolidation)

**Data Exchanged**:

- **From Cairn to provider**: Consented projections of confirmed content with canonical source IDs and pack metadata
- **From provider to Cairn**: Recalled context, observations and mental models

**Integration Pattern**: Self-hosted inside each data plane on Kubernetes with PostgreSQL and a vector extension [CSD-C35], reached only by the Cairn memory adapter. The provider's own language model and embedding calls are configured to use the Cairn model gateway or in-cluster models, and all other egress is blocked (P11). The version is pinned per certified configuration.

**Authentication**: Service identity; network policy

**Error Handling**: Null provider fallback; idempotent retain retries; deletion verification with bank rebuild on failure

**SLA**: NFR-P-003; deletion within the window in FR-044

**Owner**: Platform team

**Priority**: HIGH

---

#### INT-004: Integration with the Durable Workflow Engine (Temporal)

**Purpose**: Waits, reminders, reviews, escalations and multi-step activities over months [CSD-C22].

**Integration Type**: Event-driven workflow orchestration

**Data Exchanged**:

- **From Cairn to engine**: Workflow state and payloads, encrypted by Cairn with tenant-held keys so the engine never holds plaintext participant content
- **From engine to Cairn**: Scheduled activity executions

**Integration Pattern**: Self-hosted in the data plane. A managed service is permitted only in an approved region, with client-side payload encryption and contractual approval.

**Authentication**: Mutual TLS; a separate namespace per data plane

**Error Handling**: Durable retries; workflow versioning

**SLA**: NFR-A-004

**Owner**: Platform team

**Priority**: CRITICAL

---

#### INT-005: Integration with Identity Providers

**Purpose**: Authentication for participants, contributors, reviewers and staff, including federation with customer identity providers (health services, employers).

**Integration Type**: Real-time API

**Data Exchanged**:

- **From Cairn to identity provider**: Authentication requests
- **From identity provider to Cairn**: Identity claims (no content)

**Integration Pattern**: OpenID Connect / OAuth 2.0 through an identity adapter; SAML through a broker where a customer requires it

**Authentication**: OpenID Connect

**Error Handling**: Alternative sign-in methods; lockout and recovery policies

**SLA**: 99.9% availability

**Owner**: Platform team; tenant identity owner for federation

**Priority**: CRITICAL

---

#### INT-006: Integration with Clinical Systems (Parkinson's Pack)

**Purpose**: Deliver participant-approved briefs and observations into clinicians' systems.

**Integration Type**: Real-time API or secure messaging

**Data Exchanged**:

- **From Cairn to clinical system**: A participant-approved clinical document and observations as FHIR R4 resources conforming to AU Core, coded with SNOMED CT-AU and AMT where applicable, or delivered through secure clinical document exchange
- **From clinical system to Cairn**: Nothing in v1

**Integration Pattern**: Pack extension service (FR-010)

**Authentication**: As the receiving system requires (for example mutual TLS or OAuth 2.0 client credentials)

**Error Handling**: Queue and retry; the participant is told if delivery fails

**SLA**: 99% delivered within 15 minutes

**Owner**: Parkinson's pack owner

**Priority**: MEDIUM (the secure link in FR-033 is the primary Phase 1 channel)

---

#### INT-007: Integration with Enterprise Learning and HR Systems (Mentorship Pack)

**Purpose**: Import competency frameworks and session dates, bring in participant-selected documents, and export participant-approved summaries.

**Integration Type**: Real-time API through tenant-approved connectors

**Data Exchanged**:

- **From Cairn to enterprise systems**: Participant-approved summaries or learning records only; never an automatic performance-system feed
- **From enterprise systems to Cairn**: Competency catalogue, calendar events, participant-selected documents

**Integration Pattern**: Pack extension service; HR system connectors are off by default

**Authentication**: OAuth 2.0 with tenant consent

**Error Handling**: Retry with backoff; failures shown to the participant

**SLA**: 99% of approved exports delivered within 15 minutes

**Owner**: Mentorship pack owner; tenant system owner

**Priority**: LOW (Phase 2)

---

#### INT-008: Generic Outbound Integration

**Purpose**: Tenant-specific integrations without custom core code.

**Integration Type**: Webhooks, REST, event streams, secure file export and signed evidence links

**Data Exchanged**:

- **From Cairn to tenant systems**: Approved content only; event notifications carry no content
- **From tenant systems to Cairn**: Acknowledgements

**Integration Pattern**: Pub/sub and request/response through the integration gateway

**Authentication**: Signed webhooks or mutual TLS

**Error Handling**: Retry, dead-letter queue, alert

**SLA**: NFR-I-002

**Owner**: Platform team

**Priority**: MEDIUM

---

#### INT-009: Integration with Notification Channels

**Purpose**: Reminders, invitations and share notifications by push, email and SMS.

**Integration Type**: Real-time API

**Data Exchanged**:

- **From Cairn to channel provider**: Content-free messages ("You have a new message in Cairn"). They never include participant content or a pack name that would reveal a health condition or programme.
- **From channel provider to Cairn**: Delivery receipts

**Integration Pattern**: Provider adapters. Contact details are personal information, so providers are engaged as processors in approved regions, or the cross-border disclosure is assessed (APP 8).

**Authentication**: API credentials from the secrets service

**Error Handling**: Retry; fall back to an in-app notice

**SLA**: 95% delivered within 1 minute

**Owner**: Platform team

**Priority**: HIGH

---

#### INT-010: Integration with Cloud Platform Services

**Purpose**: Object storage, key management, secrets, event bus, container registry and observability backends.

**Integration Type**: Platform APIs through adapters

**Data Exchanged**:

- **From Cairn to cloud services**: Encrypted objects, keys, secrets, telemetry without content
- **From cloud services to Cairn**: Objects, key operations, alerts

**Integration Pattern**: One adapter per service per cloud profile (for example object storage, key management and secrets on AWS, Azure or Google Cloud); core code never imports a cloud SDK

**Authentication**: Workload identity

**Error Handling**: Timeouts, retries, circuit breakers

**SLA**: As offered by the provider in approved regions

**Owner**: Platform team

**Priority**: CRITICAL

---

#### INT-011: Control Plane to Data Plane

**Purpose**: Tenant metadata, pack catalogue, certified configuration registry, deployment versions and licensing.

**Integration Type**: Pull-based API, initiated by the data plane

**Data Exchanged**:

- **From control plane to data plane**: Signed packs, configuration and release metadata
- **From data plane to control plane**: Operational health and aggregate usage metrics without content

**Integration Pattern**: Each data plane pulls from the control plane, so the control plane cannot reach into participant data

**Authentication**: Mutual TLS with a separate identity for each data plane

**Error Handling**: Data planes keep running on their last known good configuration

**SLA**: Control plane unavailability never interrupts participant journeys

**Owner**: Platform team

**Priority**: HIGH

---

#### INT-012: Integration with Device Health Platforms

**Purpose**: Optional, pack-driven import of device data (for example activity or sleep) as evidence.

**Integration Type**: On-device platform APIs

**Data Exchanged**:

- **From device platform to Cairn**: Derived features only, under an explicit consent purpose
- **From Cairn to device platform**: Nothing

**Integration Pattern**: Native mobile modules; processing on the device (P8)

**Authentication**: Platform permission prompts

**Error Handling**: Skip the capture if permission is denied

**SLA**: Not applicable

**Owner**: Pack owner

**Priority**: LOW (Phase 2 or later)

---

## Data Requirements

### Data Entities

The design's core model is intentionally generic; domain meaning comes from the pack. The catalogue below lists every core entity. Four governance-critical entities are detailed afterwards; the full model will be produced by `/arckit:data-model`.

| Entity | Purpose | Classification | Retention |
|--------|---------|----------------|-----------|
| Tenant | Customer or operating boundary; owns configuration and residency policy | Confidential | Contract term + 7 years |
| Participant | Person undertaking one or more journeys | Confidential | While any journey or legal hold exists |
| Relationship | Contributor or reviewer link with role, scope, rights and expiry | Confidential | Journey lifetime + DR-006 |
| Journey | Long-duration instance bound to one pack version | Restricted | DR-006 |
| Goal | Participant-selected or pack-defined outcome | Restricted | DR-006 |
| JourneyEvent | Something that happened or was reported | Restricted | DR-006 |
| Observation | Structured extraction of an event, citing spans | Restricted | DR-006 |
| Evidence | Verbatim text, capture, document, contribution or external record | Restricted | DR-006 |
| DerivedFeature | Algorithm output with version and quality | Restricted | DR-006 |
| Baseline | Participant-specific reference state | Restricted | DR-006 |
| CoverageItem | Pack-defined topic state with history | Restricted | DR-006 |
| PatternDefinition / PatternEvaluation | Versioned rule and its execution record | Internal / Restricted | Pack lifetime / DR-006 |
| Activity / ActivityAttempt | Guided task and a participant's attempt | Internal / Restricted | Pack lifetime / DR-006 |
| NextAction | Planner decision with candidates and reasons | Restricted | DR-006 |
| Report (Brief) | Evidence-backed projection for one audience | Restricted | DR-006 |
| Approval and Share | Participant approval per item and audience; share links and access log | Confidential | Journey lifetime + 7 years |
| ConsentGrant | Purpose, modality, recipient, expiry, revocation | Confidential | Journey lifetime + 7 years |
| SafetyEvent | Floor or red-flag hit with rule version | Restricted | Per pack regulatory profile |
| VersionManifest (Provenance) | Versions and actors behind an output | Internal | While any referencing output exists |
| DomainPackVersion | Immutable pack bundle and certification metadata | Internal | Permanent (audit and replay) |
| MemoryProjection | Link from a memory item to canonical records | Restricted | Until source deletion is verified |
| AuditEvent | Security and compliance audit record | Confidential | 7 years (NFR-C-002) |

---

#### Entity 1: Evidence

**Description**: An immutable item of evidence: an utterance span, capture, document, contribution or external record.

**Attributes**:

| Attribute | Type | Required | Description | Constraints |
|-----------|------|----------|-------------|-------------|
| evidence_id | UUID | Yes | Unique identifier | Primary key |
| journey_id | UUID | Yes | Owning journey | Foreign key; partition key |
| kind | Enum | Yes | Evidence type | ['utterance', 'capture', 'document', 'contribution', 'external_record'] |
| content_ref | String | Yes | Pointer to encrypted text or object | Not null |
| span_index | JSON | No | Offsets for citable spans | Valid offsets within content |
| confirmed_at | Timestamp | No | When the participant confirmed it | Null until confirmed |
| occurred_at | Period | Yes | When it happened; may be approximate | Includes precision |
| recorded_at | Timestamp | Yes | When Cairn received it | Indexed |
| author_type | Enum | Yes | Who produced it | ['participant', 'contributor', 'system', 'external'] |
| author_id | UUID | Yes | Producing actor | Foreign key |
| supersedes_id | UUID | No | Item this corrects | Foreign key to Evidence |
| consent_purposes | UUID[] | Yes | Purposes allowing its use | At least one |
| classification | Enum | Yes | Data class (DR-004) | Restricted tiers only |
| manifest_id | UUID | Yes | Version manifest | Foreign key |
| integrity_hash | String | Yes | Hash-chain value | Verified daily |

**Relationships**:

- Many-to-one with Journey via journey_id
- Many-to-many with Observation and Report via citation links
- Self-reference via supersedes_id

**Data Volume**: Up to 10,000 items per journey over 5 years; about 100 million rows by Year 3 (proposed)

**Access Patterns**: By journey and time range; by citation ID; by coverage topic

**Data Classification**: RESTRICTED

**Data Retention**: DR-006

---

#### Entity 2: ConsentGrant

**Description**: A participant's grant of consent for one purpose, with its full history.

**Attributes**:

| Attribute | Type | Required | Description | Constraints |
|-----------|------|----------|-------------|-------------|
| consent_id | UUID | Yes | Unique identifier | Primary key |
| participant_id | UUID | Yes | Grantor | Foreign key |
| journey_id | UUID | Yes | Scope | Foreign key |
| purpose_code | String | Yes | Purpose from the pack's taxonomy | Must exist in the pack |
| modality | Enum | Yes | Data modality covered | ['text', 'audio', 'video', 'image', 'document', 'derived_features', 'any'] |
| recipient_scope | JSON | No | Recipients covered | Relationship IDs or roles |
| granted_at | Timestamp | Yes | Grant time | Not null |
| expires_at | Timestamp | No | Expiry | After granted_at |
| revoked_at | Timestamp | No | Revocation time | Immutable once set |
| wording_version | String | Yes | Version of the consent text shown | Not null |
| pack_version | String | Yes | Pack version at grant | Not null |

**Relationships**:

- Many-to-one with Participant and Journey
- Referenced by Evidence, MemoryProjection and Share

**Data Volume**: About 20 grants per journey

**Access Patterns**: Checked on every access by participant, journey and purpose (cached with immediate invalidation on revocation)

**Data Classification**: CONFIDENTIAL

**Data Retention**: Journey lifetime + 7 years, as proof of consent

---

#### Entity 3: VersionManifest

**Description**: The exact versions behind a material output (P12).

**Attributes**:

| Attribute | Type | Required | Description | Constraints |
|-----------|------|----------|-------------|-------------|
| manifest_id | UUID | Yes | Unique identifier | Content-addressed hash |
| core_release | String | Yes | Core release | Semantic version |
| pack_version | String | Yes | Pack ID and version | Registered pack |
| rule_versions | JSON | No | Rules evaluated | Registered versions |
| prompt_versions | JSON | No | Prompts used | Registered versions |
| model_bindings | JSON | No | Task to model version and region | Approved regions only |
| speech_engine | String | No | Engine and version | Registered |
| algorithm_versions | JSON | No | Feature algorithms used | Registered |
| memory_provider | String | No | Provider, version and memory policy version | Registered |
| workflow_version | String | No | Workflow definition version | Registered |
| certified_configuration | String | Yes | Certified configuration ID | Registered |

**Relationships**:

- One-to-many with every material output

**Data Volume**: Low (deduplicated by content hash)

**Access Patterns**: Joined when replaying or auditing an output

**Data Classification**: INTERNAL

**Data Retention**: While any referencing output exists

---

#### Entity 4: MemoryProjection

**Description**: Links a memory provider item back to canonical records so that deletion and provenance can be enforced.

**Attributes**:

| Attribute | Type | Required | Description | Constraints |
|-----------|------|----------|-------------|-------------|
| projection_id | UUID | Yes | Unique identifier | Primary key |
| journey_id | UUID | Yes | Owning journey | Foreign key |
| bank_id | String | Yes | Memory bank | Derived server-side from tenant and journey |
| provider_item_ref | String | Yes | Provider's identifier for the memory | Not null |
| source_refs | UUID[] | Yes | Canonical evidence and event IDs | At least one |
| purpose_code | String | Yes | Consent purpose | Must be granted |
| pack_version | String | Yes | Pack version at retain | Not null |
| retained_at | Timestamp | Yes | Retain time | Not null |
| retention_state | Enum | Yes | Lifecycle | ['active', 'deletion_requested', 'deleted', 'verified'] |
| verified_at | Timestamp | No | Deletion verification time | Set when verified |

**Relationships**:

- Many-to-many with Evidence via source_refs

**Data Volume**: Roughly one per confirmed turn

**Access Patterns**: By source ID when deleting; by journey when rebuilding

**Data Classification**: RESTRICTED (inherits from source)

**Data Retention**: Until deletion of all sources is verified

---

### Data Requirements Detail

#### DR-001: Canonical System of Record

**Requirement**: Cairn's relational domain store and evidence store are the only system of record for journeys, evidence, consent, patterns, decisions and reports. The memory provider, search and vector indexes, caches and analytics are projections that can be rebuilt from canonical records [CSD-C1].

**Acceptance Criteria**: A full rebuild of every projection from canonical records succeeds in a test environment; no governed module reads from a projection.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: P14; avoids a second truth.

---

#### DR-002: Evidence Immutability and Integrity

**Requirement**: Evidence is append-only, corrections supersede, and a hash chain makes tampering evident. Integrity is verified daily.

**Acceptance Criteria**: Update and delete statements on evidence tables are rejected outside the deletion process; an injected change is detected within 24 hours.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: P3, P14.

---

#### DR-003: Version Manifest on Every Material Output

**Requirement**: Evidence, observations, pattern evaluations, planner decisions, briefs, exports and safety events each reference a VersionManifest (Entity 3).

**Acceptance Criteria**: Schema validation rejects any material output without a complete manifest.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: P12.

---

#### DR-004: Data Classification

**Requirement**: Every store and field is tagged with one of five tiers: Public, Internal, Confidential, Restricted-Personal and Restricted-Health. Tiers map from the design's classes: highly sensitive or regulated data → Restricted-Health; confidential personal development → Restricted-Personal; operational telemetry → Internal. Model interaction data (prompts, transcripts, outputs) takes the tier of its source.

**Acceptance Criteria**: CI fails if a store or schema field has no tier; controls per tier are applied automatically.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: P13; refines the P13 tiers so health data carries its extra obligations.

---

#### DR-005: Consent as Data

**Requirement**: Consent grants (Entity 2) are immutable records with wording versions. Every processing record references the consent purpose that allowed it.

**Acceptance Criteria**: Evidence, memory projections and shares without a valid purpose reference are rejected.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: P13.

---

#### DR-006: Retention and Deletion

**Requirement**: Retention is set per consent purpose and pack. Participant deletion completes within 30 days in primary stores (proposed), within 24 hours in memory banks (FR-044), and backups age out within 35 days. Each pack declares a retention period after journey closure. Where a pack's regulatory profile declares a statutory retention obligation, a deletion request places the item under restricted access and legal hold instead, and the participant is told this at enrolment (see Conflict C-11).

**Acceptance Criteria**: Deletion tests confirm absence from primary stores, projections and memory within the windows; legal holds are visible to the participant.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: P13; privacy law requires destruction when information is no longer needed.

---

#### DR-007: Journey-Scoped Partitioning

**Requirement**: All Restricted data is keyed by tenant and journey. Pack-facing queries are journey-scoped by construction, and cross-journey joins are impossible from pack code.

**Acceptance Criteria**: Isolation tests (NFR-SEC-007) pass; the data access layer rejects queries without a journey scope.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: Zero cross-domain access by default [CSD-C37].

---

#### DR-008: Aggregation Privacy

**Requirement**: Organisation aggregates use a core minimum cohort size (decided in Phase 0; proposed not less than 10), small-cell suppression and protection against differencing. They are computed only from Internal-tier metrics with no content.

**Acceptance Criteria**: Differencing attack tests fail to isolate any individual.

**Priority**: SHOULD_HAVE (Phase 2) · **Rationale**: P4.

---

#### DR-009: Memory Projection Records

**Requirement**: Every memory item has a MemoryProjection record (Entity 4) linking it to canonical source IDs, purpose and pack version.

**Acceptance Criteria**: A reconciliation job finds zero memory items without a projection record.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: Deletion and provenance depend on it.

---

#### DR-010: Temporal Semantics

**Requirement**: Events record occurred-at as a time or period with stated precision (for example "last week"), separately from recorded-at. The participant's time zone is stored, rules use participant-local time, and device clock skew is corrected at sync.

**Acceptance Criteria**: Temporal rules give correct results across time zones and daylight-saving changes in the replay suite.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: Longitudinal rules depend on accurate time.

---

#### DR-011: Raw Media Handling

**Requirement**: Raw media stays on the device by default. Uploaded media gets per-object encryption and the shortest practical retention, and is sent to a model only if its consent purpose covers that.

**Acceptance Criteria**: Storage audit shows every stored media object has a matching consent purpose and retention date.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: P8.

---

#### DR-012: No Secondary Use Without Consent

**Requirement**: Participant data is not used for model training or fine-tuning, research, or analytics beyond content-free aggregates without a separate, explicit consent purpose.

**Acceptance Criteria**: Data-flow review finds no secondary-use path without a purpose check; provider contracts prohibit training on Cairn data.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: P13.

---

#### DR-013: Non-Production Data

**Requirement**: Non-production environments use synthetic timelines and consented evaluation data only, with recorded provenance.

**Acceptance Criteria**: Scans of non-production stores find no production identifiers.

**Priority**: MUST_HAVE (Phase 1) · **Rationale**: P21; evaluation must not expose participants.

---

### Data Quality Requirements

**Data Accuracy**: Extraction precision and recall thresholds are set per pack schema (proposed: precision of 0.90 or higher for fields that can appear in a brief), with no regression allowed between releases.

**Data Completeness**: Required fields are enforced by schema; missing context is handled by completeness rules that ask the participant, never by guessing.

**Data Consistency**: Conflicting evidence produces clarification asks (FR-020); nothing is silently reconciled.

**Data Timeliness**: Confirmed evidence appears in the timeline within 5 seconds; organisation aggregates refresh daily.

**Data Lineage**: Every output traces to evidence and versions through citations and version manifests (DR-003, FR-017).

---

### Data Migration Requirements

**Migration Scope**: Greenfield. No legacy participant data is migrated (A-9). Internal migrations are in scope: journey pack-version migration (FR-006), data plane migration and memory bank export/import (NFR-I-003).

**Migration Strategy**: Phased, journey by journey, with explicit approval

**Data Transformation**: Defined by each pack's migration plan

**Data Validation**: Record counts, citation resolution and replay checks before and after migration

**Rollback Plan**: Journeys stay on their previous version or data plane until validation passes

**Migration Timeline**: Not applicable to Phase 1

---

## Constraints and Assumptions

### Technical Constraints

**TC-1**: Kubernetes is the portability boundary. Core and pack code import no cloud SDKs, and cloud services sit behind adapters (P10).

**TC-2**: Managed agent services stay out of the core (P10).

**TC-3**: All data and inference stay in the tenant's approved regions, Australia by default, enforced by policy and CI (P11).

**TC-4**: The design's baseline stack: React Native and TypeScript (mobile); Next.js and React (web); Python with FastAPI, Pydantic and SQLAlchemy (services); PostgreSQL; Temporal; Hindsight behind the memory interface; OpenTelemetry; Terraform or OpenTofu with Helm and GitOps. Changes need an ADR.

**TC-5**: A modular monolith comes first; logical service boundaries are enforced by dependency rules (NFR-M-004).

**TC-6**: AWS is the first certified configuration; each deployment has one cloud data path.

**TC-7**: Hindsight is pre-1.0 (v0.10.1 evaluated). It is pinned per certified configuration and joins the production baseline only after the Phase 0 spike passes.

**TC-8**: Regulated packs run on an exact, validated core release in their own deployment and data plane (P9).

---

### Business Constraints

**BC-1**: The platform must be proven with two reference packs before productisation, following the design's phase gates [CSD-C30].

**BC-2**: The Parkinson's pack's initial intended purpose excludes diagnosis, severity scoring and treatment recommendation [CSD-C20].

**BC-3**: No budget or delivery dates are set yet. The business case (`/arckit:sobc`) and project plan (`/arckit:plan`) must set them.

**BC-4**: ARC-000-PRIN governs. NON-NEGOTIABLE principles (P2, P3, P4, P7, P11, P16) cannot be waived by any requirement, pack or tenant.

---

### Assumptions

**A-1**: Participants are adults (18 or over) in v1.

**A-2**: English (Australia) is the only launch language.

**A-3**: Participants' phones can run on-device transcription and feature extraction; the device floor is agreed in Phase 0.

**A-4**: Pilot operating model: a vendor-operated data plane per tenant in the tenant's approved Australian regions. The buyer and operating model remain an open design question.

**A-5**: The pilot's approved region set is the first cloud's two Australian regions.

**A-6**: The Parkinson's pilot has no more than 200 participants.

**A-7**: Hindsight passes the Phase 0 spike; if not, the pilot runs with the null memory provider.

**A-8**: A clinical advisory group and a clinical safety lead are available from Phase 0.

**A-9**: There is no legacy data to migrate.

**A-10**: Residency-compliant models of sufficient quality for extraction and phrasing are available in the approved regions (see R-3).

**Validation Plan**: Phase 0 validates A-3 (device lab), A-7 (Hindsight spike), A-10 (`/arckit:aws-research` on per-task model availability in Australian regions), A-4 (`/arckit:stakeholders`) and A-8 (clinical governance set-up). Assumptions that fail become change requests to this document.

---

## Success Criteria and KPIs

### Business Success Metrics

| Metric | Baseline | Target | Timeline | Measurement Method |
|--------|----------|--------|----------|-------------------|
| Reviewer sessions preceded by a participant-approved brief | None (new service) | 70% or more (proposed) | Pilot month 6 | Workflow and approval records |
| Reviewer-rated brief usefulness | None | 4 out of 5 or more (proposed) | End of pilot | Reviewer survey |
| Participants agreeing the brief reflects what they wanted to raise | None | 80% or more (proposed) | End of pilot | Participant survey |
| Participants rating effort as acceptable | None | 80% or more (proposed) | Quarterly | Participant survey |
| Core changes introducing domain vocabulary for the mentorship pack | Not applicable | Zero | Phase 2 gate | Vocabulary lint and code review |

Engagement measures such as daily active use or streaks are deliberately not targets (P6).

---

### Technical Success Metrics

| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| Material-claim evidence coverage | 100% | Render checks and evaluation suite |
| Deterministic replay of governed decisions | 100% | Replay suite |
| Critical safety floor misses | Zero | Floor regression suite |
| Cross-tenant, cross-journey or cross-bank leakage | Zero | Isolation tests |
| Residency policy violations | Zero | Cloud policy compliance reports |
| System availability | 99.5% (pilot); 99.9% (certified production) | Uptime monitoring |
| Companion reply time (95th percentile) | 3 seconds or less | Tracing |
| Deletions completed within window | 100% | Deletion verification records |
| Mean time to recovery for severity 1 incidents | 1 hour or less (proposed) | Incident tracking |

---

### User Adoption Metrics

| Metric | Target | Timeline | Measurement Method |
|--------|--------|----------|-------------------|
| Invited eligible participants who enrol | 60% or more (proposed) | 3 months into pilot | Enrolment records |
| Journeys reaching their first review with an approved brief | 70% or more (proposed) | 6 months into pilot | Journey records |
| Participants withdrawing because of burden | 10% or less (proposed) | 6 months into pilot | Exit survey |
| Reviewers who open shared briefs | 80% or more (proposed) | 6 months into pilot | Access logs |

---

## Dependencies and Risks

### Dependencies

| Dependency | Description | Owner | Target Date | Status | Impact if Delayed |
|------------|-------------|-------|-------------|--------|-------------------|
| Stakeholder analysis | `ARC-001-STKE` to replace provisional stakeholders | Architecture owner | Phase 0 | At Risk | HIGH |
| Regulatory determination | Intended purpose and classification of the Parkinson's pack | Clinical safety and regulatory lead | Before Phase 1 pilot | At Risk | HIGH |
| Safety floor content approval | Clinically approved floor rules and messages | Clinical safety lead | Phase 1 | At Risk | HIGH |
| Hindsight adoption spike | Isolation, deletion, provenance, latency and failure tests | Platform team | Phase 0 | At Risk | MEDIUM |
| Privacy impact assessment | Core and Parkinson's pack | Privacy officer | Before Phase 1 pilot | At Risk | HIGH |
| Model availability in approved regions | Per-task model check for the first cloud | Platform team | Phase 0 | At Risk | HIGH |
| Device floor and on-device transcription evaluation | Including representative Parkinson's voices | Mobile team | Phase 0 | At Risk | MEDIUM |
| Pilot health service tenant and reviewers | Clinicians willing to receive briefs | Product owner | Phase 1 | At Risk | HIGH |
| Employer tenant for mentorship | Phase 2 pilot partner | Product owner | Phase 2 | At Risk | MEDIUM |
| Principles v1.1 clarifications | Safety disclosure, statutory retention, semantic memory | Architecture Review Board | Phase 0 | At Risk | MEDIUM |

---

### Risks

| Risk ID | Description | Probability | Impact | Mitigation Strategy | Owner |
|---------|-------------|-------------|--------|---------------------|-------|
| R-1 | The Parkinson's pack is classified as a medical device, extending timeline and cost | MEDIUM | HIGH | Early intended-purpose determination; IEC 62304-aligned lifecycle from the start; keep derived features internal | Clinical safety and regulatory lead |
| R-2 | On-device transcription is inaccurate for soft or slurred speech, creating pressure to upload audio | HIGH | HIGH | Evaluate engines on representative voices; consented server path; text fallback; per-pack word error rate target | Mobile lead |
| R-3 | Required model capability is not available in approved regions without cross-region routing | MEDIUM | HIGH | Check availability per task in Phase 0; in-cluster open-weight models as fallback; evaluate smaller models for extraction | Platform lead |
| R-4 | Deletion cannot be verified inside derived memory observations | MEDIUM | HIGH | Bank rebuild from canonical records; deletion probes; null provider fallback | Platform lead |
| R-5 | Pre-1.0 memory provider changes API or behaviour [CSD-C15] | HIGH | MEDIUM | Pin versions; adapter isolation; evaluation on every upgrade | Platform lead |
| R-6 | The memory provider's own model calls bypass the gateway and residency controls | MEDIUM | HIGH | Configure provider to use the gateway; deny other egress; residency tests | Platform lead |
| R-7 | Transcript confirmation adds burden and lowers capture | MEDIUM | MEDIUM | Single-action confirmation; usability testing; brief approval as final confirmation | Product owner |
| R-8 | Employer tenants press for individual visibility | MEDIUM | HIGH | Contract terms; product enforcement; aggregates only | Product owner |
| R-9 | Domain vocabulary leaks into the core | MEDIUM | MEDIUM | Vocabulary lint; review; mentorship as abstraction proof | Architecture owner |
| R-10 | Pack rules multiply and overlap | MEDIUM | MEDIUM | Rule ownership, priorities, dependency graph, synthetic-timeline regression | Pack owners |
| R-11 | Safety disclosure and duty-of-care obligations conflict with participant ownership | MEDIUM | HIGH | Legal advice in Phase 0; escalation only through consent purposes or documented legal basis; principles v1.1 | Privacy officer |
| R-12 | Too many cloud, model and pack combinations to assure | MEDIUM | MEDIUM | A small named set of certified configurations | Platform lead |

**Risk Scoring**: Probability × Impact = Risk Level

- High Risk (Red): Requires executive escalation
- Medium Risk (Yellow): Active monitoring and mitigation
- Low Risk (Green): Accepted

---

## Requirement Conflicts & Resolutions

> **Purpose**: Document conflicting requirements and show how they are resolved.
>
> **Source**: No stakeholder analysis exists yet, so these conflicts come from comparing the Cairn Solution Design v0.2 with ARC-000-PRIN and from competing stakeholder drivers. When `ARC-001-STKE` is produced, its RACI matrix replaces the provisional decision authorities below.
>
> **Status**: Every decision below is a **proposed resolution** for the Architecture Review Board. Where a NON-NEGOTIABLE principle is involved, the principle wins and there is no exception route.

### Conflict C-1: Model Autonomy "By Default" vs Deterministic Decisions

**Conflicting Requirements**:

- **Requirement A**: Design v0.2 keeps safety, planning and report assembly deterministic "by default" [CSD-C7] and leaves open "the maximum allowed AI autonomy per domain" [CSD-C32]
- **Requirement B**: FR-020, FR-022, FR-026 and FR-030 keep detection, next ask, safety and brief content deterministic always (P2, NON-NEGOTIABLE)

**Stakeholders Involved**:

- **Pack authors and product owner (S-6, S-11)**: Want flexibility for richer, adaptive domains
- **Clinical safety lead and ARB (S-7, S-10)**: Want explainable, replayable decisions and a stable regulatory position

**Nature of Conflict**:

- "By default" implies a pack could let a model decide; P2 forbids that in every pack

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Per-pack model decisions with human approval | ✅ Flexible | ❌ Breaks P2 and replay<br>❌ Weakens regulated assurance | Product pleased<br>Safety opposed |
| **Option 2**: Deterministic at all four decision points; models extract and phrase only | ✅ Complies with P2<br>✅ Replayable | ❌ Adaptive behaviour must be authored as rules | Safety and ARB satisfied |
| **Option 3**: Model proposes candidates, rules choose | ✅ Richer candidates | ❌ The model still shapes what is asked next, a P2 breach | Neither fully satisfied |

**Resolution Strategy**: PRIORITIZE

**Decision** (proposed): Option 2. Remove "by default" from design v0.3; the autonomy question is closed for detection, next ask, safety and brief content.

**Rationale**: P2 is non-negotiable, and replayability underpins regulated assurance.

**Decision Authority**: Architecture Review Board

**Impact on Requirements**:

- **Modified**: FR-022, FR-025 and FR-043 state explicitly that no model takes part in decisions
- **Modified**: FR-046 limits model tools to read-only use

**Stakeholder Management**:

- **Pack authors (lost model-driven adaptivity)**: Get richer rule and algorithm support (FR-021) to express adaptive behaviour deterministically

**Future Consideration**:

- Revisit only through a change to the principles, never through a pack exception

---

### Conflict C-2: Semantic Memory Insight vs Cited Evidence

**Conflicting Requirements**:

- **Requirement A**: Design v0.2 lets memory observations surface themes, allows reflect for "mentorship reflection summaries" [CSD-C14], and asks which memory signals may be promoted into canonical insights [CSD-C31]
- **Requirement B**: FR-043, FR-045 and FR-030: memory never governs, and uncited synthesis is blocked (P2, P3)

**Stakeholders Involved**:

- **Product owner and programme designers (S-11, S-6)**: Want insight and summaries
- **Participants and clinical safety lead (S-1, S-7)**: Want accuracy and no second truth

**Nature of Conflict**:

- Memory observations are probabilistic synthesis. Showing them as claims, or letting them drive asks, breaches P2 and P3

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Promote memory signals to candidate insights after participant confirmation | ✅ Insight | ❌ A model decides what is asked (P2 breach) | Product pleased |
| **Option 2**: Memory is phrasing context only; reflect never displayed unless fully cited | ✅ Complies with P2 and P3 | ❌ Less "insight" | Safety satisfied |
| **Option 3**: Pack authors review de-identified memory themes offline to design new rules | ✅ Learning loop | ❌ Needs a consent purpose and aggregation privacy | Balanced, later |

**Resolution Strategy**: PRIORITIZE, then PHASE

**Decision** (proposed): Option 2 for v1. Option 3 is considered in Phase 4 under a separate consent purpose (DR-012).

**Rationale**: The design's open question is answered "none in v1".

**Decision Authority**: Architecture Review Board

**Impact on Requirements**:

- **Modified**: FR-043 (MUST_HAVE); FR-045 restricted to COULD_HAVE

**Stakeholder Management**:

- **Programme designers (lost model summaries)**: Mentorship reflection summaries become participant-authored reflections with cited evidence assembled deterministically

**Future Consideration**:

- Revisit after pilot evidence on memory quality and deletion verification

---

### Conflict C-3: Server-Side Media and Speech Processing vs On-Device First

**Conflicting Requirements**:

- **Requirement A**: Design v0.2 processes on-device "when that improves privacy, latency or cost" [CSD-C17], with server speech adapters and server-derived features
- **Requirement B**: FR-011 and FR-014: on-device by default, with uploads only under explicit consent (P8)

**Stakeholders Involved**:

- **Platform team (S-9)**: Wants simpler, more accurate server processing
- **Participants and privacy officer (S-1, S-8)**: Want minimal exposure of raw media

**Nature of Conflict**:

- P8 makes on-device the rule, not an optimisation. Server transcription is sometimes more accurate for soft or slurred speech (R-2)

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Server processing by default | ✅ Accuracy<br>✅ Simpler | ❌ Breaches P8<br>❌ Larger residency surface | Platform pleased |
| **Option 2**: On-device only | ✅ Privacy | ❌ Accuracy gap<br>❌ Excludes low-end devices | Privacy pleased |
| **Option 3**: On-device by default; server path under an explicit consent purpose, with audio deleted after confirmation | ✅ Both needs met | ❌ Two code paths<br>❌ Consent step | Both satisfied |

**Resolution Strategy**: COMPROMISE

**Decision** (proposed): Option 3

**Rationale**: Keeps P8 intact while protecting accuracy for people who need it.

**Decision Authority**: Architecture Review Board with the privacy officer

**Impact on Requirements**:

- **Modified**: FR-011, FR-014, INT-002, DR-011

**Stakeholder Management**:

- **Platform team**: Gets a supported server path; **privacy officer**: gets explicit consent and deletion after confirmation

**Future Consideration**:

- Revisit as on-device models improve

---

### Conflict C-4: Sharing Without Approval vs Participant Ownership

**Conflicting Requirements**:

- **Requirement A**: Design v0.2 allows approval to be skipped where "a Domain Pack explicitly defines another lawful workflow" [CSD-C19], requires HR sharing only to be "visible to the participant" [CSD-C16], and gives packs "escalation routes"
- **Requirement B**: FR-032 and FR-028: participant approval always; escalation only through an enrolment consent purpose or a documented legal basis (P4, NON-NEGOTIABLE)

**Stakeholders Involved**:

- **Tenant organisations and safeguarding leads (S-4)**: Want duty-of-care escalation
- **Participants (S-1)**: Want control
- **Privacy officer and clinical safety lead (S-8, S-7)**: Want lawful, predictable disclosure

**Nature of Conflict**:

- P4 cannot be waived, yet the law can compel disclosure regardless of product rules

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Packs may define non-approval sharing | ✅ Flexible | ❌ Breaks P4 and trust | Tenants pleased |
| **Option 2**: Approval always; safety escalation only through consent purposes agreed at enrolment; legally compelled disclosure through a documented legal process outside pack configuration, telling the participant where lawful | ✅ P4 intact<br>✅ Lawful | ❌ Programmes without consent cannot escalate automatically | Balanced |
| **Option 3**: Approval always; no escalation | ✅ Simple | ❌ Fails duty-of-care expectations | Tenants opposed |

**Resolution Strategy**: PRIORITIZE

**Decision** (proposed): Option 2. Principles v1.1 must state how legal obligations interact with P4.

**Rationale**: Keeps the participant's control as the product rule while acknowledging the law.

**Decision Authority**: Architecture Review Board, privacy officer and legal counsel

**Impact on Requirements**:

- **Modified**: FR-028, FR-032; FR-049 requires per-share approval for HR (see C-8)

**Stakeholder Management**:

- **Tenants (lost pack-defined sharing)**: Told at contract stage; consent-based escalation is available

**Future Consideration**:

- Legal advice in Phase 0 (R-11)

---

### Conflict C-5: Confirmed Text for Extraction vs Participant Burden

**Conflicting Requirements**:

- **Requirement A**: FR-012: extraction only from confirmed text (P2)
- **Requirement B**: FR-023 and BR-005: minimal burden (P6); the design lets the participant correct only "important content" [CSD-C38]

**Stakeholders Involved**:

- **Participants (S-1)**: Want fewer steps
- **Clinical safety lead and pack authors (S-7, S-6)**: Want accurate evidence

**Nature of Conflict**:

- Confirming every transcript adds effort; skipping confirmation means extracting from text that may be wrong

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Full review of every transcript | ✅ Accuracy | ❌ High burden | Safety pleased |
| **Option 2**: Automatic confirmation | ✅ No burden | ❌ Defeats P2 | Participants pleased |
| **Option 3**: Single-action confirmation; unconfirmed text is kept but not extracted; brief approval is the final check; the floor runs on unconfirmed text | ✅ Accuracy and low burden | ❌ Some entries never extracted | Both satisfied |

**Resolution Strategy**: INNOVATE

**Decision** (proposed): Option 3

**Rationale**: One tap keeps P2 intact at little cost.

**Decision Authority**: Product owner with the Architecture Review Board

**Impact on Requirements**:

- **Modified**: FR-012, FR-016, FR-042

**Stakeholder Management**:

- **Participants**: One action per voice entry, with no penalty for skipping

**Future Consideration**:

- Measure confirmation rates in the pilot (R-7)

---

### Conflict C-6: Memory-Based Personalisation vs Privacy and "Describe, Never Evaluate"

**Conflicting Requirements**:

- **Requirement A**: Design v0.2 mental models such as communication style and recurring blockers, used as secondary context [CSD-C40]
- **Requirement B**: P5, P13, FR-044 (transparency) and DR-012

**Stakeholders Involved**:

- **Product owner (S-11)**: Wants personalisation
- **Participants and privacy officer (S-1, S-8)**: Concerned about inferred profiles

**Nature of Conflict**:

- Mental models characterise the person. Inferred information is still personal information, and a label such as "recurring blockers" can read as evaluation

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Rich mental models, hidden from the participant | ✅ Personalisation | ❌ Opaque profiling | Product pleased |
| **Option 2**: No mental models | ✅ Privacy | ❌ Weaker continuity | Privacy pleased |
| **Option 3**: Pack-declared mental models, internal only, never shown as claims, viewable and deletable by the participant; regulated packs limited to communication preferences | ✅ Balanced | ❌ Authoring and UX effort | Both satisfied |

**Resolution Strategy**: COMPROMISE

**Decision** (proposed): Option 3

**Rationale**: Participants can see and remove what the system has inferred about them.

**Decision Authority**: Architecture Review Board with the privacy officer

**Impact on Requirements**:

- **Modified**: FR-002 (explicit preferences win), FR-044 (transparency), FR-048 (regulated limits)

**Stakeholder Management**:

- **Product owner**: Keeps personalisation within transparent limits

**Future Consideration**:

- Review participant reactions to memory transparency in the pilot

---

### Conflict C-7: Speed to Pilot with Managed Services vs Portability and Isolation

**Conflicting Requirements**:

- **Requirement A**: Design v0.2 allows serverless containers for "selected stateless services" [CSD-C25], a managed workflow service, possibly a hosted memory service, and a core compatibility range in pack manifests
- **Requirement B**: NFR-I-004, INT-003, INT-004 and FR-007 (P9, P10)

**Stakeholders Involved**:

- **Delivery team and product owner (S-9, S-11)**: Want speed and less operational load
- **ARB and clinical safety lead (S-10, S-7)**: Want portability, residency and a controlled SOUP surface

**Nature of Conflict**:

- Managed services speed up delivery but can move data, break the portability boundary and widen the regulated SOUP register

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Use managed services freely in the pilot | ✅ Speed | ❌ Portability, residency and SOUP risk | Delivery pleased |
| **Option 2**: Kubernetes only; self-host everything | ✅ Portability | ❌ Operational load | ARB pleased |
| **Option 3**: Kubernetes for core workloads; managed services only behind adapters, in approved regions, with client-side encryption of workflow payloads; no hosted memory service for regulated or pilot data planes; serverless containers by exception | ✅ Balanced | ❌ Some operational load | Both largely satisfied |

**Resolution Strategy**: COMPROMISE

**Decision** (proposed): Option 3. Regulated packs pin an exact core release (FR-007).

**Rationale**: Keeps the P10 boundary where it matters while allowing managed infrastructure behind adapters.

**Decision Authority**: Architecture Review Board (P10 exception process)

**Impact on Requirements**:

- **Modified**: NFR-I-004, INT-003, INT-004, FR-007

**Stakeholder Management**:

- **Delivery team**: Managed databases, storage and key services remain available through adapters

**Future Consideration**:

- Revisit a hosted memory service when it has been assured for residency and contract terms (design open question)

---

### Conflict C-8: Employer Insight vs Participant Control in Mentorship

**Conflicting Requirements**:

- **Requirement A**: Sponsors want evidence of programme value, and the design requires HR sharing to be "explicit, purpose-bound and visible to the participant" [CSD-C16]
- **Requirement B**: BR-009, FR-037 and FR-032: organisations see aggregates only; individual sharing needs participant approval, not just visibility (P4)

**Stakeholders Involved**:

- **Tenant organisation and programme coordinator (S-4, S-5)**: Want insight into outcomes
- **Mentees (S-1)**: Want safety from performance management

**Nature of Conflict**:

- Visibility after the fact is not approval; any individual flow to an employer changes the power balance

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Manager dashboards of individual progress | ✅ Sponsor insight | ❌ Breaks P4 and trust | Sponsor pleased |
| **Option 2**: Aggregates only | ✅ Trust | ❌ Sponsor sees little | Mentees pleased |
| **Option 3**: Aggregates, plus an optional participant-authored end-of-programme summary shared only by per-recipient approval | ✅ Sponsor gets participant-chosen evidence<br>✅ Trust kept | ❌ Uptake depends on participants | Both largely satisfied |

**Resolution Strategy**: PRIORITIZE (participant), with a COMPROMISE element

**Decision** (proposed): Option 3

**Rationale**: The participant stays in control; sponsors still get evidence.

**Decision Authority**: Product owner with the Architecture Review Board

**Impact on Requirements**:

- **Modified**: FR-037, FR-049, INT-007

**Stakeholder Management**:

- **Sponsors**: Programme value is shown through aggregates and voluntary summaries; this is set out in contracts

**Future Consideration**:

- Review sponsor satisfaction after the first mentorship cohort

---

### Conflict C-9: Identifiers in Telemetry vs Observability Without Content

**Conflicting Requirements**:

- **Requirement A**: Design v0.2 says operational telemetry should "avoid free text or identifiers unless needed for incident investigation" [CSD-C26]
- **Requirement B**: NFR-M-001: no participant content or direct identifiers in telemetry (P17)

**Stakeholders Involved**:

- **Operators (S-9)**: Want fast investigations
- **Privacy officer (S-8)**: Wants no leak path through telemetry

**Nature of Conflict**:

- "Unless needed" turns an exception into a routine path

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Allow identifiers when needed | ✅ Faster debugging | ❌ Leak path; residency risk | Operators pleased |
| **Option 2**: Pseudonymous IDs only; re-identification through break-glass in the data plane | ✅ P17 kept | ❌ Slower investigations | Privacy pleased |

**Resolution Strategy**: PRIORITIZE

**Decision** (proposed): Option 2

**Rationale**: Break-glass gives an audited path for real investigations.

**Decision Authority**: Architecture Review Board with the security lead

**Impact on Requirements**:

- **Modified**: NFR-M-001, FR-039

**Stakeholder Management**:

- **Operators**: Get correlation IDs and a fast break-glass workflow

**Future Consideration**:

- Review investigation times after the first quarter of operation

---

### Conflict C-10: Strong Authentication vs Participant Usability

**Conflicting Requirements**:

- **Requirement A**: NFR-SEC-001: strong authentication (P16)
- **Requirement B**: BR-005, NFR-U-001 and NFR-U-002: low burden and accessibility; one-time codes are hard with tremor or fatigue

**Stakeholders Involved**:

- **Security lead (S-10)**: Wants phishing-resistant authentication
- **Participants (S-1)**: Want easy access

**Nature of Conflict**:

- Code-based MFA adds effort and excludes some participants

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Code-based MFA for everyone | ✅ Strong | ❌ Burden; accessibility barrier | Security pleased |
| **Option 2**: Passwords only for participants | ✅ Easy | ❌ Weak | Participants pleased |
| **Option 3**: Passkeys and device biometrics for participants; re-authentication for sensitive actions; phishing-resistant MFA for staff | ✅ Strong and easy | ❌ Recovery flows need care | Both satisfied |

**Resolution Strategy**: INNOVATE

**Decision** (proposed): Option 3

**Rationale**: Phishing-resistant methods can also be the easiest.

**Decision Authority**: Security lead with the product owner

**Impact on Requirements**:

- **Modified**: NFR-SEC-001

**Stakeholder Management**:

- **Participants**: Assisted recovery for lost devices

**Future Consideration**:

- Monitor sign-in failure and recovery rates in the pilot

---

### Conflict C-11: Participant Deletion vs Statutory Retention of Health Records

**Conflicting Requirements**:

- **Requirement A**: FR-044, UC-6 and DR-006: participants can delete their data (P4, P13)
- **Requirement B**: Health records legislation may require a health service provider tenant to keep records for a set period

**Stakeholders Involved**:

- **Participants (S-1)**: Want deletion
- **Health service tenants and privacy officer (S-4, S-8)**: Must meet statutory obligations

**Nature of Conflict**:

- Honouring every deletion request could breach a tenant's legal duty; refusing all deletion breaks trust and privacy destruction duties

**Trade-off Analysis**:

| Option | Pros | Cons | Impact |
|--------|------|------|--------|
| **Option 1**: Always delete on request | ✅ Participant control | ❌ May breach tenant obligations | Participants pleased |
| **Option 2**: Never delete health journeys | ✅ Compliance | ❌ Breaks trust and destruction duties | Tenants pleased |
| **Option 3**: The pack's regulatory profile declares obligations; participants are told at enrolment; a deletion request becomes restricted access and legal hold until the period ends, then deletion | ✅ Lawful and transparent | ❌ More complex retention logic | Both satisfied |

**Resolution Strategy**: COMPROMISE

**Decision** (proposed): Option 3, pending legal advice on whether Cairn or the tenant holds the record

**Rationale**: Transparency at enrolment avoids surprise later.

**Decision Authority**: Privacy officer, legal counsel and the Architecture Review Board

**Impact on Requirements**:

- **Modified**: DR-006, UC-6

**Stakeholder Management**:

- **Participants**: See exactly what is held and why

**Future Consideration**:

- Include in principles v1.1 alongside C-4

---

### Design v0.2 Alignment Notes

These smaller differences between the design and the principles are resolved directly in the requirements. They should be reflected in design v0.3.

| # | Design v0.2 item | Requirement position |
|---|------------------|----------------------|
| 1 | The illustrative manifest declares a core compatibility range [CSD-C33] | Regulated packs pin an exact core release (FR-007) |
| 2 | The example contract is labelled "PatientEvent" | Core contracts use JourneyEvent only (P1, NFR-M-004) |
| 3 | "Observation" names both a Cairn entity and a memory provider concept | Call the provider concept "memory observation" in core contracts to avoid confusion |
| 4 | The design's own principle list differs from ARC-000-PRIN | Principles v1.1 should add "semantic memory is a non-authoritative projection" and "no cross-journey inference by default" |
| 5 | Role-play "feedback evidence" and "assessment" activities | Descriptive only unless the regulatory profile allows scores (FR-013, FR-029) |
| 6 | "Language adaptation" of report text | Marked as adapted and linked to the original (FR-031) |
| 7 | Safety policy exists only in packs | A core safety floor is added; packs are additive (FR-026, FR-027) |
| 8 | In the interaction turn, extraction (step 3) runs before safety (step 4) | The floor runs on raw input first, before extraction or any reply (FR-026) |
| 9 | The memory provider binds to model providers directly | Its model calls go through the model gateway or in-cluster models (INT-003, FR-046) |
| 10 | Observations carry a "confidence" value | Confidence is internal only and never displayed (P5) |

---

## Timeline and Milestones

### High-Level Milestones

Calendar dates are not yet set; `/arckit:plan` will set them. Milestones follow the design's phase gates.

| Milestone | Description | Target Date | Dependencies |
|-----------|-------------|-------------|--------------|
| Requirements Approval | ARB and product owner approve v1.1 after stakeholder analysis | Phase 0 exit | This document; ARC-001-STKE |
| Phase 0 Gate | Core and pack boundary approved; memory adoption criteria met; regulatory determination under way | Phase 0 exit | Hindsight spike; privacy impact assessment |
| Design Complete | High-level design reviewed against principles and requirements | Early Phase 1 | Requirements |
| Parkinson's Pilot Go-Live | Pilot safety and clinical review passed; replay and evidence tests passed | Phase 1 | Regulatory determination; floor approval |
| Mentorship Pack Release | Ships without domain-specific core changes | Phase 2 exit | Employer tenant |
| Second Cloud Certified | Same core and packs certified on a second cloud | Phase 3 exit | Adapters; evaluation runs |
| Productisation | A third domain built mainly as a pack | Phase 4 exit | Authoring tooling |

---

## Budget

### Cost Estimate

No budget has been set. Figures will come from `/arckit:sobc` and `/arckit:finops`. The main cost drivers are listed so that estimates cover them.

| Category | Estimated Cost | Notes |
|----------|----------------|-------|
| Development | Not yet estimated | Core platform, two reference packs, mobile and web apps |
| Infrastructure | Not yet estimated | One data plane per tenant or regulated pack in Australian regions (Kubernetes, PostgreSQL, workflow engine, memory service) |
| Third-party services | Not yet estimated | Model inference per turn, including memory retain and consolidation; speech services; notification providers |
| Testing | Not yet estimated | Evaluation suites, device lab, accessibility testing, penetration tests |
| Regulatory and clinical assurance | Not yet estimated | Intended-purpose determination; lifecycle and quality system if the Parkinson's pack is a medical device |
| Training | Not yet estimated | Pack authors, reviewers, operators |
| **Total** | **Not yet estimated** | |

### Ongoing Operational Costs

| Category | Annual Cost | Notes |
|----------|-------------|-------|
| Infrastructure | Not yet estimated | Scales with data planes rather than users |
| Licenses | Not yet estimated | Core components are open source; managed services behind adapters |
| Support | Not yet estimated | On-call, clinical governance, pack maintenance |
| **Total** | **Not yet estimated** | |

---

## Approval

### Requirements Review

| Reviewer | Role | Status | Date | Comments |
|----------|------|--------|------|----------|
| Not yet nominated | Business Sponsor | [ ] Approved | Pending | |
| Not yet nominated | Product Owner | [ ] Approved | Pending | |
| Chris McKelt | Enterprise Architect | [ ] Approved | Pending | |
| Not yet nominated | Security | [ ] Approved | Pending | |
| Not yet nominated | Clinical Safety and Regulatory | [ ] Approved | Pending | |
| Not yet nominated | Privacy and Compliance | [ ] Approved | Pending | |

### Sign-Off

By signing below, stakeholders confirm that requirements are complete, understood, and approved to proceed to design phase.

| Stakeholder | Signature | Date |
|-------------|-----------|------|
| Chris McKelt, Architecture Owner | _________ | Pending |
| Product owner (not yet named) | _________ | Pending |

---

## Appendices

### Appendix A: Glossary

Core terms (core, pack, participant, contributor, reviewer, evidence item, ask, brief, burden budget, safety floor, model gateway, SOUP) are defined in ARC-000-PRIN. Additional terms:

| Term | Definition |
|------|------------|
| AMT | Australian Medicines Terminology |
| APP | Australian Privacy Principle (Privacy Act 1988) |
| AU Core | Australian FHIR implementation guide for core clinical resources |
| Certified configuration | A named combination of cloud, regions, model bindings, speech engine, memory provider, pack versions and platform release with evaluation evidence |
| Control plane | Shared management layer for tenants, pack catalogue and releases; holds no participant content |
| Data plane | A deployment holding participant data for one tenant or regulated pack in approved regions |
| Memory bank | The memory provider's isolation unit; one per tenant and journey |
| Mental model | A standing summary maintained by the memory provider (for example communication preferences) |
| Null provider | Memory implementation that stores and recalls nothing, used when memory is disabled or unavailable |
| Regulatory profile | Pack declaration of regulatory status, what may be displayed and retention obligations |
| Retain / Recall / Reflect | Memory provider operations: store, retrieve, and reason over memories |
| SNOMED CT-AU | Australian release of the SNOMED CT clinical terminology |
| TGA | Therapeutic Goods Administration, Australia's regulator of therapeutic goods including software medical devices |
| Version manifest | The record of all versions behind an output (Entity 3) |
| WER | Word error rate, a speech recognition accuracy measure |

### Appendix B: Reference Documents

- Architecture principles: `projects/000-global/ARC-000-PRIN-v1.0.md`
- Cairn Solution Design v0.2 (attached to this command; copy into `projects/001-cairn/external/`)
- Hindsight repository, documentation and v0.10.1 release, as listed in the design's Appendix C.2 (not independently reviewed for this document)

### Appendix C: Wireframes and Mockups

None yet. The design's figures 1–4 were not supplied with the attachment.

### Appendix D: Data Models

The entity catalogue and governance-critical entities are in Data Requirements. The full model, with relationships and privacy analysis, is to be produced by `/arckit:data-model`.

### Appendix E: Requirements Traceability

**Principles to requirements**

| Principle | Requirements |
|-----------|--------------|
| P1 Domain-free core | BR-001, FR-008, FR-010, FR-013, FR-034, NFR-M-004 |
| P2 Models converse; rules decide | BR-004, FR-012, FR-016, FR-020, FR-022, FR-025, FR-031, FR-043, FR-045, FR-046 |
| P3 Every claim cites evidence | FR-016, FR-017, FR-025, FR-030, FR-031, FR-045, DR-002 |
| P4 Participant owns the journey | BR-003, BR-009, BR-011, FR-003, FR-004, FR-028, FR-032, FR-033, FR-037, FR-038, FR-039, DR-008 |
| P5 Describe, never evaluate | FR-013, FR-021, FR-025, FR-029, FR-048, FR-049 |
| P6 Respect the participant's energy | BR-005, FR-002, FR-012, FR-022, FR-023, NFR-P-001 |
| P7 Safety floor | BR-006, FR-015, FR-026, FR-027, FR-028 |
| P8 On-device first | FR-011, FR-014, FR-015, DR-011, NFR-P-005, INT-012 |
| P9 Regulated packs isolated | BR-007, FR-006, FR-007, FR-009, NFR-C-005, TC-8 |
| P10 Portable core, native adapters | BR-008, FR-040, NFR-I-004, NFR-M-004, INT-010, TC-1, TC-2 |
| P11 Residency by policy | BR-008, FR-001, FR-011, FR-046, NFR-C-004, NFR-A-002, INT-001, INT-003 |
| P12 Version everything | FR-005, FR-006, FR-007, FR-017, FR-021, DR-003 |
| P13 Consent-bound, minimised data | FR-002, FR-014, FR-036, DR-004, DR-005, DR-006, DR-012 |
| P14 Evidence integrity and lineage | FR-017, FR-044, DR-001, DR-002, DR-009 |
| P15 Contract-first interfaces | FR-010, FR-034, NFR-I-001, NFR-I-002 |
| P16 Security by design | NFR-SEC-001 to NFR-SEC-009, FR-039 |
| P17 Observability without content | FR-046, NFR-M-001 |
| P18 Resilience and availability | FR-024, FR-025, FR-042, NFR-A-001 to NFR-A-004 |
| P19 Accessible and inclusive | FR-002, NFR-U-001, NFR-U-002, NFR-U-003 |
| P20 Everything as code | NFR-M-005 |
| P21 Evaluation-gated change | FR-009, FR-046, FR-047, NFR-M-006, DR-013 |
| P22 Supply-chain assurance | FR-007, NFR-SEC-008, NFR-M-006 |
| P23 Decisions are recorded | NFR-M-002; Requirement Conflicts & Resolutions |

**Business requirements to supporting requirements**

| Business Requirement | Supporting Requirements |
|----------------------|-------------------------|
| BR-001 One core, many domains | FR-004, FR-005, FR-007, FR-008, FR-010, FR-049, NFR-M-004 |
| BR-002 Evidence-backed preparation | FR-011, FR-013, FR-019, FR-024, FR-030, FR-033, FR-034, FR-048 |
| BR-003 Participant ownership and trust | FR-002, FR-003, FR-004, FR-014, FR-018, FR-028, FR-032, FR-035, FR-036, FR-038, FR-039, FR-041, FR-044 |
| BR-004 Explainable decisions and cited outputs | FR-005, FR-016, FR-017, FR-019, FR-020, FR-021, FR-022, FR-025, FR-030, FR-031, FR-043, FR-045, FR-047 |
| BR-005 Low burden | FR-002, FR-022, FR-023, NFR-U-001 |
| BR-006 Safety floor | FR-015, FR-026, FR-027, FR-028, FR-047 |
| BR-007 Regulatory readiness | FR-007, FR-009, FR-029, FR-048, NFR-C-005 |
| BR-008 Deploy within residency | FR-001, FR-046, NFR-C-004, NFR-I-004 |
| BR-009 Employer-sponsored programmes | FR-029, FR-049, INT-007 |
| BR-010 Replaceable AI and memory | FR-040, FR-041, FR-042, FR-043, FR-046 |
| BR-011 Organisational insight | FR-001, FR-037, FR-038, DR-008 |
| BR-012 Pack authoring and certification | FR-008, FR-009, FR-047 |

---

**Document History**

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-09-28 | ArcKit AI | Initial draft from Cairn Solution Design v0.2 and ARC-000-PRIN-v1.0 |

## External References

> This section provides traceability from generated content back to source documents.
> Follow citation instructions in the project's citation reference guide.

### Document Register

| Doc ID | Filename | Type | Source Location | Description |
|--------|----------|------|-----------------|-------------|
| CSD | Cairn_Solution_Design_v0.2.md | Solution Design | Attached to the `/arckit:requirements` command; not yet saved in `001-cairn/external/` | Master platform design v0.2 (dated 29 September 2026), codename Cairn |

### Citations

| Citation ID | Doc ID | Page/Section | Category | Quoted Passage |
|-------------|--------|--------------|----------|----------------|
| [CSD-C1] | CSD | Design basis | Design Decision | "Hindsight is explicitly non-authoritative: canonical journey, evidence, consent, pattern and decision state remains in Cairn." |
| [CSD-C2] | CSD | §1 Product vision and scope | Business Requirement | "Cairn’s reusable product proposition is: capture a person’s experience over time, structure it into evidence, compare it with their own baseline or goals, detect meaningful patterns and gaps, ask for the next useful piece of evidence, remember relevant context across months, and prepare an evidence-backed view for the person and their trusted counterpart." |
| [CSD-C3] | CSD | §1.1 Platform scope | Business Requirement | "General-purpose autonomous agents; unrestricted medical diagnosis or treatment advice; automated employment decisions; … semantic/agent memory as an authoritative source of truth or direct policy engine" |
| [CSD-C4] | CSD | §1.2 Domain responsibility | Functional Requirement | "Every Domain Pack must state its intended purpose, target participants, allowed decisions, prohibited decisions, evidence model, safety boundaries, privacy classification, human roles and evaluation gates." |
| [CSD-C5] | CSD | §3 Platform and Domain Pack architecture | Functional Requirement | "A Journey is created for a Participant within a Tenant and is bound to one DomainPackVersion." |
| [CSD-C6] | CSD | §3.1 Core platform services | Design Decision | "The MVP does not need twelve separately deployed microservices. These are logical boundaries." |
| [CSD-C7] | CSD | Executive summary, decision 2; §4 Default autonomy policy | Design Decision | "LLMs extract and communicate; policy/rules decide by default" … "Safety, permissions, persistence, workflow transitions, report assembly and default planning remain deterministic/versioned." |
| [CSD-C8] | CSD | §4.1 One interaction turn, step 8 | Non-Functional Requirement | "The Memory Service recalls relevant journey-scoped context from Hindsight after Cairn authorisation; failure or unavailability does not block the governed workflow." |
| [CSD-C9] | CSD | §7.2 Planner | Functional Requirement | "The Planner selects a single next action, or none, from eligible actions." |
| [CSD-C10] | CSD | §7.1 Algorithm plug-ins | Functional Requirement | "An algorithm output is recorded as a DerivedFeature with version and quality metadata. It does not bypass the rule, planner or report policy." |
| [CSD-C11] | CSD | §8.2 Bank, purpose and consent strategy | Security Requirement | "The default isolation unit is one Hindsight bank per Tenant + Journey." |
| [CSD-C12] | CSD | §8.2 Bank, purpose and consent strategy | Security Requirement | "Hindsight Memory Defense/PII filtering may be enabled as defence in depth, but Cairn does not rely on it as the consent, privacy or tenancy enforcement mechanism." |
| [CSD-C13] | CSD | §8.3 Retain, recall, observations and mental models | Data Requirement | "When Cairn deletes or revokes a source record, the Memory Service must remove the corresponding Hindsight memories and verify that derived observations/mental models no longer retain the deleted information." |
| [CSD-C14] | CSD | §8.3 table, reflect | Design Decision | "Optional deeper reasoning for non-governed tasks such as mentorship reflection summaries." |
| [CSD-C15] | CSD | §8.5 Deployment and adoption position | Risk Factor | "The evaluated release is still pre-1.0, so Cairn pins an approved version per certified deployment configuration and treats provider upgrades as evaluated changes." |
| [CSD-C16] | CSD | §9.1 Relationship model | Stakeholder Need | "Any sharing with HR, managers or talent systems must be explicit, purpose-bound and visible to the participant." |
| [CSD-C17] | CSD | §10.1 On-device first where useful | Design Decision | "Sensitive or high-bandwidth capture can be processed on-device when that improves privacy, latency or cost." |
| [CSD-C18] | CSD | §11.1 Report generation rules, rule 3 | Functional Requirement | "The report distinguishes “not observed”, “not reported” and “not asked / not covered”." |
| [CSD-C19] | CSD | §11.1 Report generation rules, rule 5 | Functional Requirement | "The participant can review, correct and approve externally shared reports unless a Domain Pack explicitly defines another lawful workflow." |
| [CSD-C20] | CSD | §12 Reference Domain Pack A | Compliance Constraint | "It does not diagnose Parkinson’s, score disease severity or recommend treatment in its initial intended purpose." |
| [CSD-C21] | CSD | §13 Reference Domain Pack B, safety / boundaries | Compliance Constraint | "No mental-health diagnosis, no autonomous employment recommendation, no hidden scoring for promotion/performance" |
| [CSD-C22] | CSD | §14 Technology stack, durable workflow | Integration Requirement | "Temporal; self-hosted in the deployment or managed only where residency and contractual requirements permit." |
| [CSD-C23] | CSD | §15.2 Control plane and data plane | Data Requirement | "Participant content, evidence and model prompts remain in the tenant data plane by default." |
| [CSD-C24] | CSD | §15.1 Certified configurations | Design Decision | "The platform should support a small named set of certified configurations rather than promising “any cloud, any model”." |
| [CSD-C25] | CSD | §16 AWS reference deployment profile, compute | Design Decision | "EKS for portable services and workers; ECS/Fargate may be used for selected stateless services if the portability contract is preserved." |
| [CSD-C26] | CSD | §17 Security, privacy, consent and isolation, operational data class | Security Requirement | "Standard security controls; avoid free text or identifiers unless needed for incident investigation." |
| [CSD-C27] | CSD | §17.1 Security controls | Security Requirement | "Memory-bank identifiers are derived from authenticated server state; client-supplied bank identifiers are rejected. CI includes store-as-A/read-as-B leakage tests." |
| [CSD-C28] | CSD | §18 Evaluation, evidence faithfulness gate | Non-Functional Requirement | "100% material-claim evidence coverage; no unsupported claims in reviewed sample." |
| [CSD-C29] | CSD | §18 Evaluation, safety policy gate | Non-Functional Requirement | "Any critical miss blocks release for that pack." |
| [CSD-C30] | CSD | §19 Delivery roadmap | Business Requirement | "The platform contract should be proven against two materially different Domain Packs—Parkinson’s symptom capture and mentorship—so generic boundaries are discovered through real requirements." |
| [CSD-C31] | CSD | §21.1 Open questions | Design Decision | "Which memory-derived signals, if any, may be promoted into canonical CandidateInsight records for specific Domain Packs, and what confirmation is required?" |
| [CSD-C32] | CSD | §21.1 Open questions | Design Decision | "What is the maximum allowed AI autonomy per domain and which actions always require deterministic policy or human approval?" |
| [CSD-C33] | CSD | §6.2 Illustrative manifest (code block) | Functional Requirement | Manifest declares core_compatibility as a version range (0.1 up to but excluding 1.0) rather than an exact core release |
| [CSD-C34] | CSD | §8.1 Provider boundary and failure model | Non-Functional Requirement | "Memory failure must degrade personalisation, not corrupt or block the canonical journey workflow." |
| [CSD-C35] | CSD | §8.5 Deployment and adoption position | Integration Requirement | "Hindsight fits Cairn’s portability strategy because it can be self-hosted with Docker/Kubernetes and PostgreSQL/pgvector and can bind to multiple LLM providers." |
| [CSD-C36] | CSD | §15 Multi-cloud deployment model | Design Decision | "Multi-cloud means the same product can be deployed into different clouds, not that one participant’s active data path is spread across providers." |
| [CSD-C37] | CSD | §17.2 Cross-domain isolation | Security Requirement | "The default is zero cross-domain access." |
| [CSD-C38] | CSD | §4.1 One interaction turn, step 2 | Functional Requirement | "Input is normalised; speech is transcribed; the participant can correct important content." |
| [CSD-C39] | CSD | §18.1 Domain Pack lifecycle (table) | Functional Requirement | Table defines the Draft, Reviewed, Pilot, Certified, Deprecated and Retired statuses and what each allows |
| [CSD-C40] | CSD | §9 Personalisation, tone and relationships | Functional Requirement | "Hindsight mental models may supply secondary conversational context such as preferred style or recurring topics, but explicit settings and canonical records always win." |

### Unreferenced Documents

| Filename | Source Location | Reason |
|----------|-----------------|--------|
| .gitkeep | `000-global/policies/` | Placeholder file; no content |
| .gitkeep | `000-global/external/` | Placeholder file; no content |
| Cairn_Solution_Design_v0.2_assets/media (figures 1–4) | Referenced by CSD | Images not supplied with the attachment |

---

**Generated by**: ArcKit `/arckit:requirements` command
**Generated on**: 2026-09-28 22:33 GMT
**ArcKit Version**: 6.16.4
**Project**: Cairn — Longitudinal Guidance and Evidence Platform (Project 001)
**Model**: Claude Opus 5.5 (claude-opus-5-5)
**Generation Context**: Derived from the attached Cairn Solution Design v0.2 and governed by ARC-000-PRIN-v1.0; no stakeholder analysis, risk register or business case existed at generation time
