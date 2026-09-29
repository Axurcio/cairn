# Risk Register: Cairn — Longitudinal Guidance and Evidence Platform

> **Template Origin**: Official | **ArcKit Version**: 6.16.4 | **Command**: `/arckit:risk`

## Document Control

| Field | Value |
|-------|-------|
| **Document ID** | ARC-001-RISK-v1.1 |
| **Document Type** | Risk Register |
| **Project** | Cairn — Longitudinal Guidance and Evidence Platform (Project 001) |
| **Classification** | OFFICIAL |
| **Status** | DRAFT |
| **Version** | 1.1 |
| **Created Date** | 2026-09-29 |
| **Last Modified** | 2026-09-29 |
| **Review Cycle** | Monthly |
| **Next Review Date** | 2026-10-29 |
| **Owner** | Chris McKelt (Product Owner and Architecture Owner) |
| **Reviewed By** | [PENDING] |
| **Approved By** | [PENDING] |
| **Distribution** | Project Team, Architecture Team, Executive Sponsor |

## Revision History

| Version | Date | Author | Changes | Approved By | Approval Date |
|---------|------|--------|---------|-------------|---------------|
| 1.0 | 2026-09-29 | ArcKit AI | Initial creation from `/arckit:risk` command | PENDING | PENDING |
| 1.1 | 2026-09-29 | ArcKit AI | Added R-024 (consent and capacity) and R-025 (carer and third-party information) from ARC-001-DPIA-v1.0; R-020 accepted after the decision to build the proof of concept in the open | PENDING | PENDING |

---

## Executive Summary

This register consolidates the risks raised in `ARC-001-REQ-v1.1`, `ARC-001-STKE-v1.2`, `ARC-001-DATA-v1.0` and `ARC-001-DPIA-v1.0` (R-024, R-025), and adds risks that emerged since (including publication of the repository). It uses the HM Treasury Orange Book method (likelihood × impact, inherent and residual, 4Ts response) as a structured approach; Cairn is a private-sector product, so no UK Government obligations apply. Risk owners are the accountable roles in the stakeholder RACI.

**Important caveat on controls**: almost every control credited below is *designed* (specified in the requirements) but not yet built. Residual scores therefore describe the expected position once Phase 1 delivers those controls. Today's actual exposure is closer to the inherent scores.

### Risk Profile Overview

**Total Risks Identified:** 25 risks across 6 categories

| Risk Level | Inherent | Residual | Change |
|------------|----------|----------|--------|
| **Critical** (20-25) | 1 | 0 | ↓ 1 |
| **High** (13-19) | 12 | 2 | ↓ 10 |
| **Medium** (6-12) | 12 | 19 | ↑ 7 |
| **Low** (1-5) | 0 | 4 | ↑ 4 |
| **TOTAL SCORE** | 326 | 224 | ↓ 31% |

### Risk Category Distribution

| Category | Count | Avg Inherent | Avg Residual | Control Effectiveness |
|----------|-------|--------------|--------------|----------------------|
| **STRATEGIC** | 4 | 14.8 | 11.2 | 24% reduction |
| **OPERATIONAL** | 3 | 12.3 | 9.0 | 27% reduction |
| **FINANCIAL** | 2 | 12.0 | 10.5 | 12% reduction |
| **COMPLIANCE** | 9 | 13.2 | 9.3 | 29% reduction |
| **REPUTATIONAL** | 2 | 11.5 | 6.0 | 48% reduction |
| **TECHNOLOGY** | 5 | 12.8 | 7.0 | 45% reduction |

### Overall Risk Assessment

**Overall Residual Risk Score:** 224/625
**Risk Reduction from Controls:** 31% reduction from inherent risk (once designed controls are built)
**Risk Profile Status:** ⚠️ Concerning. No risk is Critical after controls, but several High risks exceed the proposed appetite and depend on governance actions (independent roles, legal advice, business case) rather than engineering.

### Risks Exceeding Appetite

**Number of risks exceeding the proposed appetite:** 11 risks (appetite thresholds are proposed in section G and need approval by Haim Ozchakir)

| Risk ID | Title | Category | Score | Appetite | Excess | Escalation |
|---------|-------|----------|-------|----------|--------|------------|
| R-002 | Parkinson's pack is classified as a medical device | COMPLIANCE | 12 | 6 | +6 | Executive sponsor decision |
| R-005 | Privacy impact assessment not completed before pilot | COMPLIANCE | 12 | 6 | +6 | Executive sponsor decision |
| R-006 | Safety disclosure obligations conflict with participant control | COMPLIANCE | 12 | 6 | +6 | Executive sponsor decision |
| R-016 | No business case or confirmed funding runway | FINANCIAL | 15 | 9 | +6 | Executive sponsor decision |
| R-024 | Participant consent invalidated by changing capacity | COMPLIANCE | 12 | 6 | +6 | Executive sponsor decision |
| R-001 | Role concentration undermines independent assurance | STRATEGIC | 16 | 12 | +4 | Executive sponsor decision |
| R-003 | Safety floor misses self-harm or immediate danger | COMPLIANCE | 10 | 6 | +4 | Executive sponsor decision |
| R-004 | Unauthorised disclosure of participant health data | COMPLIANCE | 10 | 6 | +4 | Executive sponsor decision |
| R-018 | Pace pressure overrides safety and regulatory gates | OPERATIONAL | 12 | 9 | +3 | Executive sponsor decision |
| R-019 | Team capacity is insufficient for Phase 1 scope | OPERATIONAL | 12 | 9 | +3 | Executive sponsor decision |
| R-020 | Design and governance documents are public | REPUTATIONAL | 8 | 6 | +2 | Executive sponsor decision |

### Top 5 Risks Requiring Immediate Attention

1. **R-001** (STRATEGIC, High 16): Role concentration undermines independent assurance - Owner: Haim Ozchakir - Status: Open
2. **R-016** (FINANCIAL, High 15): No business case or confirmed funding runway - Owner: Haim Ozchakir - Status: Open
3. **R-005** (COMPLIANCE, Medium 12): Privacy impact assessment not completed before pilot - Owner: Chris McKelt - Status: Open
4. **R-006** (COMPLIANCE, Medium 12): Safety disclosure obligations conflict with participant control - Owner: Haim Ozchakir - Status: Open
5. **R-008** (TECHNOLOGY, Medium 12): On-device transcription fails for Parkinsonian speech - Owner: Chris McKelt - Status: Open

### Key Findings and Recommendations

**Key Findings:**

- 1 risk is Critical before controls: R-001 (Role concentration undermines independent assurance). It is a governance risk, and today's controls are weak.
- The highest residual risks are governance and business risks (roles, funding, gates, publication, clinician adoption), not technology. The technical design already carries strong controls for safety, isolation and memory.
- Ownership is concentrated: Chris McKelt owns 16 risks and Haim Ozchakir 9. This is the role concentration in R-001 showing up again.
- R-020: the proof of concept is built in the open by decision (2026-09-29), so the design, this register and the privacy impact assessment are public. The residual exposure is accepted and should be revisited before real participants enrol.
- No organisational risk appetite exists; section G proposes one.

**Recommendations:**

1. Haim Ozchakir to approve the proposed risk appetite by 2026-10-15, including acceptance of R-020 (building in the open), which sits above the proposed reputational appetite.
2. Engage an independent clinical safety adviser and obtain legal advice on disclosure and retention (R-001, R-006, R-007) during Phase 0.
3. Produce the business case (`/arckit:sobc`) and privacy impact assessment (`/arckit:dpia`) before the end of 2026 (R-016, R-005).

---

## A. Risk Matrix Visualization

### Inherent Risk Matrix (Before Controls)

**5×5 Likelihood × Impact Matrix**

```text
                                         IMPACT
              1-Negligible    2-Minor         3-Moderate      4-Major         5-Catastrophic  
           ┌───────────────┬───────────────┬───────────────┬───────────────┬───────────────┐
5-Almost   │               │               │ R-020         │ R-001         │               │
Certain    │ 5             │ 10            │ 15            │ 20            │ 25            │
           ├───────────────┼───────────────┼───────────────┼───────────────┼───────────────┤
4-Likely   │               │               │ R-010         │ R-005 R-006   │               │
           │               │               │               │ R-008 R-019   │               │
           │ 4             │ 8             │ 12            │ 16            │ 20            │
           ├───────────────┼───────────────┼───────────────┼───────────────┼───────────────┤
3-Possible │               │               │ R-007 R-012   │ R-009 R-011   │ R-002 R-003   │
           │               │               │ R-017 R-025   │ R-014 R-015   │ R-004 R-013   │
           │               │               │               │ R-024         │ R-016 R-018   │
           │               │               │               │               │ R-022         │
           │ 3             │ 6             │ 9             │ 12            │ 15            │
           ├───────────────┼───────────────┼───────────────┼───────────────┼───────────────┤
2-Unlikely │               │               │ R-023         │ R-021         │               │
           │ 2             │ 4             │ 6             │ 8             │ 10            │
           ├───────────────┼───────────────┼───────────────┼───────────────┼───────────────┤
1-Rare     │               │               │               │               │               │
           │ 1             │ 2             │ 3             │ 4             │ 5             │
           └───────────────┴───────────────┴───────────────┴───────────────┴───────────────┘

Rows: LIKELIHOOD (5 = Almost Certain). Legend: Critical (20-25)  High (13-19)  Medium (6-12)  Low (1-5)
```

**Risk Zones:**

- **Critical (20-25)**: R-001
- **High (13-19)**: R-002, R-003, R-004, R-005, R-006, R-008, R-013, R-016, R-018, R-019, R-020, R-022
- **Medium (6-12)**: R-007, R-009, R-010, R-011, R-012, R-014, R-015, R-017, R-021, R-023, R-024, R-025
- **Low (1-5)**: None

### Residual Risk Matrix (After Controls)

**5×5 Likelihood × Impact Matrix - After Controls Applied**

```text
                                         IMPACT
              1-Negligible    2-Minor         3-Moderate      4-Major         5-Catastrophic  
           ┌───────────────┬───────────────┬───────────────┬───────────────┬───────────────┐
5-Almost   │               │               │               │               │               │
Certain    │ 5             │ 10            │ 15            │ 20            │ 25            │
           ├───────────────┼───────────────┼───────────────┼───────────────┼───────────────┤
4-Likely   │               │ R-020         │ R-005         │ R-001         │               │
           │ 4             │ 8             │ 12            │ 16            │ 20            │
           ├───────────────┼───────────────┼───────────────┼───────────────┼───────────────┤
3-Possible │               │               │ R-015         │ R-002 R-006   │ R-016         │
           │               │               │               │ R-008 R-013   │               │
           │               │               │               │ R-018 R-019   │               │
           │               │               │               │ R-024         │               │
           │ 3             │ 6             │ 9             │ 12            │ 15            │
           ├───────────────┼───────────────┼───────────────┼───────────────┼───────────────┤
2-Unlikely │               │               │ R-007 R-009   │ R-014         │ R-003 R-004   │
           │               │               │ R-010 R-012   │               │               │
           │               │               │ R-017 R-025   │               │               │
           │ 2             │ 4             │ 6             │ 8             │ 10            │
           ├───────────────┼───────────────┼───────────────┼───────────────┼───────────────┤
1-Rare     │               │               │ R-023         │ R-011 R-021   │ R-022         │
           │ 1             │ 2             │ 3             │ 4             │ 5             │
           └───────────────┴───────────────┴───────────────┴───────────────┴───────────────┘

Rows: LIKELIHOOD (5 = Almost Certain). Legend: Critical (20-25)  High (13-19)  Medium (6-12)  Low (1-5)
```

**Risk Zones:**

- **Critical (20-25)**: None
- **High (13-19)**: R-001, R-016
- **Medium (6-12)**: R-002, R-003, R-004, R-005, R-006, R-007, R-008, R-009, R-010, R-012, R-013, R-014, R-015, R-017, R-018, R-019, R-020, R-024, R-025
- **Low (1-5)**: R-011, R-021, R-022, R-023

**Largest movements:**

- R-022 moved from High (15) to Low (5)
- R-011 moved from Medium (12) to Low (4)
- R-020 moved from High (15) to Medium (8)
- R-009 moved from Medium (12) to Medium (6)
- R-010 moved from Medium (12) to Medium (6)

---

## B. Top 10 Risks (Ranked by Residual Score)

| Rank | ID | Title | Category | Inherent | Residual | Owner | Status | Response |
|------|-----|-------|----------|----------|----------|-------|--------|----------|
| 1 | R-001 | Role concentration undermines independent assurance | STRATEGIC | 20 | 16 | Haim Ozchakir | Open | Treat |
| 2 | R-016 | No business case or confirmed funding runway | FINANCIAL | 15 | 15 | Haim Ozchakir | Open | Treat |
| 3 | R-005 | Privacy impact assessment not completed before pilot | COMPLIANCE | 16 | 12 | Chris McKelt | Open | Treat |
| 4 | R-006 | Safety disclosure obligations conflict with participant control | COMPLIANCE | 16 | 12 | Haim Ozchakir | Open | Treat |
| 5 | R-008 | On-device transcription fails for Parkinsonian speech | TECHNOLOGY | 16 | 12 | Chris McKelt | Open | Treat |
| 6 | R-019 | Team capacity is insufficient for Phase 1 scope | OPERATIONAL | 16 | 12 | Chris McKelt | Open | Treat |
| 7 | R-002 | Parkinson's pack is classified as a medical device | COMPLIANCE | 15 | 12 | Haim Ozchakir | Open | Treat |
| 8 | R-013 | Clinicians do not use the briefs | STRATEGIC | 15 | 12 | Chris McKelt | Open | Treat |
| 9 | R-018 | Pace pressure overrides safety and regulatory gates | OPERATIONAL | 15 | 12 | Haim Ozchakir | Open | Treat |
| 10 | R-024 | Participant consent invalidated by changing capacity | COMPLIANCE | 12 | 12 | Chris McKelt | Open | Treat |

---

## C. Detailed Risk Register

All risks are **Open** except R-020 (**Accepted**): none of the planned actions has started. Costs are not yet estimated; the business case will price them.

### Risk R-001: Role concentration undermines independent assurance

**Category:** STRATEGIC
**Status:** Open
**Risk Owner:** Haim Ozchakir, Executive Sponsor (S-11) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Architecture Owner (S-10)

#### Risk Identification

**Risk Description:**
One person holds the architecture owner, product owner, clinical safety lead and privacy officer roles. The checks the RACI relies on between these roles (privacy sign-off against product priorities, the clinical safety veto against pilot pace) are made by the same person.

**Root Cause:**
Early-stage organisation with few named people; roles filled to unblock decisions (ARC-001-STKE-v1.2).

**Trigger Events:**

- A health service clinical governance committee asks who the independent clinical safety lead is
- A safety-floor or privacy decision is later challenged as self-approved
- The TGA or a buyer expects a clinically qualified safety lead

**Consequences if Realized:**

- Pilot approval delayed until roles are separated
- Safety or privacy decisions reopened, causing rework
- Buyers doubt the assurance model (G-11)

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-11 Haim Ozchakir (accountable); S-10, S-18, S-7, S-8 Chris McKelt; S-4 health service tenants; S-14 regulators

**Related Objectives:** G-4 regulatory position settled; G-5 safety floor; G-3 no unapproved disclosure; G-11 paying tenants

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 5 - Almost Certain | The concentration exists today |
| **Impact** | 4 - Major | Undermines regulatory and buyer confidence in safety and privacy decisions |
| **Inherent Risk Score** | **20** (Critical) | 5 × 4 = 20 |

**Risk Zone:** 🟥 Critical (20-25)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Decisions record which role they were made under (STKE v1.2)**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Effectiveness: Weak
   - Evidence: Documented only; no decision log yet

2. **Executive sponsor countersigns safety floor, regulatory determination and privacy impact assessment**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Effectiveness: Adequate
   - Evidence: Agreed in STKE v1.2; not yet exercised

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 4 - Likely | Countersigning helps but is not independent clinical review |
| **Impact** | 4 - Major | Impact on assurance unchanged until roles are separated |
| **Residual Risk Score** | **16** (High) | 4 × 4 = 16 |

**Risk Zone:** 🟧 High (13-19)
**Risk Reduction:** 20% reduction from inherent (20 → 16)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Appointing independent advisers is cheap relative to a delayed or challenged pilot.

#### Risk Appetite Assessment

**Proposed appetite for STRATEGIC risks:** Medium (score ≤ 12)
**Current Residual Risk Score:** 16 (High)
**Assessment:** ❌ Exceeds appetite by 4 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Engage an independent, clinically qualified clinical safety adviser**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 4 to 2

2. **Commission an external privacy review before pilot enrolment**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 4 to 2

3. **Start a decision log recording the role behind each decision**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Due Date: 2026-10-15
   - Cost: Not yet estimated
   - Expected Impact: Improves evidence

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 3 (Moderate)
- Target Score: 6 (Medium) ✅ Within appetite (≤ 12)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 6 at the next review

**Monitoring Plan:**

- **Frequency:** Fortnightly review by the risk owner
- **Key Indicators:** Safety and privacy decisions made without independent review; buyer questions about assurance roles
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-002: Parkinson's pack is classified as a medical device

**Category:** COMPLIANCE
**Status:** Open
**Risk Owner:** Haim Ozchakir, Executive Sponsor (S-11) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Clinical Safety and Regulatory Lead (S-7)

#### Risk Identification

**Risk Description:**
On-device motor and voice features, or wording that drifts towards interpretation, could bring the Parkinson's pack within therapeutic goods regulation for software. That would add a regulated lifecycle, quality system and possibly registration before or during the pilot.

**Root Cause:**
The intended purpose excludes diagnosis, severity scoring and treatment recommendation [CSD-C1], but derived features and briefs sit close to the boundary.

**Trigger Events:**

- Intended-purpose assessment concludes the pack is a medical device
- Feature requests to display change-from-baseline or scores
- Brief wording that implies clinical interpretation

**Consequences if Realized:**

- Pilot delayed 6–12 months for regulated lifecycle work
- Added cost for quality management and clinical evaluation
- Rework of features already built

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-7 clinical safety lead; S-11 sponsor; S-4 health service; S-14 TGA

**Related Objectives:** G-4 regulatory position settled before enrolment; G-1 prepared visits

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Genuinely uncertain until the determination is made |
| **Impact** | 5 - Catastrophic | Could halt the pilot |
| **Inherent Risk Score** | **15** (High) | 3 × 5 = 15 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Intended-purpose gate on outputs and wording (FR-029)**
   - Owner: Chris McKelt, Clinical Safety and Regulatory Lead (S-7)
   - Effectiveness: Adequate
   - Evidence: Designed; not yet built

2. **Derived features never displayed unless the regulatory profile allows (FR-021)**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Effectiveness: Adequate
   - Evidence: Designed; not yet built

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Determination not yet made |
| **Impact** | 4 - Major | Controls limit feature drift, reducing rework |
| **Residual Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 20% reduction from inherent (15 → 12)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Early determination and lifecycle-ready engineering reduce both the chance of surprise and its cost.

#### Risk Appetite Assessment

**Proposed appetite for COMPLIANCE risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 12 (Medium)
**Assessment:** ❌ Exceeds appetite by 6 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Obtain regulatory advice and document intended purpose and classification**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Removes uncertainty

2. **Adopt an IEC 62304-aligned lifecycle for the Parkinson's pack from the start**
   - Owner: Chris McKelt, Clinical Safety and Regulatory Lead (S-7)
   - Due Date: 2027-01-31
   - Cost: Not yet estimated
   - Expected Impact: Impact 4 to 3

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 3 (Moderate)
- Target Score: 6 (Medium) ✅ Within appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 6 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Determination outcome; feature requests touching displayed features
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-003: Safety floor misses self-harm or immediate danger

**Category:** COMPLIANCE
**Status:** Open
**Risk Owner:** Chris McKelt, Clinical Safety and Regulatory Lead (S-7) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
A participant discloses self-harm or immediate danger and the core safety floor fails to detect it or shows the wrong message.

**Root Cause:**
Deterministic rules can miss novel phrasing, transcription errors or languages not covered.

**Trigger Events:**

- Floor rules miss phrasing in real use
- Transcription errors in soft or slurred speech
- Pack red flags merged incorrectly

**Consequences if Realized:**

- Harm to a participant
- Pilot suspension and regulatory scrutiny
- Loss of trust with health services and advocates

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-1 participants; S-7; S-4; S-17 advocacy organisations

**Related Objectives:** G-5 safety floor never misses; G-4

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Without controls, detection gaps are likely in open conversation |
| **Impact** | 5 - Catastrophic | Harm to a person is the most severe outcome |
| **Inherent Risk Score** | **15** (High) | 3 × 5 = 15 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Deterministic floor on every input before any reply, including unconfirmed transcripts and offline (FR-026, FR-015)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Strong
   - Evidence: Designed; regression suite planned

2. **Release blocked on any critical miss in the floor regression suite (FR-047)**
   - Owner: Chris McKelt, Clinical Safety and Regulatory Lead (S-7)
   - Effectiveness: Strong
   - Evidence: Designed; not yet built

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Layered, tested controls |
| **Impact** | 5 - Catastrophic | Impact of a miss remains severe |
| **Residual Risk Score** | **10** (Medium) | 2 × 5 = 10 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 33% reduction from inherent (15 → 10)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Non-negotiable principle P7; impact cannot be reduced, so likelihood must be minimised.

#### Risk Appetite Assessment

**Proposed appetite for COMPLIANCE risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 10 (Medium)
**Assessment:** ❌ Exceeds appetite by 4 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Clinically approve floor rules and messages, with independent clinical review (see R-001)**
   - Owner: Chris McKelt, Clinical Safety and Regulatory Lead (S-7)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 2 to 1

2. **Build the floor regression suite with representative voices and phrasing**
   - Owner: Engineering and delivery team (S-12)
   - Due Date: 2027-04-30
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 2 to 1

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 5 (Catastrophic)
- Target Score: 5 (Low) ✅ Within appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 5 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Floor regression results per release; safety events reviewed monthly
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-004: Unauthorised disclosure of participant health data

**Category:** COMPLIANCE
**Status:** Open
**Risk Owner:** Haim Ozchakir, Executive Sponsor (S-11) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Privacy Officer (S-8)

#### Risk Identification

**Risk Description:**
Participant content is disclosed without approval, through a breach, a misconfigured share, a telemetry leak or an integration error.

**Root Cause:**
Sensitive health and development data across many data planes, projections and integrations.

**Trigger Events:**

- Security breach of a data plane
- Share link leaked or not expired
- Content in logs or notifications

**Consequences if Realized:**

- Notifiable data breach and OAIC scrutiny
- Harm and loss of trust for participants
- Loss of tenants

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-1; S-8; S-4; S-14

**Related Objectives:** G-3 no disclosure without approval; G-8

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Large attack surface without controls |
| **Impact** | 5 - Catastrophic | Health data breach is severe |
| **Inherent Risk Score** | **15** (High) | 3 × 5 = 15 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Consent-aware authorisation and approval checks on every outbound path (FR-032, FR-036)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Strong
   - Evidence: Designed

2. **Per-journey encryption, content-free telemetry and isolation tests (NFR-SEC-003, NFR-M-001, NFR-SEC-007)**
   - Owner: Platform operator and SRE (S-9)
   - Effectiveness: Strong
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Defence in depth reduces likelihood |
| **Impact** | 5 - Catastrophic | Impact of a breach remains severe |
| **Residual Risk Score** | **10** (Medium) | 2 × 5 = 10 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 33% reduction from inherent (15 → 10)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Core to participant trust (P4); secondary transfer through cyber insurance to be considered in the business case.

#### Risk Appetite Assessment

**Proposed appetite for COMPLIANCE risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 10 (Medium)
**Assessment:** ❌ Exceeds appetite by 4 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Threat model and penetration test before pilot**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Due Date: 2027-05-31
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 2 to 1

2. **Price cyber insurance in the business case**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Transfers part of financial impact

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 5 (Catastrophic)
- Target Score: 5 (Low) ✅ Within appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 5 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Isolation test failures; telemetry content-scan alerts; share link anomalies
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-005: Privacy impact assessment not completed before pilot

**Category:** COMPLIANCE
**Status:** Open
**Risk Owner:** Chris McKelt, Privacy Officer (S-8) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Privacy Officer (S-8)

#### Risk Identification

**Risk Description:**
The privacy impact assessment, required for health, biometric-derived and long-duration profiling data, is not completed and acted on before pilot enrolment.

**Root Cause:**
Not started; the privacy officer also holds three other roles (R-001).

**Trigger Events:**

- Pilot date fixed before the assessment starts
- Assessment findings arrive after build

**Consequences if Realized:**

- Pilot delay
- Privacy controls retrofitted at higher cost
- Health service governance refuses approval

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-8; S-4; S-1; S-14

**Related Objectives:** G-3; G-4

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 4 - Likely | Not started and owner overloaded |
| **Impact** | 4 - Major | Blocks pilot approval |
| **Inherent Risk Score** | **16** (High) | 4 × 4 = 16 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Listed as a pilot dependency in requirements and data model**
   - Owner: Chris McKelt, Privacy Officer (S-8)
   - Effectiveness: Weak
   - Evidence: Documentation only

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 4 - Likely | No active work yet |
| **Impact** | 3 - Moderate | Early findings reduce rework |
| **Residual Risk Score** | **12** (Medium) | 4 × 3 = 12 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 25% reduction from inherent (16 → 12)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Straightforward to schedule; the data model already provides most inputs.

#### Risk Appetite Assessment

**Proposed appetite for COMPLIANCE risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 12 (Medium)
**Assessment:** ❌ Exceeds appetite by 6 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Run /arckit:dpia for the core and Parkinson's pack**
   - Owner: Chris McKelt, Privacy Officer (S-8)
   - Due Date: 2026-11-30
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 4 to 2

2. **External privacy review of the assessment (R-001)**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Impact 3 to 2

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 2 (Minor)
- Target Score: 4 (Low) ✅ Within appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 4 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Assessment status at each monthly review
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-006: Safety disclosure obligations conflict with participant control

**Category:** COMPLIANCE
**Status:** Open
**Risk Owner:** Haim Ozchakir, Executive Sponsor (S-11) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Privacy Officer (S-8)

#### Risk Identification

**Risk Description:**
Health services and employers may have duty-of-care or legal disclosure obligations that conflict with the principle that nothing is shared without participant approval (requirements Conflict C-4).

**Root Cause:**
Principle P4 is non-negotiable, while legal obligations apply regardless of product rules.

**Trigger Events:**

- Tenant requires automatic escalation
- Legal advice finds a mandatory disclosure duty

**Consequences if Realized:**

- Contract negotiations stall
- Rework of consent and escalation design
- Legal exposure if handled ad hoc

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-4; S-1; S-8; S-7

**Related Objectives:** G-3; G-5; G-11

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 4 - Likely | Buyers are likely to raise it |
| **Impact** | 4 - Major | Affects consent model and contracts |
| **Inherent Risk Score** | **16** (High) | 4 × 4 = 16 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Escalation only through consent purposes or documented legal basis (FR-028)**
   - Owner: Chris McKelt, Privacy Officer (S-8)
   - Effectiveness: Adequate
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Legal position still unknown |
| **Impact** | 4 - Major | Design is flexible but contracts are affected |
| **Residual Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 25% reduction from inherent (16 → 12)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Needs legal advice and a principles clarification (v1.1).

#### Risk Appetite Assessment

**Proposed appetite for COMPLIANCE risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 12 (Medium)
**Assessment:** ❌ Exceeds appetite by 6 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Obtain legal advice on disclosure duties for health and employer tenants**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2026-11-30
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 3 to 2

2. **Update principles to v1.1 with the legal-obligation clarification**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Impact 4 to 3

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 3 (Moderate)
- Target Score: 6 (Medium) ✅ Within appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 6 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Tenant requests for escalation; legal advice outcome
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-007: Statutory record retention conflicts with deletion requests

**Category:** COMPLIANCE
**Status:** Open
**Risk Owner:** Chris McKelt, Privacy Officer (S-8) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
Health records legislation may require a health service tenant to retain records that a participant asks to delete (requirements Conflict C-11).

**Root Cause:**
Unclear whether Cairn or the tenant is the record holder.

**Trigger Events:**

- Participant deletion request in a health tenant
- Legal advice confirms a retention duty

**Consequences if Realized:**

- Breach of retention law or of participant expectation
- Complaint to regulator

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-1; S-4; S-8

**Related Objectives:** G-3

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Likely to arise in health tenants |
| **Impact** | 3 - Moderate | Manageable with transparent handling |
| **Inherent Risk Score** | **9** (Medium) | 3 × 3 = 9 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Regulatory profile declares retention; deletion becomes legal hold with notice at enrolment (DR-006)**
   - Owner: Chris McKelt, Privacy Officer (S-8)
   - Effectiveness: Adequate
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Designed handling |
| **Impact** | 3 - Moderate | Unchanged |
| **Residual Risk Score** | **6** (Medium) | 2 × 3 = 6 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 33% reduction from inherent (9 → 6)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Covered by the same legal advice as R-006.

#### Risk Appetite Assessment

**Proposed appetite for COMPLIANCE risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 6 (Medium)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Include record-holder question in legal advice (R-006)**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2026-11-30
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 2 to 1

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 3 (Moderate)
- Target Score: 3 (Low) ✅ Within appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 3 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Deletion requests under legal hold
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-008: On-device transcription fails for Parkinsonian speech

**Category:** TECHNOLOGY
**Status:** Open
**Risk Owner:** Chris McKelt, Product Owner (S-18) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
Soft or slurred speech defeats on-device transcription, pushing participants to type (which tremor makes hard) or to upload audio (which the on-device principle discourages).

**Root Cause:**
General speech models are trained mostly on typical speech.

**Trigger Events:**

- Word error rate above the pack target in device testing
- Participants abandon voice entries

**Consequences if Realized:**

- Lower capture and brief quality (G-1)
- Pressure to upload audio (P8)
- Higher burden (G-2)

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-1; S-18; S-8

**Related Objectives:** G-1; G-2

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 4 - Likely | Known weakness of speech models |
| **Impact** | 4 - Major | Voice is the main input for this population |
| **Inherent Risk Score** | **16** (High) | 4 × 4 = 16 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Consented server transcription path, deleted after confirmation (FR-011)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Adequate
   - Evidence: Designed

2. **Single-tap transcript correction and text fallback (FR-012)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Adequate
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Fallbacks exist but add burden |
| **Impact** | 4 - Major | Still affects the core use case |
| **Residual Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 25% reduction from inherent (16 → 12)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Evaluate early with representative voices.

#### Risk Appetite Assessment

**Proposed appetite for TECHNOLOGY risks:** Medium (score ≤ 12)
**Current Residual Risk Score:** 12 (Medium)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Device-lab evaluation of speech engines on representative voices**
   - Owner: Engineering and delivery team (S-12)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 3 to 2

2. **Set the pack word error rate target from evaluation results**
   - Owner: Chris McKelt, Product Owner (S-18)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Clarifies acceptance

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 3 (Moderate)
- Target Score: 6 (Medium) ✅ Within appetite (≤ 12)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 6 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Word error rate; voice-entry abandonment rate
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-009: Capable models unavailable within Australian regions

**Category:** TECHNOLOGY
**Status:** Open
**Risk Owner:** Chris McKelt, Architecture Owner (S-10) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
The model quality needed for extraction and phrasing may only be offered through routing that can leave the approved regions, which residency by policy forbids (P11).

**Root Cause:**
Providers release models to some regions first and use cross-region routing for capacity.

**Trigger Events:**

- Required model not hosted in approved regions
- Provider changes routing behaviour

**Consequences if Realized:**

- Lower extraction quality
- Delay while alternatives are evaluated

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-10; S-8; S-18

**Related Objectives:** G-8; G-1

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Plausible for newest models |
| **Impact** | 4 - Major | Affects core features |
| **Inherent Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Task-level gateway rejects non-compliant bindings (FR-046)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Strong
   - Evidence: Designed

2. **In-cluster open-weight models as fallback**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Adequate
   - Evidence: Not yet evaluated

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Alternatives available |
| **Impact** | 3 - Moderate | Quality trade-off reduces impact |
| **Residual Risk Score** | **6** (Medium) | 2 × 3 = 6 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 50% reduction from inherent (12 → 6)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Confirm availability per task before build.

#### Risk Appetite Assessment

**Proposed appetite for TECHNOLOGY risks:** Medium (score ≤ 12)
**Current Residual Risk Score:** 6 (Medium)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Run /arckit:aws-research for per-task model availability in Australian regions**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Due Date: 2026-11-15
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 2 to 1

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 3 (Moderate)
- Target Score: 3 (Low) ✅ Within appetite (≤ 12)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 3 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Model availability per approved region at each release
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-010: Memory provider immature or deletion unverifiable

**Category:** TECHNOLOGY
**Status:** Open
**Risk Owner:** Chris McKelt, Architecture Owner (S-10) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
The candidate memory providers are young (Hindsight is pre-1.0; Graphiti needs a graph database). Deletion may be hard to verify inside derived memory, and APIs may change.

**Root Cause:**
Fast-moving open-source memory ecosystem [CSD-C2].

**Trigger Events:**

- Phase 0 evaluation fails isolation or deletion tests
- Breaking provider upgrade

**Consequences if Realized:**

- Memory features delayed
- Rework of adapter
- Deletion non-compliance if unverified

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-10; S-8; S-12

**Related Objectives:** G-7; G-3

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 4 - Likely | Immature technology |
| **Impact** | 3 - Moderate | Memory is non-authoritative, limiting impact |
| **Inherent Risk Score** | **12** (Medium) | 4 × 3 = 12 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Provider-neutral interface and null provider fallback (FR-040)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Strong
   - Evidence: Designed

2. **Delete-and-rebuild from canonical events (FR-044, DR-015)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Strong
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Evaluation gates adoption |
| **Impact** | 3 - Moderate | Unchanged |
| **Residual Risk Score** | **6** (Medium) | 2 × 3 = 6 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 50% reduction from inherent (12 → 6)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Evaluation spike (FR-051) decides adoption.

#### Risk Appetite Assessment

**Proposed appetite for TECHNOLOGY risks:** Medium (score ≤ 12)
**Current Residual Risk Score:** 6 (Medium)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Run the memory provider evaluation with a null-provider control arm**
   - Owner: Engineering and delivery team (S-12)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 2 to 1

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 3 (Moderate)
- Target Score: 3 (Low) ✅ Within appetite (≤ 12)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 3 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Evaluation results; provider release notes
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-011: Model-derived memory treated as clinical truth

**Category:** COMPLIANCE
**Status:** Open
**Risk Owner:** Chris McKelt, Clinical Safety and Regulatory Lead (S-7) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
Memory observations or temporal facts extracted by language models appear authoritative and drift into rules, briefs or clinical conversations in the Parkinson's pack.

**Root Cause:**
Temporal graphs and consolidated observations look like structured records.

**Trigger Events:**

- Feature request to surface memory insights
- Memory text shown to clinicians

**Consequences if Realized:**

- Uncited or wrong statements about a patient
- Regulatory position changes (R-002)

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-7; S-3 clinicians; S-14

**Related Objectives:** G-4; G-6

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Strong product pull towards insight features |
| **Impact** | 4 - Major | Clinical and regulatory consequences |
| **Inherent Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Architecture tests: governed modules cannot call memory (FR-043)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Strong
   - Evidence: Designed

2. **Canonical bi-temporal state answers governed questions (DR-014)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Strong
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 1 - Rare | Structurally prevented |
| **Impact** | 4 - Major | Unchanged |
| **Residual Risk Score** | **4** (Low) | 1 × 4 = 4 |

**Risk Zone:** 🟩 Low (1-5)
**Risk Reduction:** 67% reduction from inherent (12 → 4)

#### Risk Response (4Ts Framework)

**Primary Response:** TERMINATE

**Rationale:** For the regulated pilot, the activity is stopped: the Parkinson's pack uses the null provider unless the evaluation shows material benefit (Conflict C-12).

#### Risk Appetite Assessment

**Proposed appetite for COMPLIANCE risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 4 (Low)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Configure the Parkinson's pack with the null provider for the pilot**
   - Owner: Chris McKelt, Clinical Safety and Regulatory Lead (S-7)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Removes the source of risk

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 4 (Major)
- Target Score: 4 (Low) ✅ Within appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 4 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Any memory dependency flagged by architecture tests
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-012: Domain vocabulary leaks into the core

**Category:** TECHNOLOGY
**Status:** Open
**Risk Owner:** Chris McKelt, Architecture Owner (S-10) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
Building the Parkinson's pack first bakes clinical assumptions into core code, so the mentorship pack needs core changes (BR-001).

**Root Cause:**
First domain shapes the platform; deadline pressure.

**Trigger Events:**

- Core pull requests adding domain terms
- Mentorship pack requires core changes

**Consequences if Realized:**

- Platform thesis weakened (G-7)
- Regulated pack inherits other domains' changes (P9)

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-10; S-11; S-12

**Related Objectives:** G-7; G-10

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Common in first builds |
| **Impact** | 3 - Moderate | Rework rather than failure |
| **Inherent Risk Score** | **9** (Medium) | 3 × 3 = 9 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **CI vocabulary deny-list lint on core (NFR-M-004)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Strong
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Automated detection |
| **Impact** | 3 - Moderate | Unchanged |
| **Residual Risk Score** | **6** (Medium) | 2 × 3 = 6 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 33% reduction from inherent (9 → 6)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Cheap automated control.

#### Risk Appetite Assessment

**Proposed appetite for TECHNOLOGY risks:** Medium (score ≤ 12)
**Current Residual Risk Score:** 6 (Medium)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Build the vocabulary lint in the first sprint**
   - Owner: Engineering and delivery team (S-12)
   - Due Date: 2027-01-31
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 2 to 1

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 3 (Moderate)
- Target Score: 3 (Low) ✅ Within appetite (≤ 12)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 3 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Lint violations per month
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-013: Clinicians do not use the briefs

**Category:** STRATEGIC
**Status:** Open
**Risk Owner:** Chris McKelt, Product Owner (S-18) (from Stakeholder RACI: Accountable)
**Action Owner:** Pack authors and clinical advisory group (S-6)

#### Risk Identification

**Risk Description:**
Clinicians decline to read participant briefs because of time pressure or concern about medico-legal responsibility for information they receive.

**Root Cause:**
Unpaid, unbounded review work; unfamiliar format.

**Trigger Events:**

- Low brief open rates in the pilot
- Health service advises clinicians not to engage

**Consequences if Realized:**

- Core value proposition unproven (G-1, G-6)
- Health service does not renew (G-11)

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-3; S-4; S-1

**Related Objectives:** G-1; G-6; G-11

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Common barrier for patient-generated data |
| **Impact** | 5 - Catastrophic | Would invalidate the pilot |
| **Inherent Risk Score** | **15** (High) | 3 × 5 = 15 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **One-page, cited brief separating not reported from not asked (FR-030)**
   - Owner: Pack authors and clinical advisory group (S-6)
   - Effectiveness: Adequate
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Untested with clinicians |
| **Impact** | 4 - Major | Participant-held fallback limits impact |
| **Residual Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 20% reduction from inherent (15 → 12)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Test early with clinicians before building.

#### Risk Appetite Assessment

**Proposed appetite for STRATEGIC risks:** Medium (score ≤ 12)
**Current Residual Risk Score:** 12 (Medium)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Test brief prototypes with 5 or more clinicians**
   - Owner: Chris McKelt, Product Owner (S-18)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 3 to 2

2. **Agree clinician responsibilities with the health service**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Impact 4 to 3

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 3 (Moderate)
- Target Score: 6 (Medium) ✅ Within appetite (≤ 12)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 6 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Brief open rate; reviewer usefulness score
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-014: Participants stop recording between visits

**Category:** STRATEGIC
**Status:** Open
**Risk Owner:** Chris McKelt, Product Owner (S-18) (from Stakeholder RACI: Accountable)
**Action Owner:** Pack authors and clinical advisory group (S-6)

#### Risk Identification

**Risk Description:**
Recording falls away after the first weeks, especially on low-energy days, so briefs are thin.

**Root Cause:**
Fatigue, apathy and competing priorities; no engagement mechanics by design (P6).

**Trigger Events:**

- Weekly recording drops after month 2
- Withdrawals citing burden

**Consequences if Realized:**

- Thin briefs (G-1)
- Pilot outcomes weak

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-1; S-17

**Related Objectives:** G-1; G-2

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Typical for longitudinal self-report |
| **Impact** | 4 - Major | Reduces value |
| **Inherent Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Burden budget, voice-first capture, pre-visit prompts (FR-023)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Adequate
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Designed for low burden |
| **Impact** | 4 - Major | Unchanged |
| **Residual Risk Score** | **8** (Medium) | 2 × 4 = 8 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 33% reduction from inherent (12 → 8)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Co-design with participants.

#### Risk Appetite Assessment

**Proposed appetite for STRATEGIC risks:** Medium (score ≤ 12)
**Current Residual Risk Score:** 8 (Medium)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Co-design sessions with people living with Parkinson's and an advocacy organisation**
   - Owner: Chris McKelt, Product Owner (S-18)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 2 to 1

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 4 (Major)
- Target Score: 4 (Low) ✅ Within appetite (≤ 12)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 4 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Weekly active recording; withdrawal reasons
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-015: Buyers reject participant-first data terms

**Category:** STRATEGIC
**Status:** Open
**Risk Owner:** Haim Ozchakir, Executive Sponsor (S-11) (from Stakeholder RACI: Accountable)
**Action Owner:** Commercial lead (S-13, not yet named)

#### Risk Identification

**Risk Description:**
Employers or health services insist on individual visibility or automatic escalation as a condition of purchase, which the principles do not allow.

**Root Cause:**
Sponsors are used to individual reporting; power imbalance in employer programmes.

**Trigger Events:**

- Contract negotiation requires individual dashboards
- Tenant asks for HR feeds

**Consequences if Realized:**

- Lost deals (G-11)
- Pressure for principle exceptions

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-4; S-16; S-13; S-1

**Related Objectives:** G-9; G-11

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Likely objection from employers |
| **Impact** | 4 - Major | Affects revenue |
| **Inherent Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Aggregates plus voluntary participant summaries (FR-037, Conflict C-8)**
   - Owner: Chris McKelt, Product Owner (S-18)
   - Effectiveness: Adequate
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Buyer reactions untested |
| **Impact** | 3 - Moderate | Some buyers accept; walk away from others |
| **Residual Risk Score** | **9** (Medium) | 3 × 3 = 9 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 25% reduction from inherent (12 → 9)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Set expectations before contracts.

#### Risk Appetite Assessment

**Proposed appetite for STRATEGIC risks:** Medium (score ≤ 12)
**Current Residual Risk Score:** 9 (Medium)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Standard data terms and a buyer briefing pack**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 3 to 2

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 3 (Moderate)
- Target Score: 6 (Medium) ✅ Within appetite (≤ 12)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 6 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Contract clauses requesting exceptions
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-016: No business case or confirmed funding runway

**Category:** FINANCIAL
**Status:** Open
**Risk Owner:** Haim Ozchakir, Executive Sponsor (S-11) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Product Owner (S-18)

#### Risk Identification

**Risk Description:**
There is no budget, business case or delivery date. Scope may exceed available funding before the pilot proves value.

**Root Cause:**
Early-stage venture; requirements written before costing.

**Trigger Events:**

- Funding round delayed
- Costs estimated above available runway

**Consequences if Realized:**

- Scope cut or pilot delayed
- Platform thesis unproven (G-7)

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-11; S-13; S-12

**Related Objectives:** G-1; G-7; G-11

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | No financial plan exists |
| **Impact** | 5 - Catastrophic | Existential for the venture |
| **Inherent Risk Score** | **15** (High) | 3 × 5 = 15 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **None beyond phase gates in the design**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Effectiveness: Weak
   - Evidence: No business case yet

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | No control yet |
| **Impact** | 5 - Catastrophic | Unchanged |
| **Residual Risk Score** | **15** (High) | 3 × 5 = 15 |

**Risk Zone:** 🟧 High (13-19)
**Risk Reduction:** 0% reduction from inherent (15 → 15)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** A business case is the next planned artefact.

#### Risk Appetite Assessment

**Proposed appetite for FINANCIAL risks:** Moderate (score ≤ 9)
**Current Residual Risk Score:** 15 (High)
**Assessment:** ❌ Exceeds appetite by 6 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Run /arckit:sobc to produce a costed business case**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 3 to 2

2. **Run /arckit:plan to set dates and phase budgets**
   - Owner: Chris McKelt, Product Owner (S-18)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Impact 5 to 4

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 4 (Major)
- Target Score: 8 (Medium) ✅ Within appetite (≤ 9)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 8 at the next review

**Monitoring Plan:**

- **Frequency:** Fortnightly review by the risk owner
- **Key Indicators:** Months of runway; variance against phase budgets
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-017: Model inference and memory costs exceed plan

**Category:** FINANCIAL
**Status:** Open
**Risk Owner:** Haim Ozchakir, Executive Sponsor (S-11) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Architecture Owner (S-10)

#### Risk Identification

**Risk Description:**
Per-turn extraction, phrasing and memory ingestion (which also calls models) cost more than planned, and per-tenant data planes multiply infrastructure costs.

**Root Cause:**
Model-heavy ingestion; data plane per tenant.

**Trigger Events:**

- Cost per active journey above plan
- Memory rebuilds consume large quotas

**Consequences if Realized:**

- Negative unit economics
- Features scaled back

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-11; S-9

**Related Objectives:** G-11; G-8

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Common in AI products |
| **Impact** | 3 - Moderate | Manageable by tuning |
| **Inherent Risk Score** | **9** (Medium) | 3 × 3 = 9 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Gateway metrics and per-configuration cost caps (FR-046, NFR-P-006)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Adequate
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Measured and capped |
| **Impact** | 3 - Moderate | Unchanged |
| **Residual Risk Score** | **6** (Medium) | 2 × 3 = 6 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 33% reduction from inherent (9 → 6)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Measure in Phase 0 evaluation.

#### Risk Appetite Assessment

**Proposed appetite for FINANCIAL risks:** Moderate (score ≤ 9)
**Current Residual Risk Score:** 6 (Medium)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Record cost per turn in the Phase 0 evaluations**
   - Owner: Engineering and delivery team (S-12)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 2 to 1

2. **Run /arckit:finops once the design is set**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Improves forecasting

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 3 (Moderate)
- Target Score: 3 (Low) ✅ Within appetite (≤ 9)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 3 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Cost per active journey per month
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-018: Pace pressure overrides safety and regulatory gates

**Category:** OPERATIONAL
**Status:** Open
**Risk Owner:** Haim Ozchakir, Executive Sponsor (S-11) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Clinical Safety and Regulatory Lead (S-7)

#### Risk Identification

**Risk Description:**
Funding or commercial pressure leads to pilot launch before the regulatory determination, floor approval or privacy assessment are complete.

**Root Cause:**
Revenue pressure (SD-10) and the veto holder also owning product delivery (R-001).

**Trigger Events:**

- Fixed pilot date announced to a customer
- Gate evidence incomplete at go/no-go

**Consequences if Realized:**

- Participant harm or regulatory breach
- Pilot suspended

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-11; S-13; S-7; S-10

**Related Objectives:** G-4; G-5; G-1

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Pressure likely |
| **Impact** | 5 - Catastrophic | Severe consequences |
| **Inherent Risk Score** | **15** (High) | 3 × 5 = 15 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Clinical safety lead veto on go/no-go (STKE RACI)**
   - Owner: Chris McKelt, Clinical Safety and Regulatory Lead (S-7)
   - Effectiveness: Weak
   - Evidence: Veto holder is also product owner (R-001)

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Weak independence of the veto |
| **Impact** | 4 - Major | Gates still exist |
| **Residual Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 20% reduction from inherent (15 → 12)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Make gate evidence explicit and independently reviewed.

#### Risk Appetite Assessment

**Proposed appetite for OPERATIONAL risks:** Moderate (score ≤ 9)
**Current Residual Risk Score:** 12 (Medium)
**Assessment:** ❌ Exceeds appetite by 3 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Written go/no-go criteria signed by the sponsor and the independent clinical adviser**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 3 to 2

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 4 (Major)
- Target Score: 8 (Medium) ✅ Within appetite (≤ 9)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 8 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Gate evidence completeness 30 days before go/no-go
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-019: Team capacity is insufficient for Phase 1 scope

**Category:** OPERATIONAL
**Status:** Open
**Risk Owner:** Chris McKelt, Product Owner (S-18) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
Phase 1 combines a new core, a possibly regulated pack, mobile apps, memory integration and a first cloud profile for a small team.

**Root Cause:**
Broad scope before prioritisation; few named people.

**Trigger Events:**

- Velocity below plan
- Key person unavailable

**Consequences if Realized:**

- Pilot delay
- Shortcuts that increase R-012 and R-018

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-12; S-18; S-11

**Related Objectives:** G-1; G-7

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 4 - Likely | Scope is large |
| **Impact** | 4 - Major | Delays pilot |
| **Inherent Risk Score** | **16** (High) | 4 × 4 = 16 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Modular monolith, one cloud first, null memory fallback (TC-5, TC-6)**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Effectiveness: Adequate
   - Evidence: Decided

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Scope still large |
| **Impact** | 4 - Major | Unchanged |
| **Residual Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 25% reduction from inherent (16 → 12)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Prioritise with a backlog and plan.

#### Risk Appetite Assessment

**Proposed appetite for OPERATIONAL risks:** Moderate (score ≤ 9)
**Current Residual Risk Score:** 12 (Medium)
**Assessment:** ❌ Exceeds appetite by 3 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Create a prioritised backlog with /arckit:backlog**
   - Owner: Chris McKelt, Product Owner (S-18)
   - Due Date: 2027-01-31
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 3 to 2

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 3 (Moderate)
- Target Score: 6 (Medium) ✅ Within appetite (≤ 9)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 6 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Velocity against plan; key-person dependencies
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-020: Design and governance documents are public

**Category:** REPUTATIONAL
**Status:** Accepted
**Risk Owner:** Haim Ozchakir, Executive Sponsor (S-11) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Architecture Owner (S-10)

#### Risk Identification

**Risk Description:**
The proof of concept is built in the open: the repository and its GitHub Pages site publish the solution design, requirements, stakeholder analysis (including named individuals and the role-concentration risk), this register and the privacy impact assessment.

**Root Cause:**
Deliberate decision on 2026-09-29 to build the proof of concept in the open.

**Trigger Events:**

- Competitor or buyer reads unfavourable risks
- Named individuals object
- Real participant data or commercial terms are later added to the repository

**Consequences if Realized:**

- Commercial information available to competitors
- Buyers see open governance gaps

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-11; S-10; S-13; S-4

**Related Objectives:** G-11

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 5 - Almost Certain | Publication is certain |
| **Impact** | 3 - Moderate | Commercial and reputational rather than safety impact |
| **Inherent Risk Score** | **15** (High) | 5 × 3 = 15 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Publication decision: all proof-of-concept artefacts may be public; no participant data exists (2026-09-29)**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Effectiveness: Adequate
   - Evidence: Decision recorded in this register and the privacy impact assessment

2. **Pages confidentiality check reports markings on every publish**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Effectiveness: Adequate
   - Evidence: Runs with /arckit:pages

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 4 - Likely | Content remains public by design |
| **Impact** | 2 - Minor | Deliberate openness removes the risk of surprise; proof-of-concept content only |
| **Residual Risk Score** | **8** (Medium) | 4 × 2 = 8 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 47% reduction from inherent (15 → 8)

#### Risk Response (4Ts Framework)

**Primary Response:** TOLERATE

**Rationale:** Building in the open is a deliberate choice for the proof of concept; the residual exposure is accepted. Revisit before real participants or commercial contracts.

#### Risk Appetite Assessment

**Proposed appetite for REPUTATIONAL risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 8 (Medium)
**Assessment:** ❌ Exceeds appetite by 2 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Revisit the publication decision before pilot enrolment and commercial contracts**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Keeps real participant and contract data out of the public repository

**Target Residual Risk After Mitigations:**

- Target Likelihood: 4 (Likely)
- Target Impact: 2 (Minor)
- Target Score: 8 (Medium) ⚠️ Still above appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 8 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Any real participant data, credentials or contract terms proposed for the public repository
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-021: Advocacy groups criticise AI or data practices

**Category:** REPUTATIONAL
**Status:** Open
**Risk Owner:** Chris McKelt, Product Owner (S-18) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Product Owner (S-18)

#### Risk Identification

**Risk Description:**
Patient or consumer advocacy organisations publicly criticise Cairn's use of AI or participant data.

**Root Cause:**
Public sensitivity about AI and health data.

**Trigger Events:**

- Opaque AI use
- Perceived data monetisation

**Consequences if Realized:**

- Recruitment harder
- Buyer hesitation

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-17; S-1

**Related Objectives:** G-2; G-3

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Low if practices are transparent |
| **Impact** | 4 - Major | Significant reputational effect |
| **Inherent Risk Score** | **8** (Medium) | 2 × 4 = 8 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Deterministic decisions, no secondary use, plain-language AI transparency (NFR-C-006, DR-012)**
   - Owner: Chris McKelt, Product Owner (S-18)
   - Effectiveness: Strong
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 1 - Rare | Principled design |
| **Impact** | 4 - Major | Unchanged |
| **Residual Risk Score** | **4** (Low) | 1 × 4 = 4 |

**Risk Zone:** 🟩 Low (1-5)
**Risk Reduction:** 50% reduction from inherent (8 → 4)

#### Risk Response (4Ts Framework)

**Primary Response:** TOLERATE

**Rationale:** Within appetite once co-design starts; monitor.

#### Risk Appetite Assessment

**Proposed appetite for REPUTATIONAL risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 4 (Low)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Involve an advocacy organisation in co-design (R-014)**
   - Owner: Chris McKelt, Product Owner (S-18)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Maintains low likelihood

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 4 (Major)
- Target Score: 4 (Low) ✅ Within appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 4 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Public commentary; advocacy feedback
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-022: Cross-tenant or cross-journey data leakage

**Category:** TECHNOLOGY
**Status:** Open
**Risk Owner:** Chris McKelt, Architecture Owner (S-10) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
A defect lets one tenant, journey or memory scope read another's data, for example a health journey leaking into a mentoring journey.

**Root Cause:**
Shared code across data planes; logical partitioning in some stores.

**Trigger Events:**

- Missing scope filter in a query
- Memory provider partition misconfiguration

**Consequences if Realized:**

- Serious privacy breach (R-004)
- Loss of trust

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-1; S-8; S-4

**Related Objectives:** G-3

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Common defect class |
| **Impact** | 5 - Catastrophic | Severe |
| **Inherent Risk Score** | **15** (High) | 3 × 5 = 15 |

**Risk Zone:** 🟧 High (13-19)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Row-level security and journey-scoped data access (DR-007)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Strong
   - Evidence: Designed

2. **Store-as-A, read-as-B tests blocking release (NFR-SEC-007)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Strong
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 1 - Rare | Multiple layers and tests |
| **Impact** | 5 - Catastrophic | Unchanged |
| **Residual Risk Score** | **5** (Low) | 1 × 5 = 5 |

**Risk Zone:** 🟩 Low (1-5)
**Risk Reduction:** 67% reduction from inherent (15 → 5)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Keep likelihood minimal through automated tests.

#### Risk Appetite Assessment

**Proposed appetite for TECHNOLOGY risks:** Medium (score ≤ 12)
**Current Residual Risk Score:** 5 (Low)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Implement isolation test suite in CI from the first sprint**
   - Owner: Engineering and delivery team (S-12)
   - Due Date: 2027-01-31
   - Cost: Not yet estimated
   - Expected Impact: Maintains likelihood 1

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 5 (Catastrophic)
- Target Score: 5 (Low) ✅ Within appetite (≤ 12)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 5 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Isolation test failures
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-023: Third-party licence or supplier constraints

**Category:** OPERATIONAL
**Status:** Open
**Risk Owner:** Chris McKelt, Architecture Owner (S-10) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
A dependency (memory provider datastore, speech engine or model) carries a restrictive licence or supplier terms that conflict with commercial or regulated use.

**Root Cause:**
Mixed open-source licences, including copyleft and source-available.

**Trigger Events:**

- Licence review finds AGPL or SSPL in the data path
- Supplier trains on customer data

**Consequences if Realized:**

- Component replacement
- Legal exposure

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-10; S-15

**Related Objectives:** G-8

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Licence policy in place |
| **Impact** | 3 - Moderate | Replacement effort |
| **Inherent Risk Score** | **6** (Medium) | 2 × 3 = 6 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Licence policy for data-path components (TC-9)**
   - Owner: Chris McKelt, Architecture Owner (S-10)
   - Effectiveness: Adequate
   - Evidence: Documented

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 1 - Rare | Reviewed in evaluation |
| **Impact** | 3 - Moderate | Unchanged |
| **Residual Risk Score** | **3** (Low) | 1 × 3 = 3 |

**Risk Zone:** 🟩 Low (1-5)
**Risk Reduction:** 50% reduction from inherent (6 → 3)

#### Risk Response (4Ts Framework)

**Primary Response:** TOLERATE

**Rationale:** Low residual risk within appetite.

#### Risk Appetite Assessment

**Proposed appetite for OPERATIONAL risks:** Moderate (score ≤ 9)
**Current Residual Risk Score:** 3 (Low)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Licence review as part of the memory provider evaluation**
   - Owner: Engineering and delivery team (S-12)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Maintains low likelihood

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 3 (Moderate)
- Target Score: 3 (Low) ✅ Within appetite (≤ 9)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 3 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Unreviewed licences in the software bill of materials
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-024: Participant consent invalidated by changing capacity

**Category:** COMPLIANCE
**Status:** Open
**Risk Owner:** Chris McKelt, Privacy Officer (S-8) (from Stakeholder RACI: Accountable)
**Action Owner:** Chris McKelt, Clinical Safety and Regulatory Lead (S-7)

#### Risk Identification

**Risk Description:**
Parkinson's can bring cognitive change over a long journey. A participant who consented with capacity may later be unable to understand or change their consent while recording and sharing continue (DPIA-005).

**Root Cause:**
Consent-based processing of sensitive information; no authorised-representative mechanism in v1 (FR-032 assumption).

**Trigger Events:**

- Clinician or carer raises concern about capacity
- Participant no longer recognises earlier approvals

**Consequences if Realized:**

- Processing and disclosure without valid consent
- Loss of autonomy for the participant
- Health service governance concerns

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-1 participants; S-2 carers; S-4 health service; S-8

**Related Objectives:** G-3; G-4

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Plausible over months to years of a journey |
| **Impact** | 4 - Major | Sensitive information disclosed without valid consent |
| **Inherent Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Capacity procedure proposed in ARC-001-DPIA-v1.0 (condition 2)**
   - Owner: Chris McKelt, Privacy Officer (S-8)
   - Effectiveness: Weak
   - Evidence: Proposed only

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | No procedure in place yet |
| **Impact** | 4 - Major | Unchanged |
| **Residual Risk Score** | **12** (Medium) | 3 × 4 = 12 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 0% reduction from inherent (12 → 12)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** A pre-enrolment condition of the privacy impact assessment.

#### Risk Appetite Assessment

**Proposed appetite for COMPLIANCE risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 12 (Medium)
**Assessment:** ❌ Exceeds appetite by 6 points
**Escalation Required:** Yes - executive sponsor decision

#### Action Plan

**Additional Mitigations Needed:**

1. **Define the capacity procedure (confirmation at enrolment, periodic re-confirmation, pause on concern) and add a requirement**
   - Owner: Chris McKelt, Privacy Officer (S-8)
   - Due Date: 2026-12-15
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 3 to 2

2. **Agree a nominated-person process with the health service**
   - Owner: Haim Ozchakir, Executive Sponsor (S-11)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Impact 4 to 3

**Target Residual Risk After Mitigations:**

- Target Likelihood: 2 (Unlikely)
- Target Impact: 3 (Moderate)
- Target Score: 6 (Medium) ✅ Within appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 6 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Consent re-confirmation rate; journeys paused for capacity concerns
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

### Risk R-025: Carer and third-party information handled without their knowledge

**Category:** COMPLIANCE
**Status:** Open
**Risk Owner:** Chris McKelt, Privacy Officer (S-8) (from Stakeholder RACI: Accountable)
**Action Owner:** Engineering and delivery team (S-12)

#### Risk Identification

**Risk Description:**
Carers contribute observations that also reveal their own information, and participants mention other people in free-text entries who do not know they are recorded (DPIA-009).

**Root Cause:**
Contributor model and free-text diary entries.

**Trigger Events:**

- Carer asks what is held about them
- A third party named in a brief objects

**Consequences if Realized:**

- Complaints about undisclosed collection
- Rights requests Cairn cannot easily fulfil

**Affected Stakeholders** (ARC-001-STKE-v1.2): S-2 carers; S-1 participants; S-8

**Related Objectives:** G-3

#### Inherent Risk Assessment (Before Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 3 - Possible | Common in diary content |
| **Impact** | 3 - Moderate | Distress rather than serious harm |
| **Inherent Risk Score** | **9** (Medium) | 3 × 3 = 9 |

**Risk Zone:** 🟨 Medium (6-12)

#### Current Controls and Mitigations

**Existing Controls:**

1. **Scoped contributor access; contributors see and control their own contributions (FR-003)**
   - Owner: Engineering and delivery team (S-12)
   - Effectiveness: Adequate
   - Evidence: Designed

#### Residual Risk Assessment (After Controls)

| Assessment | Rating | Justification |
|------------|--------|---------------|
| **Likelihood** | 2 - Unlikely | Contributor model limits exposure |
| **Impact** | 3 - Moderate | Unchanged |
| **Residual Risk Score** | **6** (Medium) | 2 × 3 = 6 |

**Risk Zone:** 🟨 Medium (6-12)
**Risk Reduction:** 33% reduction from inherent (9 → 6)

#### Risk Response (4Ts Framework)

**Primary Response:** TREAT

**Rationale:** Low-cost procedural fixes.

#### Risk Appetite Assessment

**Proposed appetite for COMPLIANCE risks:** Low (score ≤ 6)
**Current Residual Risk Score:** 6 (Medium)
**Assessment:** ✅ Within appetite
**Escalation Required:** No

#### Action Plan

**Additional Mitigations Needed:**

1. **Write a contributor rights procedure and in-app guidance on mentioning others**
   - Owner: Chris McKelt, Privacy Officer (S-8)
   - Due Date: 2027-03-31
   - Cost: Not yet estimated
   - Expected Impact: Likelihood 2 to 1

**Target Residual Risk After Mitigations:**

- Target Likelihood: 1 (Rare)
- Target Impact: 3 (Moderate)
- Target Score: 3 (Low) ✅ Within appetite (≤ 6)

**Success Criteria:**

- Actions complete by their due dates
- Residual score at or below 3 at the next review

**Monitoring Plan:**

- **Frequency:** Monthly review by the risk owner
- **Key Indicators:** Contributor rights requests; complaints from third parties
- **Escalation Triggers:** score increases by 3 or more points; any action more than 2 weeks late

---

## D. Risk Category Analysis

### STRATEGIC Risks

- **Risks:** R-001 Role concentration undermines independent assurance, R-013 Clinicians do not use the briefs, R-014 Participants stop recording between visits, R-015 Buyers reject participant-first data terms
- **Average inherent:** 14.8; **average residual:** 11.2 (24% reduction)
- **Exceeding proposed appetite (≤ 12):** R-001

### OPERATIONAL Risks

- **Risks:** R-018 Pace pressure overrides safety and regulatory gates, R-019 Team capacity is insufficient for Phase 1 scope, R-023 Third-party licence or supplier constraints
- **Average inherent:** 12.3; **average residual:** 9.0 (27% reduction)
- **Exceeding proposed appetite (≤ 9):** R-018, R-019

### FINANCIAL Risks

- **Risks:** R-016 No business case or confirmed funding runway, R-017 Model inference and memory costs exceed plan
- **Average inherent:** 12.0; **average residual:** 10.5 (12% reduction)
- **Exceeding proposed appetite (≤ 9):** R-016

### COMPLIANCE/REGULATORY Risks

- **Risks:** R-002 Parkinson's pack is classified as a medical device, R-003 Safety floor misses self-harm or immediate danger, R-004 Unauthorised disclosure of participant health data, R-005 Privacy impact assessment not completed before pilot, R-006 Safety disclosure obligations conflict with participant control, R-007 Statutory record retention conflicts with deletion requests, R-011 Model-derived memory treated as clinical truth, R-024 Participant consent invalidated by changing capacity, R-025 Carer and third-party information handled without their knowledge
- **Average inherent:** 13.2; **average residual:** 9.3 (29% reduction)
- **Exceeding proposed appetite (≤ 6):** R-002, R-003, R-004, R-005, R-006, R-024

### REPUTATIONAL Risks

- **Risks:** R-020 Design and governance documents are public, R-021 Advocacy groups criticise AI or data practices
- **Average inherent:** 11.5; **average residual:** 6.0 (48% reduction)
- **Exceeding proposed appetite (≤ 6):** R-020

### TECHNOLOGY Risks

- **Risks:** R-008 On-device transcription fails for Parkinsonian speech, R-009 Capable models unavailable within Australian regions, R-010 Memory provider immature or deletion unverifiable, R-012 Domain vocabulary leaks into the core, R-022 Cross-tenant or cross-journey data leakage
- **Average inherent:** 12.8; **average residual:** 7.0 (45% reduction)
- **Exceeding proposed appetite (≤ 12):** None

**Key themes:** Compliance risks carry the most weight (health data, possible device regulation, safety). Strategic risks centre on adoption by clinicians, participants and buyers. Technology risks are largely controlled by design.

---

## E. Risk Ownership Matrix

| Stakeholder | Role | Owned Risks | Critical | High | Medium | Low | Total Score | Risk Concentration |
|-------------|------|-------------|----------|------|--------|-----|-------------|-------------------|
| Haim Ozchakir | Executive Sponsor (S-11) | R-001, R-002, R-004, R-006, R-015, R-016, R-017, R-018, R-020 | 0 | 2 | 7 | 0 | 100 | ⚠️ High concentration |
| Chris McKelt | Product Owner (S-18) | R-008, R-013, R-014, R-019, R-021 | 0 | 0 | 4 | 1 | 48 | ⚠️ High concentration |
| Chris McKelt | Privacy Officer (S-8) | R-005, R-007, R-024, R-025 | 0 | 0 | 4 | 0 | 36 | Moderate |
| Chris McKelt | Architecture Owner (S-10) | R-009, R-010, R-012, R-022, R-023 | 0 | 0 | 3 | 2 | 26 | Moderate |
| Chris McKelt | Clinical Safety and Regulatory Lead (S-7) | R-003, R-011 | 0 | 0 | 1 | 1 | 14 | Low |

**Risk Concentration Analysis:** Chris McKelt owns 16 of 25 risks across four roles, and Haim Ozchakir 9. Assigning owners by role keeps the RACI intact, but in practice two people carry the whole register. Appointing independent clinical safety and privacy roles (R-001) would redistribute R-003, R-005, R-007 and R-011.

**Escalation Paths:**

- Safety and regulatory risks → clinical safety lead → executive sponsor (with independent clinical adviser once engaged)
- Privacy and compliance risks → privacy officer → executive sponsor
- Technology risks → architecture owner → Architecture Review Board → executive sponsor
- Strategic, financial and reputational risks → executive sponsor

---

## F. 4Ts Response Framework Summary

| Response | Count | % | Total Residual Score | Key Examples |
|----------|-------|---|------------------|--------------|
| **TOLERATE** | 3 | 12% | 15 | R-020, R-021, R-023 |
| **TREAT** | 21 | 84% | 205 | R-001, R-002, R-003, R-004, R-005, R-006, R-007, R-008, R-009, R-010, R-012, R-013, R-014, R-015, R-016, R-017, R-018, R-019, R-022, R-024, R-025 |
| **TRANSFER** | 0 | 0% | 0 | None |
| **TERMINATE** | 1 | 4% | 4 | R-011 |
| **TOTAL** | 25 | 100% | 224 | |

**Key Insights:**

- Most risks need active treatment, mainly through Phase 0 governance actions.
- **Terminate** (R-011): the regulated pilot will not use model-derived memory at all (null provider).
- **Transfer** is not a primary response for any risk; cyber insurance is proposed as a secondary response for R-004 and should be priced in the business case.

---

## G. Risk Appetite Compliance

No organisational risk appetite exists. The thresholds below are **proposed** for a trust-sensitive health and personal development product, and need approval by Haim Ozchakir.

| Category | Appetite Level | Threshold Score | Description |
|----------|---------------|-----------------|-------------|
| STRATEGIC | Medium | ≤ 12 | Accept medium risk to prove the platform and market |
| OPERATIONAL | Moderate | ≤ 9 | Moderate tolerance for delivery disruption |
| FINANCIAL | Moderate | ≤ 9 | Moderate tolerance while funding is unconfirmed |
| COMPLIANCE | Low | ≤ 6 | Low tolerance: health data, safety and possible device regulation |
| REPUTATIONAL | Low | ≤ 6 | Low tolerance: trust is the product |
| TECHNOLOGY | Medium | ≤ 12 | Accept new technology behind replaceable interfaces |

**Compliance Summary:**

| Category | Appetite | Risks Within | Risks Exceeding | Action Required |
|----------|----------|--------------|-----------------|-----------------|
| STRATEGIC | ≤ 12 | 3 | 1 | ⚠️ Executive sponsor decision: R-001 |
| OPERATIONAL | ≤ 9 | 1 | 2 | ⚠️ Executive sponsor decision: R-018, R-019 |
| FINANCIAL | ≤ 9 | 1 | 1 | ⚠️ Executive sponsor decision: R-016 |
| COMPLIANCE | ≤ 6 | 3 | 6 | ⚠️ Executive sponsor decision: R-002, R-003, R-004, R-005, R-006, R-024 |
| REPUTATIONAL | ≤ 6 | 1 | 1 | ⚠️ Executive sponsor decision: R-020 |
| TECHNOLOGY | ≤ 12 | 5 | 0 | ✅ Compliant |

**Overall Appetite Compliance:** 11 of 25 risks exceed the proposed appetite. Each needs either its mitigations completed or an explicit acceptance by the executive sponsor.

---

## H. Prioritized Action Plan

### Priority 1: URGENT (Critical Inherent Risks or Appetite Exceedance)

| # | Action | Risk(s) Addressed | Owner | Due Date | Cost | Expected Impact | Status |
|---|--------|-------------------|-------|----------|------|-----------------|--------|
| 1 | Start a decision log recording the role behind each decision | R-001 (STRATEGIC) | Chris McKelt | 2026-10-15 | Not estimated | Improves evidence | Not Started |
| 2 | Run /arckit:dpia for the core and Parkinson's pack | R-005 (COMPLIANCE) | Chris McKelt | 2026-11-30 | Not estimated | Likelihood 4 to 2 | Not Started |
| 3 | Obtain legal advice on disclosure duties for health and employer tenants | R-006 (COMPLIANCE) | Haim Ozchakir | 2026-11-30 | Not estimated | Likelihood 3 to 2 | Not Started |
| 4 | Engage an independent, clinically qualified clinical safety adviser | R-001 (STRATEGIC) | Haim Ozchakir | 2026-12-15 | Not estimated | Likelihood 4 to 2 | Not Started |
| 5 | Obtain regulatory advice and document intended purpose and classification | R-002 (COMPLIANCE) | Haim Ozchakir | 2026-12-15 | Not estimated | Removes uncertainty | Not Started |
| 6 | Price cyber insurance in the business case | R-004 (COMPLIANCE) | Haim Ozchakir | 2026-12-15 | Not estimated | Transfers part of financial impact | Not Started |
| 7 | Update principles to v1.1 with the legal-obligation clarification | R-006 (COMPLIANCE) | Chris McKelt | 2026-12-15 | Not estimated | Impact 4 to 3 | Not Started |
| 8 | Run /arckit:sobc to produce a costed business case | R-016 (FINANCIAL) | Haim Ozchakir | 2026-12-15 | Not estimated | Likelihood 3 to 2 | Not Started |
| 9 | Run /arckit:plan to set dates and phase budgets | R-016 (FINANCIAL) | Chris McKelt | 2026-12-15 | Not estimated | Impact 5 to 4 | Not Started |
| 10 | Define the capacity procedure (confirmation at enrolment, periodic re-confirmation, pause on concern) and add a requirement | R-024 (COMPLIANCE) | Chris McKelt | 2026-12-15 | Not estimated | Likelihood 3 to 2 | Not Started |
| 11 | Adopt an IEC 62304-aligned lifecycle for the Parkinson's pack from the start | R-002 (COMPLIANCE) | Chris McKelt | 2027-01-31 | Not estimated | Impact 4 to 3 | Not Started |
| 12 | Create a prioritised backlog with /arckit:backlog | R-019 (OPERATIONAL) | Chris McKelt | 2027-01-31 | Not estimated | Likelihood 3 to 2 | Not Started |
| 13 | Commission an external privacy review before pilot enrolment | R-001 (STRATEGIC) | Haim Ozchakir | 2027-03-31 | Not estimated | Likelihood 4 to 2 | Not Started |
| 14 | Clinically approve floor rules and messages, with independent clinical review (see R-001) | R-003 (COMPLIANCE) | Chris McKelt | 2027-03-31 | Not estimated | Likelihood 2 to 1 | Not Started |
| 15 | External privacy review of the assessment (R-001) | R-005 (COMPLIANCE) | Haim Ozchakir | 2027-03-31 | Not estimated | Impact 3 to 2 | Not Started |
| 16 | Written go/no-go criteria signed by the sponsor and the independent clinical adviser | R-018 (OPERATIONAL) | Haim Ozchakir | 2027-03-31 | Not estimated | Likelihood 3 to 2 | Not Started |
| 17 | Revisit the publication decision before pilot enrolment and commercial contracts | R-020 (REPUTATIONAL) | Haim Ozchakir | 2027-03-31 | Not estimated | Keeps real participant and contract data out of the public repository | Not Started |
| 18 | Agree a nominated-person process with the health service | R-024 (COMPLIANCE) | Haim Ozchakir | 2027-03-31 | Not estimated | Impact 4 to 3 | Not Started |
| 19 | Build the floor regression suite with representative voices and phrasing | R-003 (COMPLIANCE) | Engineering and delivery team (S-12) | 2027-04-30 | Not estimated | Likelihood 2 to 1 | Not Started |
| 20 | Threat model and penetration test before pilot | R-004 (COMPLIANCE) | Chris McKelt | 2027-05-31 | Not estimated | Likelihood 2 to 1 | Not Started |

### Priority 2: HIGH (Residual Medium Risks of 9 or More)

| # | Action | Risk(s) Addressed | Owner | Due Date | Cost | Expected Impact | Status |
|---|--------|-------------------|-------|----------|------|-----------------|--------|
| 1 | Device-lab evaluation of speech engines on representative voices | R-008 (TECHNOLOGY) | Engineering and delivery team (S-12) | 2026-12-15 | Not estimated | Likelihood 3 to 2 | Not Started |
| 2 | Set the pack word error rate target from evaluation results | R-008 (TECHNOLOGY) | Chris McKelt | 2026-12-15 | Not estimated | Clarifies acceptance | Not Started |
| 3 | Test brief prototypes with 5 or more clinicians | R-013 (STRATEGIC) | Chris McKelt | 2026-12-15 | Not estimated | Likelihood 3 to 2 | Not Started |
| 4 | Agree clinician responsibilities with the health service | R-013 (STRATEGIC) | Haim Ozchakir | 2027-03-31 | Not estimated | Impact 4 to 3 | Not Started |
| 5 | Standard data terms and a buyer briefing pack | R-015 (STRATEGIC) | Haim Ozchakir | 2027-03-31 | Not estimated | Likelihood 3 to 2 | Not Started |

### Priority 3: MEDIUM (Lower Residual Risks Requiring Treatment)

| # | Action | Risk(s) Addressed | Owner | Due Date | Cost | Expected Impact | Status |
|---|--------|-------------------|-------|----------|------|-----------------|--------|
| 1 | Run /arckit:aws-research for per-task model availability in Australian regions | R-009 (TECHNOLOGY) | Chris McKelt | 2026-11-15 | Not estimated | Likelihood 2 to 1 | Not Started |
| 2 | Include record-holder question in legal advice (R-006) | R-007 (COMPLIANCE) | Haim Ozchakir | 2026-11-30 | Not estimated | Likelihood 2 to 1 | Not Started |
| 3 | Run the memory provider evaluation with a null-provider control arm | R-010 (TECHNOLOGY) | Engineering and delivery team (S-12) | 2026-12-15 | Not estimated | Likelihood 2 to 1 | Not Started |
| 4 | Co-design sessions with people living with Parkinson's and an advocacy organisation | R-014 (STRATEGIC) | Chris McKelt | 2026-12-15 | Not estimated | Likelihood 2 to 1 | Not Started |
| 5 | Record cost per turn in the Phase 0 evaluations | R-017 (FINANCIAL) | Engineering and delivery team (S-12) | 2026-12-15 | Not estimated | Likelihood 2 to 1 | Not Started |
| 6 | Involve an advocacy organisation in co-design (R-014) | R-021 (REPUTATIONAL) | Chris McKelt | 2026-12-15 | Not estimated | Maintains low likelihood | Not Started |
| 7 | Licence review as part of the memory provider evaluation | R-023 (OPERATIONAL) | Engineering and delivery team (S-12) | 2026-12-15 | Not estimated | Maintains low likelihood | Not Started |
| 8 | Build the vocabulary lint in the first sprint | R-012 (TECHNOLOGY) | Engineering and delivery team (S-12) | 2027-01-31 | Not estimated | Likelihood 2 to 1 | Not Started |
| 9 | Implement isolation test suite in CI from the first sprint | R-022 (TECHNOLOGY) | Engineering and delivery team (S-12) | 2027-01-31 | Not estimated | Maintains likelihood 1 | Not Started |
| 10 | Configure the Parkinson's pack with the null provider for the pilot | R-011 (COMPLIANCE) | Chris McKelt | 2027-03-31 | Not estimated | Removes the source of risk | Not Started |
| 11 | Run /arckit:finops once the design is set | R-017 (FINANCIAL) | Chris McKelt | 2027-03-31 | Not estimated | Improves forecasting | Not Started |
| 12 | Write a contributor rights procedure and in-app guidance on mentioning others | R-025 (COMPLIANCE) | Chris McKelt | 2027-03-31 | Not estimated | Likelihood 2 to 1 | Not Started |

---

## I. Integration with SOBC

### SOBC Strategic Case (Part A)

- R-013, R-014 and R-015 (adoption by clinicians, participants and buyers) are the main threats to the case for change.

### SOBC Economic Case (Part B)

- R-016 and R-017 inform risk-adjusted costs; R-002 may add a regulated lifecycle cost to the preferred option.

### SOBC Management Case (Part E - Risk Management)

- This register, the proposed appetite and the monitoring framework below form Part E.

### SOBC Recommendation

- R-001 and R-018 suggest the business case should fund independent clinical safety and privacy roles before the pilot.

---

## J. Monitoring and Review Framework

### Review Schedule

| Risk Level | Review Frequency | Reviewed By | Escalated To | Report Format |
|------------|------------------|-------------|--------------|---------------|
| **Critical (20-25)** | Weekly | Risk owner | Executive sponsor | Dashboard + narrative |
| **High (13-19)** | Fortnightly | Risk owner | Executive sponsor | Dashboard |
| **Medium (6-12)** | Monthly | Risk owner | Architecture Review Board | Exception report |
| **Low (1-5)** | Quarterly | Action owner | Risk owner | Status update |

### Key Risk Indicators (KRIs)

**Leading Indicators:**

- Phase 0 governance actions (roles, legal advice, business case, privacy assessment) behind plan → R-001, R-005, R-006, R-016
- Word error rate on representative voices above target → R-008
- Contract requests for principle exceptions → R-015

**Lagging Indicators:**

- Brief open rate below 80% → R-013 realised
- Weekly recording falling after month 2 → R-014 realised
- Any isolation test failure or notifiable breach → R-004, R-022 realised

### Escalation Criteria

1. Any risk increases by 5 or more points
2. Any new Critical risk (score 20-25)
3. Any risk exceeds appetite without an approved mitigation plan
4. Any mitigation action more than 1 month late
5. 3 or more risks in the same category exceed appetite

### Reporting Requirements

**Fortnightly:** High and above-appetite risks to the executive sponsor

**Monthly:** Full register to the Architecture Review Board

**Quarterly:** Appetite review and trend analysis with the executive sponsor

### Risk Register Maintenance

**Risk Register Owner:** Chris McKelt (Product Owner), accountable to Haim Ozchakir (Executive Sponsor)

**Update Process:**

1. Risk owners update scores and actions before each review
2. The register owner validates and versions the register
3. The executive sponsor approves appetite exceptions

---

## K. Orange Book Compliance Checklist

### Part I - Risk Management Principles

- ✅ **A. Governance and Leadership**: owners assigned from the stakeholder RACI; ⚠️ independence limited (R-001)
- ✅ **B. Integration**: risks linked to stakeholder goals G-1 to G-11 and requirements
- ✅ **C. Collaboration and Best Information**: risks drawn from requirements, stakeholder analysis, data model and design; ⚠️ not yet validated with stakeholders
- ✅ **D. Risk Management Processes**: identification, inherent and residual assessment, 4Ts response, action plans
- ✅ **E. Continual Improvement**: review schedule, KRIs, escalation criteria, version control

### Part II - Risk Control Framework

- ⚠️ **Risk appetite**: proposed, not yet approved
- ✅ **Risk ownership and governance**: defined
- ✅ **Assessment methodology**: documented (Appendix A)
- ✅ **Control effectiveness**: inherent vs residual measured (controls mostly designed, not built)

---

## Appendix A: Risk Assessment Scales

### Likelihood Scale (1-5)

| Score | Rating | Probability | Description |
|-------|--------|-------------|-------------|
| 1 | Rare | < 5% | Highly unlikely |
| 2 | Unlikely | 5-25% | Could happen but probably won't |
| 3 | Possible | 25-50% | Reasonable chance |
| 4 | Likely | 50-75% | More likely than not |
| 5 | Almost Certain | > 75% | Expected to occur |

### Impact Scale (1-5)

| Score | Rating | Description |
|-------|--------|-------------|
| 1 | Negligible | Minimal impact, easily absorbed |
| 2 | Minor | Manageable within reserves |
| 3 | Moderate | Significant, needs management effort |
| 4 | Major | Threatens objectives |
| 5 | Catastrophic | Harm to a person, project failure or existential threat |

### Risk Score Matrix (Likelihood × Impact)

- **Critical (20-25)**: immediate escalation
- **High (13-19)**: executive sponsor attention
- **Medium (6-12)**: management monitoring
- **Low (1-5)**: routine monitoring

---

## Appendix B: Stakeholder-Risk Linkage

| Stakeholder | Driver (from ARC-001-STKE-v1.2) | Risk ID | Risk Title | Category | Residual |
|-------------|-------------------------------------|---------|------------|----------|-------|
| S-11 Haim Ozchakir | SD-10 Prove platform thesis, reach revenue | R-016 | No business case or confirmed funding runway | FINANCIAL | 15 |
| S-11 Haim Ozchakir | SD-10 Prove platform thesis, reach revenue | R-015 | Buyers reject participant-first data terms | STRATEGIC | 9 |
| S-11 Haim Ozchakir | SD-10 Prove platform thesis, reach revenue | R-012 | Domain vocabulary leaks into the core | TECHNOLOGY | 6 |
| S-7 Clinical safety lead | SD-13 Safety and no regulatory drift | R-002 | Parkinson's pack is classified as a medical device | COMPLIANCE | 12 |
| S-7 Clinical safety lead | SD-13 Safety and no regulatory drift | R-003 | Safety floor misses self-harm or immediate danger | COMPLIANCE | 10 |
| S-7 Clinical safety lead | SD-13 Safety and no regulatory drift | R-011 | Model-derived memory treated as clinical truth | COMPLIANCE | 4 |
| S-7 Clinical safety lead | SD-13 Safety and no regulatory drift | R-018 | Pace pressure overrides safety and regulatory gates | OPERATIONAL | 12 |
| S-8 Privacy officer | SD-14 Lawful handling, no breach | R-004 | Unauthorised disclosure of participant health data | COMPLIANCE | 10 |
| S-8 Privacy officer | SD-14 Lawful handling, no breach | R-005 | Privacy impact assessment not completed before pilot | COMPLIANCE | 12 |
| S-8 Privacy officer | SD-14 Lawful handling, no breach | R-022 | Cross-tenant or cross-journey data leakage | TECHNOLOGY | 5 |
| S-1 Participants | SD-2 Control over sensitive information | R-004 | Unauthorised disclosure of participant health data | COMPLIANCE | 10 |
| S-1 Participants | SD-2 Control over sensitive information | R-006 | Safety disclosure obligations conflict with participant control | COMPLIANCE | 12 |
| S-1 Participants | SD-2 Control over sensitive information | R-020 | Design and governance documents are public | REPUTATIONAL | 8 |
| S-1 Participants | SD-3 Limited energy | R-014 | Participants stop recording between visits | STRATEGIC | 8 |
| S-1 Participants | SD-3 Limited energy | R-008 | On-device transcription fails for Parkinsonian speech | TECHNOLOGY | 12 |
| S-3 Clinicians | SD-6 Trustworthy one-page information | R-013 | Clinicians do not use the briefs | STRATEGIC | 12 |
| S-4 Employers | SD-9 Evidence the programme works | R-015 | Buyers reject participant-first data terms | STRATEGIC | 9 |
| S-12 Engineering | SD-15 Deliverable scope | R-019 | Team capacity is insufficient for Phase 1 scope | OPERATIONAL | 12 |
| S-12 Engineering | SD-15 Deliverable scope | R-010 | Memory provider immature or deletion unverifiable | TECHNOLOGY | 6 |
| S-10 Architecture owner | SD-12 Principled, portable platform | R-009 | Capable models unavailable within Australian regions | TECHNOLOGY | 6 |
| S-10 Architecture owner | SD-12 Principled, portable platform | R-012 | Domain vocabulary leaks into the core | TECHNOLOGY | 6 |
| S-10 Architecture owner | SD-12 Principled, portable platform | R-023 | Third-party licence or supplier constraints | OPERATIONAL | 3 |
| S-17 Advocacy organisations | SD-19 Benefit without exploitation | R-021 | Advocacy groups criticise AI or data practices | REPUTATIONAL | 4 |

**Stakeholder Concerns Mapped to Risks:**

| Stakeholder Conflict (from ARC-001-STKE-v1.2) | Risk(s) Created | Mitigation |
|---------------------------------------------------|-----------------|------------|
| Employer sponsors vs mentees (visibility) | R-015 | Aggregates plus voluntary summaries in contract terms |
| Health service duty of care vs participant control | R-006, R-007 | Legal advice; consent-based escalation |
| Pace vs safety and regulatory gates | R-018, R-002 | Written go/no-go criteria with independent review |
| Clinicians want less, participants want everything heard | R-013 | Participant-curated one-page brief |
| Personalisation vs privacy | R-011 | Null provider for the regulated pilot |

---

## Document Approval

| Role | Name | Signature | Date |
|------|------|-----------|------|
| **Risk Register Owner** | Chris McKelt (Product Owner) | | |
| **Clinical Safety and Regulatory Lead** | Chris McKelt | | |
| **Executive Sponsor** | Haim Ozchakir | | |

---

## Next Steps

1. **Immediate Actions** (by 2026-10-15):
   - [ ] Haim Ozchakir approves or amends the proposed risk appetite (section G)
   - [ ] Confirm acceptance of R-020 (building in the open)
   - [ ] Start the decision log (R-001)

2. **Phase 0 Actions** (by 2026-12-15):
   - [ ] Independent clinical safety adviser engaged (R-001)
   - [ ] Legal advice on disclosure and retention (R-006, R-007)
   - [ ] Business case and plan (R-016)
   - [ ] Privacy impact assessment (R-005)
   - [ ] Speech, model availability and memory evaluations (R-008, R-009, R-010)

3. **Ongoing:** monthly review at the Architecture Review Board; fortnightly for High risks

---

## External References

> This section provides traceability from generated content back to source documents.
> Follow citation instructions in the project's citation reference guide.

### Document Register

| Doc ID | Filename | Type | Source Location | Description |
|--------|----------|------|-----------------|-------------|
| CSD | 001_cairn_solution_design.md | Solution Design | `000-global/external/` | Cairn Solution Design v0.2 |

### Citations

| Citation ID | Doc ID | Page/Section | Category | Quoted Passage |
|-------------|--------|--------------|----------|----------------|
| [CSD-C1] | CSD | §12 Reference Domain Pack A | Compliance Constraint | "It does not diagnose Parkinson’s, score disease severity or recommend treatment in its initial intended purpose." |
| [CSD-C2] | CSD | §8.5 Deployment and adoption position | Risk Factor | "The evaluated release is still pre-1.0, so Cairn pins an approved version per certified deployment configuration and treats provider upgrades as evaluated changes." |

### Unreferenced Documents

| Filename | Source Location | Reason |
|----------|-----------------|--------|
| 002_technotes.md | `000-global/external/` | Memory risks taken from ARC-001-REQ-v1.1, which already cites it |
| .gitkeep | `000-global/policies/` | No risk appetite or policy documents provided |

---

**Generated by**: ArcKit `/arckit:risk` command
**Generated on**: 2026-09-29
**ArcKit Version**: 6.16.4
**Project**: Cairn — Longitudinal Guidance and Evidence Platform (Project 001)
**Model**: Claude Opus 5.5 (claude-opus-5-5)
