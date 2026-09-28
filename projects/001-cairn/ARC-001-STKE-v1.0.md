# Stakeholder Drivers & Goals Analysis: Cairn — Longitudinal Guidance and Evidence Platform

> **Template Origin**: Official | **ArcKit Version**: 6.16.4 | **Command**: `/arckit:stakeholders`

## Document Control

| Field | Value |
|-------|-------|
| **Document ID** | ARC-001-STKE-v1.0 |
| **Document Type** | Stakeholder Drivers & Goals Analysis |
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
| 1.0 | 2026-09-28 | ArcKit AI | Initial creation from `/arckit:stakeholders` command | PENDING | PENDING |

---

## Executive Summary

### Purpose

This document identifies key stakeholders, their underlying drivers (motivations, concerns, needs), how these drivers manifest into goals, and the measurable outcomes that will satisfy those goals. This analysis ensures stakeholder alignment and provides traceability from individual concerns to project success metrics.

It replaces the provisional stakeholder list in `ARC-001-REQ-v1.0` and keeps the same stakeholder IDs (S-1 to S-11), adding S-12 to S-17. **No stakeholder interviews have been held yet.** Drivers are inferred from the Cairn Solution Design v0.2, the requirements and the principles, and must be validated in Phase 0 interviews (Appendix A).

**Indicative timeline used for goals** (to be confirmed by `/arckit:plan`): Phase 0 October–December 2026; Phase 1 build January–June 2027; Parkinson's pilot July–December 2027; Phase 2 (mentorship) January–June 2028; Phase 3 (second cloud) July–December 2028.

### Key Findings

Cairn's success depends on people who hold little formal power but can quietly end the product: participants who stop recording, or withdraw consent, and clinicians who stop opening briefs. The strongest tensions are between the people who pay (employers and health services wanting visibility and escalation) and the people who share (participants wanting control), and between commercial pressure to reach a pilot quickly and the regulatory and safety work that must come first. The architecture principles already settle most of these in the participant's favour. The main stakeholder task is to make sure buyers accept that before they sign, not after.

### Critical Success Factors

- Participants trust Cairn enough to keep recording for months: nothing is shared without their approval, and the effort stays low
- Clinicians and mentors find the brief quicker to use than their current approach, and trust it because every statement is cited
- The Parkinson's pack's regulatory position is settled before enrolment and does not drift during the pilot
- Buyers (health services and employers) accept aggregate-only visibility and participant-approved sharing as contract terms
- The mentorship pack ships on the same core, proving the platform thesis to investors

### Stakeholder Alignment Score

**Overall Alignment**: MEDIUM

Everyone agrees on the goal of better-prepared conversations. Alignment drops on who can see what (participants and privacy officer vs employers and health-service safeguarding), on pace (executive sponsor and sales vs clinical safety and architecture), and on how much the memory and AI features may do (product vs privacy and safety). All three conflicts have proposed resolutions below; none is yet agreed with the people involved.

---

## Stakeholder Identification

### Internal Stakeholders

Cairn is a private-sector venture. "Internal" means the Cairn organisation and its governance roles.

| Stakeholder | Role/Department | Influence | Interest | Engagement Strategy |
|-------------|----------------|-----------|----------|---------------------|
| S-11 Executive sponsor and product owner (not yet named) | Founders or leadership; business case, funding and prioritisation | HIGH | HIGH | Decision authority; fortnightly steering |
| S-10 Architecture owner (Chris McKelt) and Architecture Review Board | Principles, design authority, exceptions | HIGH | HIGH | Owns architecture decisions and conflict resolutions |
| S-7 Clinical safety and regulatory lead | Safety floor, intended purpose, regulated pack assurance | HIGH | HIGH | Gatekeeper for pilot go/no-go and pack certification |
| S-8 Privacy officer | Privacy impact, consent model, residency, breach response | HIGH | HIGH | Gatekeeper for data handling decisions |
| S-6 Pack authors and domain owners (clinical advisory group, programme designers) | Coverage models, rules, wording, evaluation cases | MEDIUM | HIGH | Co-design; pack review cycles |
| S-12 Engineering and delivery team | Builds core, packs, apps and pipelines | MEDIUM | HIGH | Day-to-day collaboration; ADR input |
| S-9 Platform operator and SRE | Runs data planes and certified configurations | MEDIUM | MEDIUM | Operability reviews; runbooks |
| S-13 Commercial and partnerships lead | Signs health service and employer tenants | MEDIUM | HIGH | Contract terms aligned with principles; early briefing |

### External Stakeholders

| Stakeholder | Organization | Relationship | Influence | Interest |
|-------------|--------------|--------------|-----------|----------|
| S-1 Participants (people living with Parkinson's; mentees) | Tenant programmes | Primary users and data owners | HIGH (collectively, through consent and withdrawal) | HIGH |
| S-2 Contributors (carers, family, peers, feedback providers) | Participant's network | Invited users | LOW | MEDIUM |
| S-3 Reviewers (GPs, neurologists, mentors, coaches) | Health services and programmes | Recipients of briefs; adoption gatekeepers | MEDIUM | HIGH |
| S-4 Tenant organisations (health services, employers, programme sponsors) | Customers | Buyers and operators | HIGH | HIGH |
| S-5 Programme coordinators | Tenant organisations | Run programmes; aggregate view only | LOW | HIGH |
| S-14 Regulators (TGA; Office of the Australian Information Commissioner; state health privacy regulators) | Government | Oversight | HIGH | LOW (rises sharply after an incident) |
| S-15 Technology suppliers (cloud and model providers; Hindsight maintainers) | Vendors and open-source project | Suppliers | MEDIUM | MEDIUM |
| S-16 Employer managers and HR (not users) | Tenant employers | Hidden influencers over mentees | MEDIUM | MEDIUM |
| S-17 Patient and consumer advocacy organisations (Parkinson's community) | Not-for-profit sector | Advisers and reputational influencers | MEDIUM | MEDIUM |

### Regulatory and Governance Roles (Australian Context)

The UK Government roles in the template (GovS 005 and GovS 007) do not apply: Cairn is a private-sector product deployed in Australia by default. The equivalent accountabilities are:

| Role | Responsibility | Typical Power/Interest | Engagement Strategy |
|------|---------------|----------------------|---------------------|
| Executive sponsor (S-11) | Accountable for outcomes, funding and risk appetite | HIGH / HIGH | Manage Closely — steering, decision escalation |
| Clinical safety and regulatory lead (S-7) | Intended purpose, clinical safety case, regulatory engagement with the TGA | HIGH / HIGH | Manage Closely — gate reviews |
| Privacy officer (S-8) | Privacy Act compliance, privacy impact assessments, breach notification to the OAIC | HIGH / HIGH | Manage Closely — data decisions, consent model sign-off |
| Tenant clinical governance committee (within S-4) | Approves use of Cairn within a health service | HIGH / MEDIUM | Keep Satisfied — pilot protocol and safety reporting |
| TGA (S-14) | Regulates software as a medical device | HIGH / LOW | Keep Satisfied — intended-purpose determination; engage early if the pack may be a device |
| OAIC and state regulators (S-14) | Privacy and health records oversight | HIGH / LOW | Keep Satisfied — compliant practices; breach readiness |

### Stakeholder Power-Interest Grid

```text
                          INTEREST
              Low                         High
        ┌─────────────────────┬──────────────────────────┐
        │                     │                          │
        │   KEEP SATISFIED    │   MANAGE CLOSELY         │
   High │                     │                          │
        │  • Regulators       │  • Executive sponsor     │
        │    (TGA, OAIC)      │  • Architecture owner    │
        │                     │  • Clinical safety lead  │
        │                     │  • Privacy officer       │
 P      │                     │  • Tenant organisations  │
 O      │                     │  • Participants          │
 W      ├─────────────────────┼──────────────────────────┤
 E      │                     │                          │
 R      │      MONITOR        │    KEEP INFORMED         │
        │                     │                          │
   Low  │  • Standards bodies │  • Reviewers (clinicians,│
        │  • OSS maintainers  │    mentors)              │
        │                     │  • Pack authors          │
        │                     │  • Engineering, SRE      │
        │                     │  • Commercial lead       │
        │                     │  • Coordinators          │
        │                     │  • Contributors          │
        │                     │  • Employer managers/HR  │
        │                     │  • Advocacy groups       │
        └─────────────────────┴──────────────────────────┘
```

| Stakeholder | Power | Interest | Quadrant | Engagement Strategy |
|-------------|-------|----------|----------|---------------------|
| S-11 Executive sponsor and product owner | HIGH | HIGH | Manage Closely | Fortnightly steering; owns go/no-go |
| S-10 Architecture owner and ARB | HIGH | HIGH | Manage Closely | Decides conflicts; monthly ARB |
| S-7 Clinical safety and regulatory lead | HIGH | HIGH | Manage Closely | Gate reviews; safety floor sign-off |
| S-8 Privacy officer | HIGH | HIGH | Manage Closely | Consent model and privacy impact sign-off |
| S-4 Tenant organisations | HIGH | HIGH | Manage Closely | Co-design pilot protocol; contract terms |
| S-1 Participants | HIGH (collective) | HIGH | Manage Closely | Co-design sessions; pilot feedback loops |
| S-14 Regulators | HIGH | LOW | Keep Satisfied | Documented compliance; early TGA engagement if needed |
| S-3 Reviewers | MEDIUM | HIGH | Keep Informed (adoption-critical) | Brief prototypes tested in clinic; feedback sessions |
| S-6 Pack authors | MEDIUM | HIGH | Keep Informed | Pack review cycles; evaluation reports |
| S-12 Engineering and delivery team | MEDIUM | HIGH | Keep Informed | Sprint reviews; ADRs |
| S-13 Commercial lead | MEDIUM | HIGH | Keep Informed | Monthly briefing on non-negotiables |
| S-9 Platform operator and SRE | MEDIUM | MEDIUM | Keep Informed | Operability reviews |
| S-16 Employer managers and HR | MEDIUM | MEDIUM | Keep Informed | Programme briefings on what they will and will not see |
| S-17 Advocacy organisations | MEDIUM | MEDIUM | Keep Informed | Advisory input on pack wording and consent |
| S-5 Programme coordinators | LOW | HIGH | Keep Informed | Coordinator guide; aggregate dashboard demos |
| S-2 Contributors | LOW | MEDIUM | Keep Informed | In-product explanations of scope |
| S-15 Technology suppliers | MEDIUM | MEDIUM | Monitor | Contract and release monitoring |

**Quadrant Interpretation:**

- **Manage Closely** (High Power, High Interest): Key decision-makers requiring active engagement
- **Keep Satisfied** (High Power, Low Interest): Influential stakeholders needing periodic updates
- **Keep Informed** (Low Power, High Interest): Engaged stakeholders needing regular communication
- **Monitor** (Low Power, Low Interest): Minimal engagement required

Participants are placed in Manage Closely deliberately. Individually they have little power, but P4 gives each of them a veto over sharing, and together their continued recording is the product. Reviewers sit on the Keep Informed boundary: they approve nothing, but if they stop opening briefs the pilot fails.

---

## Stakeholder Drivers Analysis

### SD-1: Participant Living with Parkinson's - Being Heard in Short Visits

**Stakeholder**: S-1 Participants (Parkinson's pack)

**Driver Category**: CUSTOMER

**Driver Statement**: "I see my specialist for a few minutes every few months. I forget what happened, I get flustered, and the things that matter most to my daily life never get said."

**Context & Background**: Parkinson's symptoms fluctuate day to day and are poorly captured by a single consultation. Fatigue, soft voice and anxiety make recall in the room harder. The pack exists to prepare, not to diagnose [CSD-C2].

**Driver Intensity**: CRITICAL

**Enablers** (What would help):

- Voice capture that copes with a soft or slurred voice
- A brief in their own words that they control

**Blockers** (What would hinder):

- Typing-heavy interfaces; long questionnaires
- Clinicians who do not look at the brief

**Related Stakeholders**:

- S-2 carers (similar), S-3 clinicians (dependent on them reading the brief)

---

### SD-2: Participant - Control Over Sensitive Information

**Stakeholder**: S-1 Participants (both packs)

**Driver Category**: RISK

**Driver Statement**: "I will only be honest if I know nothing goes anywhere without my say — not to my employer, not to an insurer, not to anyone I did not choose."

**Context & Background**: Health and personal development information can affect employment, insurance and relationships. Public awareness of data breaches in Australia is high, and trust, once lost, is rarely regained.

**Driver Intensity**: CRITICAL

**Enablers** (What would help):

- Visible, item-by-item approval before any sharing (P4)
- An access log showing who looked and when

**Blockers** (What would hinder):

- Any sense that the organisation or "the AI" sees everything
- Notifications that reveal their condition

**Related Stakeholders**:

- S-8 privacy officer (aligned); S-4 and S-16 (potentially conflicting)

---

### SD-3: Participant - Limited Energy

**Stakeholder**: S-1 Participants

**Driver Category**: PERSONAL

**Driver Statement**: "Some days I have nothing left. I need this to take less effort than a notebook, and to leave me alone when I am not up to it."

**Context & Background**: Fatigue and apathy are common in Parkinson's; mentees are busy professionals. Engagement mechanics feel like pressure and cause drop-out.

**Driver Intensity**: HIGH

**Enablers** (What would help):

- A strict burden budget and quiet periods (P6)
- One-tap confirmation and voice input

**Blockers** (What would hinder):

- Frequent prompts; streaks; guilt messages
- Long confirmation steps

**Related Stakeholders**:

- S-6 pack authors and S-7 clinical safety lead (want completeness; potential tension)

---

### SD-4: Mentee - Psychological Safety in an Employer-Sponsored Programme

**Stakeholder**: S-1 Participants (mentorship pack)

**Driver Category**: RISK

**Driver Statement**: "If my reflections about struggling could reach my manager or HR, I will not write anything real."

**Context & Background**: The design recognises that mentoring conversations should not become performance-management data [CSD-C1]. Mentees weigh career risk against the value of honest reflection.

**Driver Intensity**: CRITICAL

**Enablers** (What would help):

- No manager or HR visibility by default; per-share approval
- Clear, upfront explanation of what the employer sees (aggregates only)

**Blockers** (What would hinder):

- Vague contract terms with the employer
- Any feature that looks like scoring

**Related Stakeholders**:

- S-16 managers and HR, S-4 employer sponsors (conflicting drivers SD-9)

---

### SD-5: Carer and Contributor - Helping Without Overstepping

**Stakeholder**: S-2 Contributors

**Driver Category**: CUSTOMER

**Driver Statement**: "I notice things they do not — the falls at night, the changes in sleep. I want to add that without reading their private diary."

**Context & Background**: Carers hold important evidence but relationships can be strained by feeling monitored.

**Driver Intensity**: MEDIUM

**Enablers** (What would help):

- Scoped invitations; seeing only their own contributions (P4)

**Blockers** (What would hinder):

- Unclear boundaries; complicated sign-up

**Related Stakeholders**:

- S-1 participants

---

### SD-6: Clinician Reviewer - Trustworthy Information That Fits a Short Consultation

**Stakeholder**: S-3 Reviewers (GPs, neurologists)

**Driver Category**: OPERATIONAL

**Driver Statement**: "Give me one page I can trust in two minutes. Do not send me months of diary I am then responsible for having read."

**Context & Background**: Consultations are short and clinicians carry medico-legal responsibility for information they receive. Unstructured patient data is often ignored because reviewing it is unpaid, unbounded work.

**Driver Intensity**: HIGH

**Enablers** (What would help):

- A one-page brief with citations, and separation of "not reported" from "not asked"
- Delivery before the visit, in a channel they already use

**Blockers** (What would hinder):

- Long or interpretive summaries; alerts that imply they must act
- Extra log-ins

**Related Stakeholders**:

- S-1 participants (want everything heard), S-4 health services

---

### SD-7: Mentor Reviewer - Continuity Between Sessions

**Stakeholder**: S-3 Reviewers (mentors, coaches)

**Driver Category**: OPERATIONAL

**Driver Statement**: "I want to start each session where the last one ended, with the mentee's own priorities in front of me."

**Context & Background**: The mentorship pack exists to improve continuity between infrequent sessions and prepare both parties for better conversations [CSD-C5].

**Driver Intensity**: MEDIUM

**Enablers** (What would help):

- A pre-session brief of priorities, examples and open actions

**Blockers** (What would hinder):

- Mentee not sharing; briefs that arrive too late

**Related Stakeholders**:

- S-1 mentees

---

### SD-8: Health Service Tenant - Better Use of Specialist Time With Governance Intact

**Stakeholder**: S-4 Tenant organisations (health services)

**Driver Category**: STRATEGIC

**Driver Statement**: "We need evidence that this improves consultations without creating clinical risk, integration work or a privacy incident with our name on it."

**Context & Background**: Specialist capacity is scarce. Health services must satisfy clinical governance committees and carry duty-of-care expectations, including when patients disclose risk.

**Driver Intensity**: HIGH

**Enablers** (What would help):

- A clear intended purpose and regulatory position; a clinical safety case
- Pilot metrics on consultation quality

**Blockers** (What would hinder):

- Unclear responsibility for safety disclosures (Conflict C-4 in the requirements)
- Integration demands on clinical systems

**Related Stakeholders**:

- S-7 clinical safety lead (aligned); S-1 participants (tension over escalation)

---

### SD-9: Employer Sponsor - Evidence the Programme Is Worth Funding

**Stakeholder**: S-4 Tenant organisations (employers), S-5 coordinators

**Driver Category**: FINANCIAL

**Driver Statement**: "I have to justify the mentoring budget every year. I need to show it is used and that it works."

**Context & Background**: Learning and development budgets are scrutinised; sponsors usually rely on individual progress data to show value.

**Driver Intensity**: HIGH

**Enablers** (What would help):

- Aggregate participation and progress indicators
- Voluntary, participant-authored end-of-programme summaries

**Blockers** (What would hinder):

- Aggregate-only reporting perceived as "no reporting"

**Related Stakeholders**:

- Conflicts with SD-4 (mentees)

---

### SD-10: Executive Sponsor - Prove the Platform Thesis and Reach Revenue

**Stakeholder**: S-11 Executive sponsor and product owner

**Driver Category**: STRATEGIC

**Driver Statement**: "We need to show investors that one core serves two very different domains, and land paying customers, before the money runs out."

**Context & Background**: The roadmap proves the platform against two materially different packs [CSD-C4]. The buyer and operating model is still an open question [CSD-C3], which adds commercial uncertainty.

**Driver Intensity**: CRITICAL

**Enablers** (What would help):

- A credible pilot on time; a clear operating model
- Differentiation through trust and evidence-backed outputs

**Blockers** (What would hinder):

- Regulatory delays; scope creep from early customers

**Related Stakeholders**:

- S-13 commercial lead (aligned); S-7 and S-10 (pace tension)

---

### SD-11: Commercial Lead - Winning the First Customers

**Stakeholder**: S-13 Commercial and partnerships lead

**Driver Category**: CUSTOMER

**Driver Statement**: "Every early customer will ask for something special. I need to say yes to enough of it to close."

**Context & Background**: First tenants carry disproportionate weight; requests for customisation, visibility and integrations are likely.

**Driver Intensity**: HIGH

**Enablers** (What would help):

- A clear list of non-negotiables and of what packs can configure

**Blockers** (What would hinder):

- Principles perceived as obstacles rather than selling points

**Related Stakeholders**:

- S-10 architecture owner (domain-free core), S-8 privacy officer

---

### SD-12: Architecture Owner - A Principled, Portable, Explainable Platform

**Stakeholder**: S-10 Architecture owner and ARB

**Driver Category**: STRATEGIC

**Driver Statement**: "If the core picks up domain vocabulary, cloud lock-in or model-driven decisions now, we will never get them out."

**Context & Background**: The principles set a domain-free core, deterministic decisions, residency by policy and Kubernetes portability. Early shortcuts are the usual way these erode.

**Driver Intensity**: HIGH

**Enablers** (What would help):

- Automated enforcement (vocabulary lint, SDK import checks, residency policy)
- The mentorship pack as a real abstraction test

**Blockers** (What would hinder):

- Deadline pressure; customer-specific requests in the core

**Related Stakeholders**:

- S-12 engineering (aligned on quality, tension on effort); S-13 commercial

---

### SD-13: Clinical Safety and Regulatory Lead - Safe Use and No Regulatory Drift

**Stakeholder**: S-7 Clinical safety and regulatory lead

**Driver Category**: COMPLIANCE

**Driver Statement**: "I must be able to show, at any time, that the Parkinson's pack is safe and still inside its intended purpose."

**Context & Background**: Motor and voice features could bring the pack within medical device regulation. A single interpretive sentence in a brief can change the regulatory position.

**Driver Intensity**: CRITICAL

**Enablers** (What would help):

- Deterministic rules, cited outputs, a core safety floor, evaluation gates (P2, P3, P7, P21)
- An intended-purpose determination before enrolment

**Blockers** (What would hinder):

- Pressure to show derived features or "insights"
- Unclear escalation duties

**Related Stakeholders**:

- S-14 regulators; S-11 (pace tension)

---

### SD-14: Privacy Officer - Lawful Handling and No Breach

**Stakeholder**: S-8 Privacy officer

**Driver Category**: COMPLIANCE

**Driver Statement**: "Health information, memory profiles and media in many data planes is a large attack and compliance surface. I need it minimised and provable."

**Context & Background**: The Privacy Act, the Notifiable Data Breaches scheme and state health records laws apply, and automated-decision transparency obligations begin in December 2026.

**Driver Intensity**: CRITICAL

**Enablers** (What would help):

- Consent as data; residency by policy; on-device first; content-free telemetry

**Blockers** (What would hinder):

- Memory features that infer and retain profiles
- Third-party services outside approved regions

**Related Stakeholders**:

- S-1 participants (aligned); S-11 product (personalisation tension)

---

### SD-15: Engineering and Delivery Team - Deliverable Scope and Manageable Complexity

**Stakeholder**: S-12 Engineering and delivery team

**Driver Category**: OPERATIONAL

**Driver Statement**: "We can build a principled platform or a fast pilot. Asked for both in six months, we need the scope to be honest."

**Context & Background**: The core plus a regulated pack, mobile apps, a memory service and multi-cloud adapters is a large first phase for a small team.

**Driver Intensity**: HIGH

**Enablers** (What would help):

- A modular monolith first; one cloud first; the null memory provider as fallback

**Blockers** (What would hinder):

- Premature abstraction; late regulatory findings forcing rework

**Related Stakeholders**:

- S-10 (aligned on quality), S-11 (timeline tension)

---

### SD-16: Platform Operator - Operable Data Planes

**Stakeholder**: S-9 Platform operator and SRE

**Driver Category**: OPERATIONAL

**Driver Statement**: "Every tenant data plane and every certified configuration is something I have to patch, back up and be woken up for."

**Context & Background**: Per-tenant and regulated data planes multiply operational load.

**Driver Intensity**: MEDIUM

**Enablers** (What would help):

- Everything as code; a small set of certified configurations; runbooks

**Blockers** (What would hinder):

- Bespoke per-customer infrastructure; no break-glass tooling

**Related Stakeholders**:

- S-12 engineering

---

### SD-17: Pack Authors - Change Content Without Waiting for Engineers

**Stakeholder**: S-6 Pack authors and domain owners

**Driver Category**: OPERATIONAL

**Driver Statement**: "Clinicians on the advisory group will not wait weeks to fix a question's wording or a rule threshold."

**Context & Background**: Pack authors are domain experts with limited time; their credibility depends on the pack's content.

**Driver Intensity**: MEDIUM

**Enablers** (What would help):

- Declarative packs; fast evaluation feedback

**Blockers** (What would hinder):

- Rules that need code; slow certification

**Related Stakeholders**:

- S-7 (certification rigour), S-12

---

### SD-18: Regulators - Compliance With Therapeutic Goods and Privacy Law

**Stakeholder**: S-14 Regulators (TGA, OAIC, state regulators)

**Driver Category**: COMPLIANCE

**Driver Statement**: Software that functions as a medical device is regulated as one, and personal and health information is handled lawfully.

**Context & Background**: Regulators rarely engage with a pilot proactively; interest rises sharply after a complaint or breach.

**Driver Intensity**: HIGH

**Enablers** (What would help):

- Documented intended purpose; privacy impact assessments; breach readiness

**Blockers** (What would hinder):

- Undocumented feature drift

**Related Stakeholders**:

- S-7, S-8

---

### SD-19: Advocacy Organisations - Patient Benefit Without Exploitation

**Stakeholder**: S-17 Patient and consumer advocacy organisations

**Driver Category**: CUSTOMER

**Driver Statement**: "Tools for people with Parkinson's must be designed with them, be accessible, and never monetise their data."

**Context & Background**: Advocacy groups influence participant trust and recruitment, and speak publicly about harmful products.

**Driver Intensity**: MEDIUM

**Enablers** (What would help):

- Co-design; plain-language consent; no secondary use without consent (DR-012)

**Blockers** (What would hinder):

- Opaque AI; engagement mechanics

**Related Stakeholders**:

- S-1 participants

---

## Driver-to-Goal Mapping

### Goal G-1: Prepared Specialist Visits in the Parkinson's Pilot

**Derived From Drivers**: SD-1, SD-6, SD-8, SD-10

**Goal Owner**: S-11 Executive sponsor and product owner

**Goal Statement**: By December 2027 (pilot month 6), at least 70% of scheduled specialist visits for active pilot participants are preceded by a participant-approved brief.

**Why This Matters**: This is the core value proposition. It shows participants are heard (SD-1), gives clinicians structured information (SD-6), and gives the health service and investors evidence (SD-8, SD-10).

**Success Metrics**:

- **Primary Metric**: Share of scheduled visits with an approved brief shared at least 48 hours before
- **Secondary Metrics**:
  - Participants agreeing the brief reflects what they wanted to raise (target 80% or more)
  - Briefs approved without participant edits to extracted content (quality signal)

**Baseline**: 0% (no structured pre-visit brief exists today)

**Target**: 70% or more

**Measurement Method**: Workflow, approval and share records; participant survey at visits 1 and 2

**Dependencies**:

- Health service tenant and participating clinicians (see requirements dependencies)
- Regulatory determination (G-4) and floor approval (G-5)

**Risks to Achievement**:

- Participants lose momentum between visits
- Visit dates are not known to the system, so briefs arrive late

---

### Goal G-2: Low Effort, Low Drop-Out

**Derived From Drivers**: SD-3, SD-19

**Goal Owner**: S-11 Product owner

**Goal Statement**: Throughout the pilot, at least 80% of participants rate effort as acceptable, no more than 10% withdraw because of burden, and 100% of evaluation personas stay within pack burden budgets.

**Why This Matters**: Participants with limited energy will only keep recording if it costs little (SD-3); advocacy groups judge the product on this (SD-19).

**Success Metrics**:

- **Primary Metric**: Share rating effort acceptable (quarterly survey)
- **Secondary Metrics**:
  - Withdrawals citing burden
  - Median participant time per week (target 10 minutes or less)

**Baseline**: Not yet measured; to be set with a paper-diary comparison group in Phase 0 research

**Target**: As stated above

**Measurement Method**: Surveys; exit interviews; budget telemetry (content-free)

**Dependencies**:

- Voice capture accuracy (requirements risk R-2); one-tap confirmation (FR-012)

**Risks to Achievement**:

- Pack authors add asks to improve coverage (conflict with SD-13 and SD-17)

---

### Goal G-3: No Disclosure Without Approval

**Derived From Drivers**: SD-2, SD-4, SD-14

**Goal Owner**: S-8 Privacy officer

**Goal Statement**: From the first pilot enrolment onward, zero disclosures occur without a recorded participant approval, and revocation takes effect within 60 seconds in 100% of tests.

**Why This Matters**: Trust is the precondition for honest recording (SD-2, SD-4) and the privacy officer's core accountability (SD-14).

**Success Metrics**:

- **Primary Metric**: Unauthorised disclosure incidents (target zero)
- **Secondary Metrics**:
  - Outbound flows with a matching approval record (target 100%)
  - Participant-reported trust (target 4 out of 5 or more)

**Baseline**: Not applicable (new service)

**Target**: As stated above

**Measurement Method**: Automated approval reconciliation; isolation tests; incident register; survey

**Dependencies**:

- FR-032, FR-036 and FR-041 implemented and tested

**Risks to Achievement**:

- Buyer pressure for escalation or visibility (G-9 and requirements Conflict C-4)

---

### Goal G-4: Regulatory Position Settled Before Enrolment

**Derived From Drivers**: SD-13, SD-18, SD-8

**Goal Owner**: S-7 Clinical safety and regulatory lead

**Goal Statement**: By December 2026, the Parkinson's pack's intended purpose and regulatory classification are documented and reviewed. Through the pilot, clinical safety reviews find zero changes outside the intended purpose.

**Why This Matters**: Protects participants and the health service, and avoids a late finding that halts the pilot (SD-13, SD-18, SD-8).

**Success Metrics**:

- **Primary Metric**: Determination documented and signed off before enrolment
- **Secondary Metrics**:
  - Intended-purpose gate failures caught in CI rather than in production

**Baseline**: No determination exists

**Target**: Signed determination; zero drift findings

**Measurement Method**: Gate review records; release review evidence

**Dependencies**:

- Regulatory advice; clinical advisory group

**Risks to Achievement**:

- The determination concludes the pack is a device, adding lifecycle work (requirements risk R-1)

---

### Goal G-5: A Safety Floor That Never Misses

**Derived From Drivers**: SD-13, SD-1, SD-8

**Goal Owner**: S-7 Clinical safety and regulatory lead

**Goal Statement**: Floor content is clinically approved before enrolment, and every release from then on has zero critical misses on the curated floor regression suite.

**Why This Matters**: A single miss could harm a participant and end the product (SD-13, SD-1, SD-8).

**Success Metrics**:

- **Primary Metric**: Critical misses per release (target zero)
- **Secondary Metrics**:
  - Floor response time within 1 second (95th percentile)

**Baseline**: No floor exists

**Target**: Zero misses; approved content

**Measurement Method**: Regression suite results; safety event reviews

**Dependencies**:

- Clinical approval; escalation policy (requirements Conflict C-4)

**Risks to Achievement**:

- Unclear responsibilities after a floor event

---

### Goal G-6: Briefs Reviewers Actually Use

**Derived From Drivers**: SD-6, SD-7, SD-8

**Goal Owner**: S-6 Pack authors (with clinician and mentor reviewers)

**Goal Statement**: During the pilot, at least 80% of reviewers open shared briefs, reviewers rate usefulness at 4 out of 5 or more, and the clinician brief can be read in 2 minutes or less.

**Why This Matters**: A brief nobody opens delivers nothing (SD-6, SD-7).

**Success Metrics**:

- **Primary Metric**: Share of shared briefs opened before the visit
- **Secondary Metrics**:
  - Reviewer-rated usefulness; reading time in usability tests

**Baseline**: Not applicable

**Target**: As stated above

**Measurement Method**: Access logs; reviewer survey; think-aloud usability testing

**Dependencies**:

- Delivery channel acceptable to clinicians (secure link; clinical system later)

**Risks to Achievement**:

- Clinicians decline for medico-legal reasons

---

### Goal G-7: Mentorship Pack on the Same Core

**Derived From Drivers**: SD-10, SD-12, SD-15

**Goal Owner**: S-10 Architecture owner

**Goal Statement**: By June 2028, the mentorship pack is in production with zero core changes that introduce domain vocabulary.

**Why This Matters**: Proves the platform thesis to investors (SD-10) and keeps the architecture honest (SD-12, SD-15).

**Success Metrics**:

- **Primary Metric**: Core changes with domain vocabulary (target zero)
- **Secondary Metrics**:
  - Share of mentorship effort spent in the pack rather than the core

**Baseline**: Not applicable

**Target**: Zero

**Measurement Method**: Vocabulary lint; code review; effort tracking

**Dependencies**:

- An employer tenant for Phase 2

**Risks to Achievement**:

- Phase 1 shortcuts that baked Parkinson's assumptions into the core

---

### Goal G-8: Residency and Portability Proven

**Derived From Drivers**: SD-12, SD-14, SD-8

**Goal Owner**: S-10 Architecture owner

**Goal Statement**: From the first deployment, zero residency violations; by December 2028, a second cloud is certified without a product fork.

**Why This Matters**: Buyers choose clouds and regions for governance reasons (SD-8), and residency is a privacy commitment (SD-14).

**Success Metrics**:

- **Primary Metric**: Residency policy violations (target zero)
- **Secondary Metrics**:
  - Code changes outside adapters needed for the second cloud (target zero)

**Baseline**: Not applicable

**Target**: As stated above

**Measurement Method**: Cloud policy reports; Phase 3 portability test

**Dependencies**:

- Residency-compliant models in approved regions (requirements risk R-3)

**Risks to Achievement**:

- Managed services that route data outside approved regions

---

### Goal G-9: Employer Programmes Without Individual Exposure

**Derived From Drivers**: SD-4, SD-9, SD-16

**Goal Owner**: S-11 Product owner (with S-8)

**Goal Statement**: In the first mentorship cohort (Phase 2), zero individual data flows reach managers or HR without per-share approval, and sponsors rate programme evidence (aggregates plus voluntary summaries) at 4 out of 5 or more.

**Why This Matters**: Satisfies mentees' safety (SD-4) while giving sponsors enough evidence to keep funding (SD-9).

**Success Metrics**:

- **Primary Metric**: Unapproved individual flows (target zero)
- **Secondary Metrics**:
  - Share of mentees who voluntarily share an end-of-programme summary

**Baseline**: Not applicable

**Target**: As stated above

**Measurement Method**: Approval reconciliation; sponsor survey

**Dependencies**:

- Contract terms agreed with the employer before launch

**Risks to Achievement**:

- Sponsor rejects aggregate-only reporting

---

### Goal G-10: Pack Changes Without Core Engineering

**Derived From Drivers**: SD-17, SD-15, SD-12

**Goal Owner**: S-6 Pack authors

**Goal Statement**: By the end of Phase 2, pack authors change wording, thresholds and asks without core engineering, and evaluation results return within 1 working day.

**Why This Matters**: Keeps domain experts engaged (SD-17) and the core stable (SD-12, SD-15).

**Success Metrics**:

- **Primary Metric**: Pack changes needing core code (target zero)
- **Secondary Metrics**:
  - Evaluation turnaround time

**Baseline**: Not applicable

**Target**: As stated above

**Measurement Method**: Change records; pipeline metrics

**Dependencies**:

- Declarative pack contract; evaluation harness (FR-047)

**Risks to Achievement**:

- Pack language grows into a programming language

---

### Goal G-11: First Paying Tenants

**Derived From Drivers**: SD-10, SD-11

**Goal Owner**: S-13 Commercial lead

**Goal Statement**: By the end of the pilot (December 2027), one health service has signed a paid agreement beyond the pilot, and by June 2028 one employer tenant has signed, both on terms that match the principles.

**Why This Matters**: Revenue and proof of market for investors (SD-10, SD-11).

**Success Metrics**:

- **Primary Metric**: Signed paid tenants
- **Secondary Metrics**:
  - Contract clauses requiring principle exceptions (target zero)

**Baseline**: Zero

**Target**: Two tenants

**Measurement Method**: Contract register

**Dependencies**:

- G-1 and G-6 results; the buyer and operating model decided [CSD-C3]

**Risks to Achievement**:

- Buyers insist on visibility or escalation that conflicts with P4

---

## Goal-to-Outcome Mapping

Financial values are not yet quantified. The business case (`/arckit:sobc`) should estimate them.

### Outcome O-1: Better-Prepared Consultations

**Supported Goals**: G-1, G-6

**Outcome Statement**: Specialist and mentoring sessions start from a shared, cited picture, saving time spent reconstructing history.

**Measurement Details**:

- **KPI**: Clinician-reported minutes saved per consultation, and participant "felt heard" score
- **Current Value**: Not measured
- **Target Value**: 3 minutes or more saved (proposed); 80% or more of participants feel heard
- **Measurement Frequency**: Per visit during the pilot; quarterly after
- **Data Source**: Reviewer and participant surveys; approval records
- **Report Owner**: S-11 Product owner

**Business Value**:

- **Financial Impact**: Better use of scarce specialist time (to be quantified with the health service)
- **Strategic Impact**: The core proof point for the product
- **Operational Impact**: Fewer missed issues; better-focused consultations
- **Customer Impact**: Participants feel heard; reviewers trust the information

**Timeline**:

- **Phase 1 (Months 1-3)**: Brief prototype tested with 5 or more clinicians
- **Phase 2 (Months 4-6)**: Pilot live; 50% of visits with a brief
- **Phase 3 (Months 7-12)**: 70% of visits with a brief; usefulness 4 out of 5 or more
- **Sustainment (Year 2+)**: Maintained across new tenants

**Stakeholder Benefits**:

- **S-1 Participants**: Their concerns are raised and recorded
- **S-3 Reviewers**: Structured, trustworthy information
- **S-4 Health services**: Evidence of value

**Leading Indicators** (early signals of success):

- Weekly recording continues past month 2
- Briefs opened before visits

**Lagging Indicators** (final proof of success):

- Minutes saved; renewal by the health service

---

### Outcome O-2: A Platform Participants Trust

**Supported Goals**: G-2, G-3, G-9

**Outcome Statement**: Participants keep using Cairn and recommend it, because it respects their control and energy.

**Measurement Details**:

- **KPI**: Trust score and withdrawal rate
- **Current Value**: Not applicable
- **Target Value**: Trust 4 out of 5 or more; withdrawals for privacy or burden 10% or less
- **Measurement Frequency**: Quarterly
- **Data Source**: Surveys; withdrawal reasons
- **Report Owner**: S-8 Privacy officer

**Business Value**:

- **Financial Impact**: Lower recruitment cost per retained participant
- **Strategic Impact**: Trust as the differentiator against engagement-driven competitors
- **Operational Impact**: Fewer complaints
- **Customer Impact**: Advocacy organisations willing to recommend Cairn

**Timeline**:

- **Phase 1 (Months 1-3)**: Co-design sessions validate consent and sharing flows
- **Phase 2 (Months 4-6)**: Trust measured at pilot start
- **Phase 3 (Months 7-12)**: Targets met at pilot end
- **Sustainment (Year 2+)**: Maintained with mentees in employer programmes

**Stakeholder Benefits**:

- **S-1 Participants**: Control and low effort
- **S-17 Advocacy organisations**: Confidence to recommend

**Leading Indicators** (early signals of success):

- Consent completion rate at onboarding; approval rather than rejection of briefs

**Lagging Indicators** (final proof of success):

- Withdrawal rate; referrals by participants

---

### Outcome O-3: Safe and Compliant Operation

**Supported Goals**: G-3, G-4, G-5

**Outcome Statement**: The pilot runs with no participant harm attributable to Cairn, no notifiable data breach and no regulatory finding.

**Measurement Details**:

- **KPI**: Critical safety misses, notifiable breaches, regulatory findings
- **Current Value**: Not applicable
- **Target Value**: Zero of each
- **Measurement Frequency**: Monthly
- **Data Source**: Safety event reviews; incident register
- **Report Owner**: S-7 Clinical safety lead

**Business Value**:

- **Financial Impact**: Avoids remediation, penalties and pilot suspension
- **Strategic Impact**: Licence to operate in health
- **Operational Impact**: Predictable releases
- **Customer Impact**: Health service governance satisfied

**Timeline**:

- **Phase 1 (Months 1-3)**: Determination, privacy impact assessment and floor approval complete
- **Phase 2 (Months 4-6)**: Monthly safety reviews with zero critical findings
- **Phase 3 (Months 7-12)**: Pilot closes with a clean safety record
- **Sustainment (Year 2+)**: Certification evidence reused for new tenants

**Stakeholder Benefits**:

- **S-7, S-8**: Accountabilities met
- **S-4**: Clinical governance satisfied

**Leading Indicators** (early signals of success):

- Floor regression suite green on every release

**Lagging Indicators** (final proof of success):

- Clean incident register at pilot end

---

### Outcome O-4: Platform Thesis Proven

**Supported Goals**: G-7, G-10

**Outcome Statement**: Two very different domains run on one unchanged core, and new packs can be built mainly as configuration.

**Measurement Details**:

- **KPI**: Domain-specific core changes; time to launch a new pack
- **Current Value**: Not applicable
- **Target Value**: Zero changes; 3 months or less to launch a pack (proposed, Phase 4)
- **Measurement Frequency**: Per phase gate
- **Data Source**: Code review, vocabulary lint, delivery records
- **Report Owner**: S-10 Architecture owner

**Business Value**:

- **Financial Impact**: Lower marginal cost per domain
- **Strategic Impact**: Investor confidence; a platform rather than a single product
- **Operational Impact**: Fewer core releases
- **Customer Impact**: Faster availability for new programmes

**Timeline**:

- **Phase 1 (Months 1-3)**: Pack contract published
- **Phase 2 (Months 4-6)**: Parkinson's pack runs with no domain code in the core
- **Phase 3 (Months 7-12)**: Mentorship pack in build without core changes
- **Sustainment (Year 2+)**: Third domain in Phase 4

**Stakeholder Benefits**:

- **S-11**: Investor story; **S-10, S-12**: A maintainable core

**Leading Indicators** (early signals of success):

- Vocabulary lint clean; pack authors editing without engineers

**Lagging Indicators** (final proof of success):

- Mentorship in production on the same core

---

### Outcome O-5: Commercial Traction

**Supported Goals**: G-1, G-9, G-11

**Outcome Statement**: Paying health service and employer tenants on principle-compliant terms.

**Measurement Details**:

- **KPI**: Paying tenants; contract exceptions to principles
- **Current Value**: Zero tenants
- **Target Value**: Two paying tenants by mid-2028; zero exceptions
- **Measurement Frequency**: Quarterly
- **Data Source**: Contract register
- **Report Owner**: S-13 Commercial lead

**Business Value**:

- **Financial Impact**: First revenue (to be quantified in the business case)
- **Strategic Impact**: Market proof in two segments
- **Operational Impact**: Repeatable contract templates
- **Customer Impact**: Reference customers

**Timeline**:

- **Phase 1 (Months 1-3)**: Pilot agreement with a health service
- **Phase 2 (Months 4-6)**: Commercial terms drafted
- **Phase 3 (Months 7-12)**: First paid agreement
- **Sustainment (Year 2+)**: Employer tenant; renewals

**Stakeholder Benefits**:

- **S-11, S-13**: Revenue and references

**Leading Indicators** (early signals of success):

- Letters of intent; pilot extension requests

**Lagging Indicators** (final proof of success):

- Signed contracts and renewals

---

### Outcome O-6: Portable, Compliant Operations

**Supported Goals**: G-8

**Outcome Statement**: Cairn runs in each customer's chosen cloud and region with proven residency and predictable operations.

**Measurement Details**:

- **KPI**: Residency violations; availability; certified clouds
- **Current Value**: Not applicable
- **Target Value**: Zero violations; 99.5% (pilot) and 99.9% (production) availability; two certified clouds by December 2028
- **Measurement Frequency**: Monthly
- **Data Source**: Cloud policy reports; uptime monitoring
- **Report Owner**: S-9 Platform operator

**Business Value**:

- **Financial Impact**: Wider market; no cloud-specific fork to maintain
- **Strategic Impact**: Meets buyers' sovereignty requirements
- **Operational Impact**: Reproducible data planes
- **Customer Impact**: Data stays where the customer requires

**Timeline**:

- **Phase 1 (Months 1-3)**: Residency policy as code on the first cloud
- **Phase 2 (Months 4-6)**: Pilot data plane passes residency attestation
- **Phase 3 (Months 7-12)**: Availability target met in the pilot
- **Sustainment (Year 2+)**: Second cloud certified

**Stakeholder Benefits**:

- **S-8**: Provable residency; **S-4**: Cloud choice; **S-9**: Fewer bespoke environments

**Leading Indicators** (early signals of success):

- Policy-as-code coverage; drift alerts resolved within a day

**Lagging Indicators** (final proof of success):

- Monthly residency attestations clean; second cloud certified

---

## Complete Traceability Matrix

### Stakeholder → Driver → Goal → Outcome

| Stakeholder | Driver ID | Driver Summary | Goal ID | Goal Summary | Outcome ID | Outcome Summary |
|-------------|-----------|----------------|---------|--------------|------------|-----------------|
| S-1 Participants | SD-1 | Be heard in short visits | G-1 | 70% of visits with approved brief | O-1 | Better-prepared consultations |
| S-1 Participants | SD-2 | Control over sensitive information | G-3 | Zero disclosure without approval | O-2 | A platform participants trust |
| S-1 Participants | SD-3 | Limited energy | G-2 | Low effort, low drop-out | O-2 | A platform participants trust |
| S-1 Mentees | SD-4 | Psychological safety | G-3, G-9 | No individual exposure to employer | O-2 | A platform participants trust |
| S-2 Contributors | SD-5 | Help without overstepping | G-3 | Scoped contributor access | O-2 | A platform participants trust |
| S-3 Clinicians | SD-6 | Trustworthy one-page information | G-6 | Briefs reviewers use | O-1 | Better-prepared consultations |
| S-3 Mentors | SD-7 | Continuity between sessions | G-6 | Briefs reviewers use | O-1 | Better-prepared consultations |
| S-4 Health services | SD-8 | Value with governance intact | G-1, G-4, G-5 | Prepared visits; settled regulation; safe floor | O-1, O-3 | Better consultations; safe operation |
| S-4 Employers, S-5 Coordinators | SD-9 | Evidence the programme works | G-9 | Aggregates plus voluntary summaries | O-5 | Commercial traction |
| S-11 Executive sponsor | SD-10 | Prove thesis; reach revenue | G-1, G-7, G-11 | Pilot, mentorship pack, paying tenants | O-4, O-5 | Thesis proven; traction |
| S-13 Commercial lead | SD-11 | Win first customers | G-11 | Two paying tenants on compliant terms | O-5 | Commercial traction |
| S-10 Architecture owner | SD-12 | Principled, portable platform | G-7, G-8, G-10 | Same core; residency; pack autonomy | O-4, O-6 | Thesis proven; portable operations |
| S-7 Clinical safety lead | SD-13 | Safety and no regulatory drift | G-4, G-5 | Settled regulation; safe floor | O-3 | Safe and compliant operation |
| S-8 Privacy officer | SD-14 | Lawful handling, no breach | G-3, G-8 | No unapproved disclosure; residency | O-2, O-3, O-6 | Trust; compliance; residency |
| S-12 Engineering | SD-15 | Deliverable scope | G-7, G-10 | Same core; pack autonomy | O-4 | Thesis proven |
| S-9 Platform operator | SD-16 | Operable data planes | G-8 | Residency and portability | O-6 | Portable operations |
| S-6 Pack authors | SD-17 | Change content without engineers | G-10 | Pack changes without core code | O-4 | Thesis proven |
| S-14 Regulators | SD-18 | Compliance with law | G-4, G-3 | Settled regulation; no unapproved disclosure | O-3 | Safe and compliant operation |
| S-17 Advocacy organisations | SD-19 | Benefit without exploitation | G-2, G-3 | Low effort; control | O-2 | A platform participants trust |

### Conflict Analysis

**Competing Drivers**:

- **Conflict 1**: Employer sponsors (SD-9) want evidence that often relies on individual progress data, but mentees (SD-4) will not reflect honestly if individual content can reach their employer.
  - **Resolution Strategy**: Aggregates above a minimum cohort, plus optional participant-authored summaries shared only by per-recipient approval (requirements Conflict C-8). Agree this in the contract before launch; the commercial lead presents it as a trust feature.

- **Conflict 2**: Health services (SD-8) carry duty-of-care expectations when a patient discloses risk, but participants (SD-2) require that nothing is shared without approval.
  - **Resolution Strategy**: Safety escalation only through consent agreed at enrolment, and legally compelled disclosure through a documented legal process (requirements Conflict C-4). Legal advice in Phase 0; the health service's clinical governance committee agrees the protocol before the pilot.

- **Conflict 3**: The executive sponsor and commercial lead (SD-10, SD-11) want a fast pilot, but clinical safety (SD-13) needs the regulatory determination and floor approval first, and architecture (SD-12) wants no shortcuts in the core.
  - **Resolution Strategy**: Phase the work. Regulatory and safety work runs in Phase 0 in parallel with the build. Pilot scope is reduced (secure links rather than clinical integration; the null memory provider if the Hindsight spike fails) rather than skipping gates.

- **Conflict 4**: Clinicians (SD-6) want less information, but participants (SD-1) want everything they said to be heard.
  - **Resolution Strategy**: The participant chooses what goes into a one-page brief. The full cited evidence stays available on request but is not pushed to the clinician.

- **Conflict 5**: Pack authors and clinical safety (SD-17, SD-13) want complete coverage, but participants (SD-3) have limited energy.
  - **Resolution Strategy**: The burden budget is enforced by the core and cannot be exceeded by packs. Coverage gaps are reported honestly ("not asked") rather than chased.

- **Conflict 6**: The product owner (SD-10) wants memory-driven personalisation, but the privacy officer (SD-14) wants minimal inferred profiling.
  - **Resolution Strategy**: Memory is internal context only; participants can see and delete it; regulated packs are limited to communication preferences (requirements Conflicts C-2 and C-6).

**Synergies**:

- **Synergy 1**: Participants' need for control (SD-2) aligns with the privacy officer's compliance driver (SD-14) and with the commercial lead's need for differentiation (SD-11). Participant-approved sharing satisfies all three.
- **Synergy 2**: Clinicians' need for trustworthy information (SD-6) aligns with clinical safety's need to prevent drift (SD-13) and with regulators (SD-18). Cited, deterministic briefs satisfy all three.
- **Synergy 3**: Participants' limited energy (SD-3) aligns with on-device processing and low running cost (SD-14, SD-16): fewer asks and less uploaded media mean less data to protect and operate.
- **Synergy 4**: The architecture owner's domain-free core (SD-12) aligns with pack authors' autonomy (SD-17) and with the executive sponsor's platform thesis (SD-10).

---

## Communication & Engagement Plan

### Engagement Summary

| Stakeholder | Frequency | Channel | Influence Strategy |
|-------------|-----------|---------|--------------------|
| S-11 Executive sponsor and product owner | Fortnightly | Steering meeting; one-page dashboard | Frame principles as risk reduction and differentiation; bring decisions, not problems |
| S-10 Architecture owner and ARB | Monthly (ad hoc for conflicts) | ARB meeting; ADRs | Decision authority; use conflict records from the requirements |
| S-7 Clinical safety and regulatory lead | Fortnightly in Phase 0–1 | Gate reviews; safety case updates | Early involvement in every feature touching briefs or features |
| S-8 Privacy officer | Fortnightly in Phase 0–1 | Privacy reviews; consent flow walkthroughs | Sign-off on consent model before build |
| S-4 Tenant organisations | Monthly | Account meetings; pilot reports | Agree pilot protocol and data terms before contract |
| S-1 Participants | Monthly in pilot; co-design sessions in Phase 0 | In-app updates; co-design workshops; surveys | Co-design; visible changes made from their feedback |
| S-3 Reviewers | Monthly in pilot | Short sessions at clinic or programme meetings; brief samples | Show the brief saves time; ask for one change each round |
| S-6 Pack authors | Fortnightly | Pack review sessions; evaluation reports | Show evaluation results; fast turnaround on changes |
| S-12 Engineering and delivery team | Weekly | Sprint reviews; ADRs | Honest scope; automated guardrails instead of manual policing |
| S-13 Commercial lead | Monthly | Briefing; contract templates | Non-negotiables as selling points; early warning on customer asks |
| S-9 Platform operator | Monthly | Operability reviews; runbook reviews | Small set of certified configurations |
| S-16 Employer managers and HR | Once per programme, plus on request | Programme briefing pack | Clear explanation of what they will and will not see |
| S-17 Advocacy organisations | Quarterly | Advisory meetings | Co-design of wording and consent; no data use without consent |
| S-5 Programme coordinators | Monthly in programmes | Coordinator guide; dashboard demos | Aggregates that answer their real questions |
| S-2 Contributors | At invitation and on change | In-product explanations | Clear scope of what they can see |
| S-14 Regulators | As required | Formal correspondence | Documented determination; breach readiness |
| S-15 Technology suppliers | Quarterly | Contract and release reviews | Residency and no-training terms; pinned versions |

### Stakeholder-Specific Messaging

#### S-11 Executive Sponsor and Product Owner

**Primary Message**: The principles are how Cairn wins trust-sensitive buyers, and the fastest safe route to a pilot is running regulatory and safety work in parallel with the build.

**Key Talking Points**:

- Two domains on one core is the investor story; protecting the core now protects it
- A reduced but honest pilot scope beats a delayed or suspended pilot
- Buyer objections to aggregate-only reporting are best handled before contract

**Communication Frequency**: Bi-weekly

**Preferred Channel**: Meetings and a one-page dashboard

**Success Story**: The pilot launches on schedule with a signed regulatory determination and a health service asking to extend.

#### S-1 Participants

**Primary Message**: Cairn remembers so you do not have to, and nothing leaves without your say.

**Key Talking Points**:

- Speak or type in a minute or two; skip whenever you like
- You approve every item before anyone sees it, and you can see who looked
- Cairn does not diagnose or score you

**Communication Frequency**: Monthly during the pilot

**Preferred Channel**: In-app messages, co-design workshops

**Success Story**: "I finally got to talk about my sleep, and my specialist had already read it."

#### S-3 Clinician Reviewers

**Primary Message**: One page, in the patient's words, every statement linked to what they said.

**Key Talking Points**:

- No interpretation, no scores, no alerts that imply you must act
- "Not asked" is shown separately from "not reported"
- It arrives before the visit, via a secure link

**Communication Frequency**: Monthly during the pilot

**Preferred Channel**: Short in-person sessions; sample briefs

**Success Story**: A clinician says the brief saved the first five minutes of the consultation.

#### S-4 Tenant Organisations

**Primary Message**: Better-prepared sessions and programme evidence without owning a privacy risk.

**Key Talking Points**:

- Health services: a clear intended purpose, a clinical safety case and agreed escalation protocol
- Employers: aggregates and voluntary participant summaries; no individual visibility by design
- Data stays in your approved regions

**Communication Frequency**: Monthly

**Preferred Channel**: Account meetings and pilot reports

**Success Story**: The tenant renews and refers another programme.

#### S-7 Clinical Safety and S-8 Privacy Officer

**Primary Message**: The architecture gives you enforceable controls: deterministic rules, cited outputs, a core safety floor, consent as data and residency by policy.

**Key Talking Points**:

- Gates are automated in CI, not left to review alone
- Open legal questions (escalation, statutory retention) are scheduled for Phase 0

**Communication Frequency**: Bi-weekly in Phases 0 and 1

**Preferred Channel**: Gate reviews

**Success Story**: The pilot closes with no critical safety miss and no notifiable breach.

#### S-12 Engineering and S-13 Commercial

**Primary Message**: Guardrails are automated so the team can move fast inside them; customer asks go through the pack, not the core.

**Key Talking Points**:

- Modular monolith first; one cloud first; null memory provider as a safe fallback
- A list of what packs and tenants can configure, and what is fixed

**Communication Frequency**: Weekly (engineering); monthly (commercial)

**Preferred Channel**: Sprint reviews; briefing notes

**Success Story**: A customer request is met by configuring a pack with no core change.

---

## Change Impact Assessment

### Impact on Stakeholders

| Stakeholder | Current State | Future State | Change Magnitude | Resistance Risk | Mitigation Strategy |
|-------------|---------------|--------------|------------------|-----------------|---------------------|
| S-1 Participants | Memory, paper notes or nothing | Short voice or text entries; approve briefs | MED | LOW | Co-design; strict burden budget |
| S-2 Contributors | Informal conversations | Scoped contributions | LOW | LOW | Clear scope explanations |
| S-3 Clinicians | History taken in the room | Read a brief before the visit | MED | MED | Keep it to one page; no action-implying alerts |
| S-3 Mentors | Notes from last session | Pre-session brief | LOW | LOW | Show continuity benefit |
| S-4 Health services | No pre-visit patient information | Governed pilot with clinical safety case | MED | MED | Agree protocol and escalation early |
| S-4 Employers | Individual progress reports from mentors | Aggregates and voluntary summaries | HIGH | HIGH | Contract terms; trust framed as a benefit |
| S-6 Pack authors | Content in documents | Declarative packs with evaluation | MED | MED | Tooling and fast feedback |
| S-12 Engineering | Greenfield | Strict automated guardrails | MED | MED | Explain why; automate checks |
| S-13 Commercial | Sell features | Sell trust with fixed boundaries | MED | MED | Non-negotiables as selling points |

### Change Readiness

**Champions** (Enthusiastic supporters):

- S-10 Architecture owner - wrote the principles and the design
- S-8 Privacy officer and S-7 Clinical safety lead - the architecture gives them enforceable controls
- S-17 Advocacy organisations (expected) - participant control and no engagement mechanics

**Fence-sitters** (Neutral, need convincing):

- S-3 Clinicians - convinced by a brief that demonstrably saves time without adding liability
- S-11 Executive sponsor - convinced by a pilot plan that meets dates without skipping gates
- S-6 Pack authors - convinced by fast turnaround on content changes

**Resisters** (Opposed or skeptical):

- S-4 Employer sponsors and S-16 managers and HR - lose individual visibility - strategy: aggregates plus voluntary summaries, agreed in contract
- S-13 Commercial lead (potentially) - fears principles will lose deals - strategy: early briefing and a clear configurable-versus-fixed list
- S-12 Engineering (potentially) - fears over-engineering - strategy: modular monolith, one cloud first, honest scope

---

## Risk Register (Stakeholder-Related)

### Risk R-1: Buyers Reject Participant-First Data Terms

**Related Stakeholders**: S-4, S-16, S-13, S-1

**Risk Description**: Employers or health services insist on individual visibility or automatic escalation as a condition of purchase.

**Impact on Goals**: G-3, G-9, G-11

**Probability**: MEDIUM

**Impact**: HIGH

**Mitigation Strategy**: Present data terms early; offer aggregates, voluntary summaries and consent-based escalation.

**Contingency Plan**: Walk away from terms that break P4; target buyers who value trust.

---

### Risk R-2: Clinicians Do Not Use Briefs

**Related Stakeholders**: S-3, S-4, S-1

**Risk Description**: Clinicians decline to read briefs because of time or medico-legal concerns.

**Impact on Goals**: G-1, G-6

**Probability**: MEDIUM

**Impact**: HIGH

**Mitigation Strategy**: Test brief prototypes with clinicians in Phase 0; agree the clinician's responsibilities with the health service.

**Contingency Plan**: Reposition the brief as participant-held (they bring it to the visit).

---

### Risk R-3: Participants Disengage Between Visits

**Related Stakeholders**: S-1, S-17

**Risk Description**: Recording stops after the novelty fades, especially on low-energy days.

**Impact on Goals**: G-1, G-2

**Probability**: MEDIUM

**Impact**: HIGH

**Mitigation Strategy**: Voice-first capture, burden budget, pre-visit prompts rather than daily nudges.

**Contingency Plan**: Focus the pilot on pre-visit preparation windows rather than continuous diaries.

---

### Risk R-4: Pace Pressure Overrides Gates

**Related Stakeholders**: S-11, S-13, S-7, S-10

**Risk Description**: Commercial or funding pressure leads to launching before the regulatory determination or floor approval.

**Impact on Goals**: G-4, G-5, G-1

**Probability**: MEDIUM

**Impact**: HIGH

**Mitigation Strategy**: Clinical safety lead holds go/no-go veto in the RACI; start Phase 0 regulatory work immediately.

**Contingency Plan**: Reduce pilot scope rather than skip gates.

---

### Risk R-5: Key Roles Not Filled

**Related Stakeholders**: S-11, S-7, S-8

**Risk Description**: The executive sponsor, clinical safety lead or privacy officer are not yet named; decisions stall.

**Impact on Goals**: All

**Probability**: HIGH

**Impact**: MEDIUM

**Mitigation Strategy**: Name role holders in Phase 0; use external advisers where needed.

**Contingency Plan**: The architecture owner escalates unresolved decisions to the executive sponsor with a deadline.

---

### Risk R-6: Advocacy Criticism

**Related Stakeholders**: S-17, S-1

**Risk Description**: Advocacy organisations criticise AI use or data practices publicly.

**Impact on Goals**: G-2, G-3, G-11

**Probability**: LOW

**Impact**: HIGH

**Mitigation Strategy**: Involve advocacy groups in co-design and consent wording from Phase 0.

**Contingency Plan**: Publish plain-language data and AI practices; respond openly.

---

## Governance & Decision Rights

### Decision Authority Matrix (RACI)

| Decision Type | Responsible | Accountable | Consulted | Informed |
|---------------|-------------|-------------|-----------|----------|
| Budget approval | S-11 Product owner | S-11 Executive sponsor | S-10, S-13 | All internal stakeholders |
| Requirements prioritisation | S-11 Product owner | S-11 Executive sponsor | S-10, S-7, S-8, S-1 representatives | S-12, S-13 |
| Architecture decisions and principle exceptions | S-10 Architecture owner | S-10 ARB | S-7, S-8, S-12 | S-11 |
| Requirement conflict resolutions (C-1 to C-11) | S-10 Architecture owner | S-10 ARB | S-7, S-8, S-11, legal counsel | All |
| Safety floor content | S-6 Clinical advisory group | S-7 Clinical safety lead | S-10 | S-11, S-4 |
| Regulatory determination (intended purpose) | S-7 Clinical safety lead | S-11 Executive sponsor | Regulatory adviser, S-6 | S-4, S-10 |
| Consent model and privacy impact assessment | S-8 Privacy officer | S-11 Executive sponsor | S-10, legal counsel, S-17 | S-4 |
| Pack certification | S-6 Pack authors | S-7 (regulated) or S-10 (other packs) | S-12 | S-4, S-9 |
| Certified configurations and model bindings | S-12 Engineering | S-10 ARB | S-9, S-8 | S-11 |
| Tenant contract data terms | S-13 Commercial lead | S-11 Executive sponsor | S-8, S-10 | S-4 |
| Memory provider adoption (Hindsight) | S-12 Engineering | S-10 ARB | S-8, S-7 | S-11 |
| Pilot go/no-go | S-11 Product owner | S-11 Executive sponsor (clinical safety lead holds veto) | S-7, S-8, S-4 | All |

### Escalation Path

1. **Level 1**: Product owner and architecture owner (day-to-day scope and design decisions)
2. **Level 2**: Architecture Review Board, with the clinical safety lead and privacy officer (principle conflicts, safety and privacy decisions)
3. **Level 3**: Executive sponsor (strategic direction, funding, commercial trade-offs). NON-NEGOTIABLE principles cannot be overridden at any level.

---

## Validation & Sign-off

### Stakeholder Review

| Stakeholder | Review Date | Comments | Status |
|-------------|-------------|----------|--------|
| S-10 Architecture owner | Pending | Not yet reviewed | CHANGES_REQUESTED |
| S-11 Executive sponsor | Pending | Role not yet named | CHANGES_REQUESTED |
| S-7 Clinical safety lead | Pending | Role not yet named | CHANGES_REQUESTED |
| S-8 Privacy officer | Pending | Role not yet named | CHANGES_REQUESTED |

### Document Approval

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Project Sponsor | Not yet named | Pending | Pending |
| Business Owner | Not yet named | Pending | Pending |
| Enterprise Architect | Chris McKelt | Pending | Pending |

---

## Appendices

### Appendix A: Stakeholder Interview Summaries

No interviews have been held. Drivers in this document are inferred and must be validated. Recommended Phase 0 interviews:

- 6–8 people living with Parkinson's and 3–4 carers (with an advocacy organisation)
- 4–6 clinicians (GPs and movement-disorder specialists) on brief format and medico-legal concerns
- The pilot health service's clinical governance lead on escalation duties
- 2–3 employer sponsors and 4–6 mentees on visibility expectations
- The executive sponsor and commercial lead on timeline and buyer model

---

### Appendix B: Survey Results

No surveys have been conducted yet. Baseline surveys for G-1, G-2 and G-3 are planned for pilot start.

---

### Appendix C: References

- Architecture principles: `projects/000-global/ARC-000-PRIN-v1.0.md`
- Requirements: `projects/001-cairn/ARC-001-REQ-v1.0.md` (stakeholder IDs, conflicts C-1 to C-11, risks)
- Cairn Solution Design v0.2 (attached to the requirements command; not yet saved in `external/`)

---

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-09-28 | ArcKit AI | Initial draft from principles, requirements and solution design; not yet validated by interviews |

## External References

> This section provides traceability from generated content back to source documents.
> Follow citation instructions in the project's citation reference guide.

### Document Register

| Doc ID | Filename | Type | Source Location | Description |
|--------|----------|------|-----------------|-------------|
| CSD | Cairn_Solution_Design_v0.2.md | Solution Design | Attached to the `/arckit:requirements` command; not yet saved in `001-cairn/external/` | Master platform design v0.2, codename Cairn |

### Citations

| Citation ID | Doc ID | Page/Section | Category | Quoted Passage |
|-------------|--------|--------------|----------|----------------|
| [CSD-C1] | CSD | §9.1 Relationship model | Stakeholder Need | "Where an employer sponsors a mentoring programme, mentoring conversations and reflections should not automatically become performance-management data." |
| [CSD-C2] | CSD | §12 Reference Domain Pack A | Compliance Constraint | "It does not diagnose Parkinson’s, score disease severity or recommend treatment in its initial intended purpose." |
| [CSD-C3] | CSD | §21.1 Open questions | Stakeholder Need | "Who is the platform buyer/operator: direct-to-consumer, service provider, enterprise, health service, or a mixture?" |
| [CSD-C4] | CSD | §19 Delivery roadmap | Business Requirement | "The platform contract should be proven against two materially different Domain Packs—Parkinson’s symptom capture and mentorship—so generic boundaries are discovered through real requirements." |
| [CSD-C5] | CSD | §13 Reference Domain Pack B | Stakeholder Need | "The goal is to improve continuity between infrequent mentoring conversations, capture concrete examples and progress, and prepare both parties for higher-value human discussions." |

### Unreferenced Documents

| Filename | Source Location | Reason |
|----------|-----------------|--------|
| README.md | `001-cairn/external/` | Placeholder instructions; no content |

---

**Generated by**: ArcKit `/arckit:stakeholders` command
**Generated on**: 2026-09-28
**ArcKit Version**: 6.16.4
**Project**: Cairn — Longitudinal Guidance and Evidence Platform (Project 001)
**Model**: Claude Opus 5.5 (claude-opus-5-5)
