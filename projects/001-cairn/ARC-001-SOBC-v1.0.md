# Strategic Outline Business Case (SOBC)

> **Template Origin**: Official | **ArcKit Version**: 6.16.4 | **Command**: `/arckit:sobc`

## Document Control

| Field | Value |
|-------|-------|
| **Document ID** | ARC-001-SOBC-v1.0 |
| **Document Type** | Strategic Outline Business Case (SOBC) |
| **Project** | Cairn — Longitudinal Guidance and Evidence Platform (Project 001) |
| **Classification** | OFFICIAL |
| **Status** | DRAFT |
| **Version** | 1.0 |
| **Created Date** | 2026-09-29 |
| **Last Modified** | 2026-09-29 |
| **Review Cycle** | At each phase gate |
| **Next Review Date** | 2026-12-15 |
| **Owner** | Haim Ozchakir (Executive Sponsor, S-11) |
| **Reviewed By** | [PENDING] |
| **Approved By** | [PENDING] |
| **Distribution** | Executive Sponsor, Architecture Review Board, investors and advisers; published in the open repository |

## Revision History

| Version | Date | Author | Changes | Approved By | Approval Date |
|---------|------|--------|---------|-------------|---------------|
| 1.0 | 2026-09-29 | ArcKit AI | Initial creation from `/arckit:sobc` command | [PENDING] | [PENDING] |

## Document Purpose

This Strategic Outline Business Case asks the executive sponsor to approve the direction for Cairn and to fund Phase 0 (discovery), with later phases released at evidence-based gates. It follows the five-case structure of the HM Treasury Green Book, adapted to a private-sector Australian venture. Figures are in Australian dollars (A$), excluding GST.

**Basis and limits**:

- **Appraisal depth**: strategic estimates, as chosen for this version. Costs are rough order of magnitude (ROM, accuracy −30% to +50%); benefits are qualitative, traced to stakeholder goals. NPV, benefit-cost ratio and payback are **not calculated**, because revenue depends on a buyer model and pricing that are not yet decided [CSD-C2]. A breakeven illustration is given instead (section D4.2).
- **Options**: four, from doing nothing to a comprehensive programme.
- **Sources**: stakeholder goals from `ARC-001-STKE-v1.2`, risks from `ARC-001-RISK-v1.1`, requirements from `ARC-001-REQ-v1.1`, the privacy impact assessment `ARC-001-DPIA-v1.0`, principles in `ARC-000-PRIN-v1.0`, and the Cairn Solution Design v0.2.
- **Sequencing note**: a business case normally comes before detailed requirements. Here requirements already exist, so the next business case stage is an Outline Business Case at the end of Phase 0, not `/arckit:requirements`.

---

## Executive Summary

**Purpose**: Cairn helps people through journeys that last months or years (first, people living with Parkinson's preparing for specialist visits; second, mentees in development programmes) by turning what they say and capture into cited evidence and a brief they control. It is intended as one domain-free platform extended by versioned domain packs.

**Problem Statement**: What matters happens between infrequent conversations, and it is lost by the time people meet their clinician or mentor. Existing approaches (memory, paper diaries, generic apps) do not give participants control, do not produce trustworthy, cited summaries, and do not respect limited energy.

**Proposed Solution**: Build the Cairn core and prove it with two materially different packs [CSD-C1]. Start with a Parkinson's pilot at one health service, then add mentorship on the same core, with a second cloud released only when paying customers justify it. Deliver in phases with funding gates.

**Strategic Fit**: Cairn delivers the executive sponsor's platform thesis (SD-10): two domains on one core, with trust and evidence as the differentiators (stakeholder goals G-7 and G-11).

**Investment Required**: A$7.2M over 3 years for the recommended option (ROM, including 40% contingency; A$5.1M before contingency)

- Build: A$3.75M before contingency
- Run (3 years): A$1.37M before contingency
- **Decision requested now**: A$0.46M for Phase 0 (October to December 2026, including contingency)

**Expected Benefits**: qualitative at this stage, traced to all 11 stakeholder goals

- Better-prepared specialist visits (G-1): 70% of pilot visits preceded by an approved brief
- Platform thesis proven: mentorship pack live on the same core with no domain-specific core changes (G-7)
- First revenue: a paying health service by December 2027 and an employer tenant by June 2028 (G-11)

**Return on Investment**:

- NPV: not calculated at this stage (strategic estimates; revenue model undecided)
- Payback Period: not calculated. At steady state, running costs of about A$2.3M a year are covered by roughly 10 customers at A$250k a year (illustrative, section D4.2)
- ROI: not calculated; to be produced in the Outline Business Case

**Recommended Option**: Option 2: Phased platform with two reference packs

**Key Risks**:

1. Role concentration undermines independent assurance (R-001)
2. No confirmed funding runway (R-016)
3. The Parkinson's pack is classified as a medical device (R-002)

**Go/No-Go Recommendation**: **PROCEED**, with Phase 0 funding only; later phases released at gates

**Rationale**: Option 2 meets 10 of 11 stakeholder goals in full and the 11th in part, at about 58% of the cost of the comprehensive option. Its phase gates release money only as evidence arrives: regulatory position, pilot results, paying customers. Doing nothing forgoes the opportunity entirely. A single-domain build is cheaper, but it cannot prove the platform thesis and would be rebuilt later.

**Next Steps if Approved**:

1. Release Phase 0 funding (A$0.46M): by 2026-10-15
2. Complete Phase 0 (regulatory determination, legal advice, memory evaluation, independent clinical safety adviser, business plan): by 2026-12-15
3. Develop the Outline Business Case with refined costs and a pricing model: by 2026-12-15
4. Gate 1 decision on Phase 1 funding: December 2026

---

# PART A: STRATEGIC CASE

## A1. Strategic Context

### A1.1 Problem Statement

**For participants**: People living with Parkinson's see specialists for a few minutes every few months. Symptoms fluctuate, fatigue and soft speech make recall harder, and the details that matter most to daily life often go unsaid (stakeholder driver SD-1). Mentees in employer-sponsored programmes forget examples between sessions and fear that honest reflections could reach their employer (SD-4).

**For reviewers**: Clinicians need one trustworthy page in two minutes, not months of diary they then feel responsible for (SD-6). Mentors lose continuity between sessions (SD-7).

**For the business**: The executive sponsor needs to show investors that one platform serves very different domains, and to reach paying customers before funding runs out (SD-10). The buyer and operating model is still an open question [CSD-C2].

**Consequence of not acting**: The opportunity, and the design investment already made (principles, requirements, stakeholder analysis, data model, risk register, privacy impact assessment), are not converted into evidence or revenue.

### A1.2 Strategic Drivers

| Driver | Stakeholder | Category | Intensity | Link to Investment |
|--------|-------------|----------|-----------|--------------------|
| SD-1 Being heard in short visits | Participants (Parkinson's) | CUSTOMER | CRITICAL | Core value of the pilot |
| SD-2 Control over sensitive information | Participants | RISK | CRITICAL | Trust is the differentiator |
| SD-4 Psychological safety in employer programmes | Mentees | RISK | CRITICAL | Shapes the mentorship offer and contracts |
| SD-6 Trustworthy one-page information | Clinicians | OPERATIONAL | HIGH | Adoption gatekeepers |
| SD-8 Value with governance intact | Health services | STRATEGIC | HIGH | First buyers |
| SD-9 Evidence the programme works | Employers | FINANCIAL | HIGH | Second buyer segment |
| SD-10 Prove the platform thesis and reach revenue | Executive sponsor | STRATEGIC | CRITICAL | Investment rationale |
| SD-12 A principled, portable, explainable platform | Architecture owner | STRATEGIC | HIGH | Avoids rebuild and lock-in |
| SD-13 Safety and no regulatory drift | Clinical safety lead | COMPLIANCE | CRITICAL | Gates the pilot |
| SD-14 Lawful handling, no breach | Privacy officer | COMPLIANCE | CRITICAL | Gates the pilot |

### A1.3 Stakeholder Goals

| Goal | Statement (ARC-001-STKE-v1.2) | Owner |
|------|-------------------------------|-------|
| G-1 | 70% of pilot specialist visits preceded by a participant-approved brief by December 2027 | Haim Ozchakir |
| G-2 | 80% of participants rate effort acceptable; 10% or fewer withdraw because of burden | Product owner |
| G-3 | Zero disclosures without participant approval | Privacy officer |
| G-4 | Regulatory position settled before enrolment; no drift | Clinical safety lead |
| G-5 | Zero critical safety floor misses | Clinical safety lead |
| G-6 | 80% of reviewers open briefs; usefulness 4 out of 5 or more | Pack authors |
| G-7 | Mentorship pack on the same core by June 2028 | Architecture owner |
| G-8 | Zero residency violations; second cloud certified by December 2028 | Architecture owner |
| G-9 | Employer programmes without individual exposure | Product owner |
| G-10 | Pack changes without core engineering by end of Phase 2 | Pack authors |
| G-11 | A paying health service by December 2027 and an employer tenant by June 2028 | Commercial lead |

### A1.4 Scope

**In scope (recommended option)**:

- The Cairn core: journeys, evidence and provenance, consent, deterministic rules and planner, safety floor, briefs and sharing, model gateway, pack registry
- Parkinson's symptom capture pack and a pilot with one health service (up to 200 participants)
- Mentorship pack and a pilot with one employer
- One cloud (AWS, the design's reference profile) in Australian regions [CSD-C4]
- Participant mobile and web apps; clinician and mentor access through secure links
- Assurance: regulatory determination, clinical safety, privacy impact assessment conditions, security testing

**Out of scope (for this business case)**:

- A second cloud until a gate decision in 2028
- Clinical system integration beyond secure links, unless the pilot health service requires it
- Long-term memory in the Parkinson's pilot (null provider, risk R-011)
- Third domains, pack authoring tooling and a marketplace (Phase 4)
- Participants under 18

### A1.5 Why Now?

- **The groundwork is done**: principles, requirements, stakeholder analysis, data model, risk register and privacy impact assessment exist. Their value decays if the team does not move to evidence.
- **Long lead times**: regulatory advice, legal advice on disclosure and retention, and clinical governance approval take months, and they gate the pilot. Starting Phase 0 now keeps a mid-2027 pilot possible.
- **Funding runway**: the investor case needs pilot evidence and a first paying customer within the runway (SD-10, risk R-016).
- **Technology timing**: the model and memory choices can be evaluated now behind replaceable interfaces, so moving early does not lock Cairn in (FR-040, FR-046).
- **Regulatory change**: Privacy Act automated-decision transparency obligations begin in December 2026. Building transparency in from the start is cheaper than retrofitting it.

---

# PART B: ECONOMIC CASE

## B1. Critical Success Factors

1. **Participant trust**: participants keep recording because sharing is under their control and effort is low
   - **Measure**: withdrawals for privacy or burden; unapproved disclosures
   - **Threshold**: 10% or fewer withdrawals; zero unapproved disclosures (G-2, G-3)

2. **Reviewer adoption**: clinicians and mentors use the briefs
   - **Measure**: briefs opened before sessions; usefulness rating
   - **Threshold**: 80% opened; 4 out of 5 or more (G-6)

3. **Settled regulatory and safety position**: the Parkinson's pack's status is determined before enrolment and does not drift
   - **Measure**: documented determination; critical safety misses
   - **Threshold**: determination signed off; zero critical misses (G-4, G-5)

4. **Platform thesis**: a second, very different domain runs on the same core
   - **Measure**: domain-specific core changes for mentorship
   - **Threshold**: zero (G-7)

5. **Commercial traction on principle-compliant terms**: buyers accept participant-first data terms
   - **Measure**: paying customers; contract clauses needing principle exceptions
   - **Threshold**: two paying customers by mid-2028; zero exceptions (G-11)

6. **Affordability**: delivery stays within the funding released at each gate
   - **Measure**: spend against gate budget
   - **Threshold**: within contingency

## B2. Options Analysis

**Cost assumptions (all options, ROM)**:

- Blended team cost A$200k per full-time equivalent (FTE) per year, mixing salaried and contract staff in Australia
- Assurance covers legal and regulatory advice, an independent clinical safety adviser, external privacy review, penetration testing, and accessibility and device testing
- Infrastructure covers one Australian data plane per customer, non-production environments, model inference and tooling
- A 40% contingency is applied, reflecting early-stage estimating uncertainty (the template's guidance for IT projects at this stage)
- Year 1 runs October 2026 to September 2027; figures exclude GST

### Option 0: Do Nothing (Baseline)

**Description**: Stop after the current design work. Keep the published artefacts; do not build.

**Costs** (3-year):

- Capital: A$0
- Operational: A$0
- Total: A$0 (design effort to date is sunk)

**Benefits**: None

**Pros**:

- ✅ No further investment
- ✅ No delivery, regulatory or privacy risk

**Cons**:

- ❌ Stakeholder goals not met (0 of 11)
- ❌ Platform thesis unproven; investor case lapses
- ❌ Design investment written off
- ❌ The open design may be reused by others without Cairn capturing the value

**Risks**:

- Opportunity lost to other products; runway spent without evidence

**Stakeholder Goals Met**: 0%

**Recommendation**: **Reject**. It forgoes the opportunity entirely.

---

### Option 1: Minimal Viable Solution

**Description**: Build a single-domain Parkinson's diary and brief application for the pilot, without the domain-free core or pack mechanism. One cloud, no memory, secure-link briefs only.

**Scope**:

- Parkinson's capture, safety floor, consent, approval and sharing
- No pack contract, pack registry or mentorship domain
- Maintenance team after the pilot

**Costs** (3-year) - ROM:

- Year 1: A$1.13M (4 FTE A$0.80M; assurance A$0.25M; infrastructure A$0.08M)
- Years 2 and 3: A$0.70M each (2.5 FTE A$0.50M; assurance A$0.10M; infrastructure A$0.10M)
- Total: A$2.53M before contingency; **A$3.54M with 40% contingency**

**Benefits**: pilot-level benefits (B-001 to B-005, section E6.1); none of the platform benefits

**Pros**:

- ✅ Lowest cost and fastest route to a pilot
- ✅ Tests the core value with clinicians and participants

**Cons**:

- ❌ Does not prove the platform thesis (G-7, G-10), which is the investment rationale
- ❌ Domain assumptions baked into code; mentorship needs a rebuild (risk R-012 realised by design)
- ❌ A regulated application with no domain separation makes later expansion harder (principle P9)

**Stakeholder Impact**:

- G-1 to G-6: ✅ Met (pilot goals)
- G-7, G-9, G-10: ❌ Not met
- G-8: ⚠️ Partly met (residency yes, portability no)
- G-11: ⚠️ Partly met (health service only)

**Stakeholder Goals Met**: 6 of 11 fully, 2 partly (about 64%)

**Risks**:

- Rebuild cost when a second domain is needed; investor case weakened

---

### Option 2: Balanced Approach (RECOMMENDED)

**Description**: A phased platform with two reference packs, as the design's roadmap proposes [CSD-C1]. Build the domain-free core as a modular monolith [CSD-C3] on one cloud. Run the Parkinson's pilot, then the mentorship pack on the same core. Release each phase at an evidence gate. A second cloud (Phase 3) is a separately gated add-on, triggered by a customer requirement.

**Scope**:

- **Phase 0** (October–December 2026): regulatory determination, legal advice, memory provider evaluation, independent clinical safety adviser, speech and model availability tests, business plan
- **Phase 1** (January–June 2027 build; July–December 2027 pilot): core platform, Parkinson's pack, safety floor, consent and sharing, AWS data plane in Australian regions
- **Phase 2** (January–June 2028): mentorship pack, employer pilot, aggregate reporting, memory provider for mentorship if the evaluation supports it
- **Phase 3 (gated add-on)**: second cloud certification, only if a paying customer requires it

**Costs** (3-year) - ROM (−30% to +50%):

- Build: A$3.75M before contingency
  - Development team (6–7 FTE in Years 1 and 2; half of Year 3's team): A$3.20M
  - Assurance set-up (Years 1 and 2): A$0.55M
- Run: A$1.37M before contingency over 3 years
  - Infrastructure and model inference: A$0.62M
  - Support and operations (half of Year 3's team): A$0.60M
  - Ongoing assurance (Year 3): A$0.15M
- Total 3-year TCO: A$5.12M before contingency; **A$7.17M with 40% contingency**
- Phase 3 add-on, if triggered: A$0.30M before contingency (A$0.42M with contingency)

**Benefits** (3-year, qualitative at SOBC stage):

| Benefit ID | Benefit Description | Stakeholder Goal | Type | Year 1 | Year 2 | Year 3 | 3-Year Total |
|------------|---------------------|------------------|------|--------|--------|--------|--------------|
| B-001 | Better-prepared specialist visits | G-1 (S-11) | OPERATIONAL | Pilot starts | 70% of visits | Sustained | Qualitative |
| B-002 | Participants heard with low effort | G-2 (S-18) | CUSTOMER | Pilot starts | 80% effort acceptable | Sustained | Qualitative |
| B-003 | Trust: no disclosure without approval | G-3 (S-8) | RISK | Designed | Zero incidents | Zero incidents | Qualitative |
| B-004 | Regulatory clarity and safety | G-4, G-5 (S-7) | COMPLIANCE | Determination | Zero critical misses | Sustained | Qualitative |
| B-005 | Clinician time saved | G-6 (S-6) | OPERATIONAL | Measured in pilot | 3+ minutes per consultation (proposed) | Sustained | To be monetised in OBC |
| B-006 | Platform thesis proven | G-7 (S-10) | STRATEGIC | Pack contract | Mentorship on same core | Sustained | Qualitative |
| B-007 | Market access through residency and portability | G-8 (S-10) | STRATEGIC | Residency by policy | Zero violations | Second cloud if gated | Qualitative |
| B-008 | Employer evidence without individual exposure | G-9 (S-18) | CUSTOMER | Not applicable | Employer pilot | Sustained | Qualitative |
| B-009 | Lower cost per new domain | G-10 (S-6) | FINANCIAL | Not applicable | Pack changes without engineers | Sustained | To be quantified in OBC |
| B-010 | Revenue from paying customers | G-11 (S-13) | FINANCIAL | None | First health service | Employer; renewals | Depends on pricing (D4.2) |
| **Total Benefits** | | | | | | | **Qualitative; quantified in OBC** |

**Net Present Value**: not calculated (strategic estimates). The Outline Business Case will add pricing, customer pipeline and a discounted cash flow.

**Return on Investment**:

- **ROI**: not calculated at this stage
- **Payback Period**: not calculated; see the breakeven illustration in D4.2

**Pros**:

- ✅ Proves the platform thesis with two very different domains
- ✅ Funding released only as evidence arrives (five gates)
- ✅ Follows the principles: domain-free core, regulated-pack isolation, residency
- ✅ About 58% of the cost of Option 3

**Cons**:

- ⚠️ Roughly twice the 3-year cost of Option 1
- ⚠️ Revenue unproven until the first paying customer
- ⚠️ Depends on a small team (risk R-019) and on one person holding four roles (R-001)

**Stakeholder Impact**:

- G-1 to G-7, G-9 to G-11: ✅ Met
- G-8: ⚠️ Partly met (residency yes; second cloud only if the Phase 3 gate is triggered)

**Stakeholder Goals Met**: 10 of 11 fully, 1 partly (about 95%)

**Risks**:

- Pilot adoption by clinicians (R-013). Mitigation: brief prototypes tested in Phase 0
- Regulatory classification (R-002). Mitigation: determination in Phase 0
- Funding runway (R-016). Mitigation: gate-by-gate funding and the Outline Business Case

---

### Option 3: Comprehensive Solution

**Description**: Commit now to the design's full roadmap (Phases 0–4) within 3 years: both packs, a second cloud, long-term memory for both packs, clinical system integration, organisation reporting, pack authoring tooling and a third domain.

**Costs** (3-year) - ROM:

- Year 1: A$2.38M (9 FTE A$1.80M; assurance A$0.40M; infrastructure A$0.18M)
- Year 2: A$3.10M (12 FTE A$2.40M; assurance A$0.30M; infrastructure A$0.40M)
- Year 3: A$3.30M (12 FTE A$2.40M; assurance A$0.30M; infrastructure A$0.60M)
- Total: A$8.78M before contingency; **A$12.29M with 40% contingency**

**Benefits**: all of B-001 to B-010, plus earlier multi-cloud and authoring benefits

**Pros**:

- ✅ Meets all 11 goals, including a second cloud by December 2028
- ✅ Fastest path to a broad platform

**Cons**:

- ❌ Commits A$12.3M before any pilot evidence
- ❌ Larger team raises delivery risk (R-019) and funding risk (R-016)
- ❌ Builds memory and integrations the pilot may show are unnecessary

**Stakeholder Goals Met**: 11 of 11 (100%), at the highest risk

---

## B3. Recommended Option

**Recommendation**: **Option 2: Phased platform with two reference packs**

**Rationale**:

1. **Best value**: meets 10 of 11 goals in full and one in part, for about 58% of Option 3's cost
2. **Stakeholder satisfaction**: covers participants, reviewers, buyers and the investor thesis; Option 1 fails the platform thesis
3. **Acceptable risk**: each phase is funded only after the previous gate's evidence
4. **Affordability**: the immediate commitment is A$0.46M (Phase 0), not the full A$7.2M
5. **Deliverability**: builds on the existing design with a small team; the modular monolith keeps complexity down

**Sensitivity Analysis** (qualitative at SOBC stage):

- **Costs 20% higher**: A$8.6M for 3 years. Still below Option 3, and gates allow scope to be cut
- **Pilot delayed 6 months**: Year 1 and 2 costs rise by about A$0.7M; the first paying customer moves to mid-2028; runway risk rises (R-016)
- **Pack classified as a medical device**: add a regulated lifecycle and quality system, estimated at A$0.3–0.6M, plus 6–12 months (R-002). To be refined in Phase 0
- **Clinicians do not use briefs**: the pilot fails its main success factor. Gate 3 would stop or reposition before Phase 2 funds are spent

**Optimism Bias Adjustment**: a 40% contingency is already included in all option totals. The Outline Business Case should replace it with a risk-based estimate once Phase 0 evidence is available.

---

# PART C: COMMERCIAL CASE

## C1. Procurement Strategy

### C1.1 Market Assessment

- **Market research not yet done.** No market sizing or competitor analysis exists in the project. Run `/arckit:research` in Phase 0 to assess digital health diary and patient-reported outcome products, mentoring platforms, and build-versus-buy options for commodity components.
- **Differentiation**: participant-controlled sharing, deterministic and explainable decisions, cited briefs, and one core across domains. These are hard for engagement-driven products to copy without redesign.
- **Supplier market for components**: mature and competitive for cloud hosting, managed PostgreSQL, identity and notifications. Emerging and fast-moving for agent memory (the technology notes' candidates) and speech recognition for atypical voices.

### C1.2 Sourcing Route

| Component | Route | Rationale |
|-----------|-------|-----------|
| Core platform, packs, apps | **Build** | The differentiator: deterministic rules, citations, consent and pack model |
| Cloud, managed database, key management, identity, notifications | **Buy** (pay-as-you-go through adapters) | Commodity; replaceable behind interfaces |
| Workflow engine, memory provider | **Adopt open source**, self-hosted | Replaceable; licence policy applies (TC-9) |
| Language models and speech engines | **Buy** through the model gateway, in-region | Replaceable per task binding |
| Clinical content and safety review | **Partner**: clinical advisory group, independent clinical safety adviser | Credibility and independence (R-001) |
| Pilot sites | **Partner**: one health service, then one employer | Evidence for customers and investors |
| Legal, regulatory and privacy advice | **Buy** specialist services | Phase 0 dependencies |

### C1.3 Contract Approach

- **Suppliers**: standard cloud and software-as-a-service terms, plus residency, no-training and no-content-logging terms for model providers
- **Pilot partners**: pilot agreements that settle the record holder, retention, escalation, clinician responsibilities and participant-first data terms (risks R-006, R-007, R-015)
- **Customers**: subscription contracts, priced per programme or per participant (to be decided in the Outline Business Case), with aggregate-only reporting for employers
- **Open development**: the proof of concept is built in the open (decided 2026-09-29). The code and content licence is not yet chosen; the choice affects commercial defensibility and should be decided in Phase 0

### C1.4 Social Value

Not a formal requirement for a private-sector investment, but relevant to buyers and investors:

- Better-prepared care for people living with Parkinson's, a growing population
- Accessibility built in (WCAG 2.2 AA; voice-first; tremor-tolerant interaction)
- Participant ownership of personal information, and no engagement mechanics
- Open publication of design and governance artefacts

---

# PART D: FINANCIAL CASE

## D1. Budget Requirement

**Total Investment Required**: A$7.17M over 3 years for Option 2 (ROM, including 40% contingency), plus A$0.42M if the Phase 3 second-cloud add-on is triggered. **Immediate request: A$0.46M for Phase 0.**

### D1.1 Capital Expenditure (CapEx)

Build effort is treated as capital for this case. Accounting treatment is to be confirmed.

| Item | Year 1 | Year 2 | Year 3 | Total |
|------|--------|--------|--------|-------|
| Development team (build) | A$1.20M | A$1.40M | A$0.60M | A$3.20M |
| Assurance set-up (legal, regulatory, clinical safety adviser, privacy review, penetration and accessibility testing) | A$0.35M | A$0.20M | A$0 | A$0.55M |
| Contingency (40%) | A$0.62M | A$0.64M | A$0.24M | A$1.50M |
| **Total CapEx** | **A$2.17M** | **A$2.24M** | **A$0.84M** | **A$5.25M** |

### D1.2 Operational Expenditure (OpEx)

| Item | Year 1 | Year 2 | Year 3 | 3-Year Total |
|------|--------|--------|--------|--------------|
| Cloud infrastructure and model inference (Australian regions) | A$0.12M | A$0.20M | A$0.30M | A$0.62M |
| Support and operations team | A$0 | A$0 | A$0.60M | A$0.60M |
| Ongoing assurance (clinical safety, privacy, security testing) | A$0 | A$0 | A$0.15M | A$0.15M |
| Contingency (40%) | A$0.05M | A$0.08M | A$0.42M | A$0.55M |
| **Total OpEx** | **A$0.17M** | **A$0.28M** | **A$1.47M** | **A$1.92M** |

### D1.3 Total Cost of Ownership (TCO)

| | Year 1 | Year 2 | Year 3 | 3-Year Total |
|---|--------|--------|--------|--------------|
| CapEx | A$2.17M | A$2.24M | A$0.84M | A$5.25M |
| OpEx | A$0.17M | A$0.28M | A$1.47M | A$1.92M |
| **Total TCO** | **A$2.34M** | **A$2.52M** | **A$2.31M** | **A$7.17M** |

**Notes**:

- All costs in 2026 prices, excluding GST; Year 1 runs October 2026 to September 2027
- ROM accuracy −30% to +50%; contingency included
- Excludes a regulated medical device lifecycle, if the determination requires one (sensitivity, section B3)
- Excludes the Phase 3 second-cloud add-on (A$0.42M with contingency)

## D2. Funding Source

**Budget Allocation**:

- **Source**: not yet confirmed. Expected to be founder or investor funding, with pilot partners possibly co-funding. Confirming the funding source and runway is a Phase 0 action for Haim Ozchakir (risk R-016)
- **Amount Available**: not yet confirmed
- **Timing**: released by phase gate (section E1.2)

**Budget Approval Path**:

1. Executive sponsor (Haim Ozchakir): Phase 0 (A$0.46M)
2. Executive sponsor with the company's board or investors, as its governance requires: Phases 1 and 2
3. Executive sponsor, triggered by a paying customer's requirement: the Phase 3 add-on

**Cash flow by phase** (approximate, including contingency):

| Phase | Period | Amount |
|-------|--------|--------|
| Phase 0: discovery | October–December 2026 | A$0.46M |
| Phase 1: core and Parkinson's pilot | January–December 2027 | A$2.50M |
| Phase 2: mentorship pack | January–June 2028 | A$1.30M |
| Run and growth | July 2028–September 2029 | A$2.91M |
| **Total** | | **A$7.17M** |

## D3. Affordability

**Status**: TO BE CONFIRMED. Affordability depends on the funding runway, which is not documented.

- The gated structure limits commitment: stopping at Gate 1 (end of Phase 0) caps spend at A$0.46M; stopping at Gate 3 (pilot results) caps it at about A$3.0M
- The Outline Business Case must confirm available funding against the phase cash flow before Phase 1 is released

## D4. Financial Appraisal

### D4.1 Economic Appraisal (UK Government Green Book)

The Green Book's social discount rate and public-value appraisal do not apply to a private-sector venture. At this strategic-estimates stage no discounted cash flow is prepared, because revenue depends on pricing and a buyer model that are undecided [CSD-C2]. The Outline Business Case should model revenue scenarios at a commercial discount rate reflecting venture risk.

**Net Present Value Calculation**:

| Year | Costs | Benefits | Net Cashflow | Discount Factor | Present Value |
|------|-------|----------|--------------|-----------------|---------------|
| 1 | A$2.34M | Not quantified | Not calculated | Not applied | Not calculated |
| 2 | A$2.52M | Not quantified | Not calculated | Not applied | Not calculated |
| 3 | A$2.31M | Not quantified | Not calculated | Not applied | Not calculated |
| **Total** | **A$7.17M** | **Not quantified** | **Not calculated** | | **Not calculated** |

**NPV Result**: not calculated at SOBC stage (strategic estimates).

### D4.2 Return on Investment

**Breakeven illustration** (not a forecast):

```text
Steady-state running cost (Year 3, with contingency) ≈ A$2.3M per year
Customers needed to cover running costs = A$2.3M ÷ average annual contract value

  Average contract A$100k per year → about 23 customers
  Average contract A$250k per year → about 10 customers
  Average contract A$500k per year → about 5 customers

Recovering the Years 1–2 build investment (about A$4.9M) needs revenue beyond this.
```

**Payback Period**: not calculated; depends on pricing and customer growth, to be modelled in the Outline Business Case.

**Internal Rate of Return (IRR)**: not calculated.

### D4.3 Value for Money Assessment

**Qualitative Assessment**:

- **Economy**: commodity components are bought or adopted as open source; only the differentiator is built; spend is released by gate
- **Efficiency**: one core serves many domains, so each new domain costs a pack rather than a product
- **Effectiveness**: meets 10 of 11 stakeholder goals in full and one in part

**Overall VfM Rating**: **Medium**

**Justification**: Option 2 is the best value of the four options, but its absolute value is unproven until the pilot shows adoption and a customer pays. The rating should rise to High if Gate 3 evidence meets the success factors.

---

# PART E: MANAGEMENT CASE

## E1. Governance

### E1.1 Roles & Responsibilities (RACI)

From `ARC-001-STKE-v1.2`. Chris McKelt holds four roles (S-10, S-18, S-7, S-8). Until independent holders are appointed, safety, regulatory and privacy decisions are countersigned by Haim Ozchakir (risk R-001).

| Decision | Responsible | Accountable | Consulted | Informed |
|----------|-------------|-------------|-----------|----------|
| Budget and gate funding | Product owner (Chris McKelt) | Executive sponsor (Haim Ozchakir) | Architecture owner, commercial lead | All |
| Requirements prioritisation | Product owner | Executive sponsor | Architecture owner, clinical safety lead, privacy officer, participant representatives | Engineering, commercial |
| Architecture decisions and principle exceptions | Architecture owner (Chris McKelt) | Architecture Review Board | Clinical safety lead, privacy officer, engineering | Executive sponsor |
| Safety floor content | Clinical advisory group | Clinical safety lead (Chris McKelt), with independent adviser | Architecture owner | Executive sponsor, health service |
| Regulatory determination | Clinical safety lead | Executive sponsor | Regulatory adviser, pack authors | Health service, architecture owner |
| Consent model and privacy impact assessment | Privacy officer (Chris McKelt) | Executive sponsor | Architecture owner, legal counsel, advocacy groups | Tenants |
| Customer contract data terms | Commercial lead (not yet named) | Executive sponsor | Privacy officer, architecture owner | Tenants |
| Pilot go/no-go | Product owner | Executive sponsor (clinical safety lead and independent adviser hold a veto) | Clinical safety lead, privacy officer, health service | All |

### E1.2 Approval Gates

| Gate | Timing | Decision | Evidence Required |
|------|--------|----------|-------------------|
| Gate 0 | October 2026 | Approve SOBC; release Phase 0 (A$0.46M) | This business case |
| Gate 1 | December 2026 | Approve Outline Business Case; release Phase 1 | Regulatory determination; legal advice; independent clinical safety adviser engaged; memory, speech and model evaluations; brief prototypes tested with clinicians; confirmed funding; pricing model |
| Gate 2 | June 2027 | Pilot enrolment go/no-go | Privacy impact assessment conditions 1–8 met; safety floor approved; penetration test; health service agreement |
| Gate 3 | December 2027 | Release Phase 2 (mentorship) | Pilot results against success factors 1–3; first paying health service or a signed intent |
| Gate 4 | June 2028 | Phase 3 add-on and scale decisions | Mentorship on the same core; paying customers; customer requirement for a second cloud |

## E2. Delivery Approach

- **Phased and gated**: funding and scope released per gate
- **Agile within phases**: two-week sprints, with a prioritised backlog (`/arckit:backlog`)
- **Evaluation-gated releases**: every change passes automated tests, pack evaluation suites and the safety floor regression suite (FR-047)
- **Regulated lifecycle for the Parkinson's pack**: IEC 62304-aligned practices from the start (risk R-002)
- **Built in the open**: design and governance artefacts are published; participant data never enters the repository

## E3. Key Milestones

| Milestone | Target Date | Dependency |
|-----------|-------------|------------|
| SOBC approved (Gate 0) | 2026-10-15 | This document |
| Phase 0 complete; Outline Business Case (Gate 1) | 2026-12-15 | Phase 0 evidence |
| Core and Parkinson's pack build complete | 2027-06-30 | Gate 1 |
| Pilot enrolment go/no-go (Gate 2) | 2027-06-30 | Privacy impact assessment conditions |
| Pilot results; Phase 2 decision (Gate 3) | 2027-12-31 | 6 months of pilot |
| Mentorship pack live (G-7) | 2028-06-30 | Gate 3 |
| Phase 3 decision (Gate 4) | 2028-06-30 | Paying customers |

## E4. Resource Requirements

### E4.1 Team Structure

| Role | Year 1 FTE | Year 2 FTE | Year 3 FTE |
|------|-----------|-----------|-----------|
| Technical lead and architect (Chris McKelt) | 1.0 | 1.0 | 1.0 |
| Backend engineers (Python, rules, evidence, workflows) | 2.0 | 2.0 | 2.0 |
| Mobile engineer (React Native, on-device speech and features) | 1.0 | 1.0 | 1.0 |
| Web engineer (portals, briefs) | 0.5 | 1.0 | 0.5 |
| Designer and user researcher (accessibility, co-design) | 0.5 | 1.0 | 0.5 |
| Quality and test automation (evaluation suites) | 0.5 | 0.5 | 0.5 |
| Platform and SRE | 0.5 | 0.5 | 0.5 |
| **Total** | **6.0** | **7.0** | **6.0** |

**External support** (in the assurance budget): independent clinical safety adviser, regulatory adviser, legal counsel, external privacy reviewer, penetration testers, accessibility testers. A named commercial lead is also needed.

### E4.2 Skills Required

- Health software lifecycle and clinical safety (external adviser)
- Privacy engineering and Australian privacy law
- Language-model evaluation and prompt engineering behind a gateway
- On-device speech and signal processing on iOS and Android
- Accessible design for people with motor and speech impairments

## E5. Change Management

### E5.1 Stakeholder Engagement

Follows the engagement plan in `ARC-001-STKE-v1.2`: fortnightly steering with the executive sponsor, monthly Architecture Review Board, co-design with participants and an advocacy organisation, and clinician feedback sessions during the pilot.

### E5.2 Communications Plan

| Audience | Message | Channel | Frequency |
|----------|---------|---------|-----------|
| Executive sponsor and investors | Gate evidence against success factors | Steering meeting; gate papers | Fortnightly; per gate |
| Pilot health service | Protocol, safety and privacy position, results | Account meetings; pilot reports | Monthly |
| Participants | How Cairn works; control over sharing; changes made from feedback | In-app messages; workshops | Monthly during pilot |
| Clinicians | One cited page; no action-implying alerts | Short sessions; sample briefs | Monthly during pilot |
| Public | Open design and governance artefacts | GitHub Pages site | On each release |

### E5.3 Resistance Management

- **Employer sponsors (individual visibility)**: aggregates plus voluntary participant summaries, agreed in contracts (risk R-015)
- **Clinicians (time and medico-legal concern)**: one-page briefs, secure links, responsibilities agreed with the health service (R-013)
- **Commercial pressure on principles**: a clear list of what customers can configure and what is fixed

### E5.4 Training Plan

- Participants: guided onboarding of 10 minutes or less; plain-language consent and AI explanation
- Carers: in-app guidance on scope and on mentioning others
- Clinicians: a 15-minute brief orientation
- Pack authors: pack contract and evaluation workflow
- Operators: runbooks, including break-glass and deletion verification

## E6. Benefits Realization

### E6.1 Benefits Profiles

| Benefit | Owner | Measure | Baseline | Target | When |
|---------|-------|---------|----------|--------|------|
| B-001 Better-prepared visits | Haim Ozchakir | Visits with an approved brief | 0% | 70% | December 2027 |
| B-002 Low effort | Chris McKelt (Product Owner) | Participants rating effort acceptable | Not measured | 80% | Quarterly from pilot start |
| B-003 Trust | Chris McKelt (Privacy Officer) | Unapproved disclosures | Not applicable | Zero | Continuous |
| B-004 Regulatory clarity and safety | Chris McKelt (Clinical Safety Lead) | Determination; critical safety misses | None | Signed; zero | December 2026; each release |
| B-005 Clinician time saved | Pack authors | Minutes saved per consultation | Not measured | 3 or more (proposed) | December 2027 |
| B-006 Platform thesis | Chris McKelt (Architecture Owner) | Domain-specific core changes for mentorship | Not applicable | Zero | June 2028 |
| B-007 Residency and portability | Chris McKelt (Architecture Owner) | Residency violations; certified clouds | Not applicable | Zero; second cloud if gated | Monthly; Gate 4 |
| B-008 Employer evidence | Chris McKelt (Product Owner) | Sponsor rating of programme evidence | Not applicable | 4 out of 5 | End of first cohort |
| B-009 Lower cost per domain | Pack authors | Pack changes needing core code | Not applicable | Zero | End of Phase 2 |
| B-010 Revenue | Commercial lead (not yet named) | Paying customers | 0 | 2 by June 2028 | Quarterly |

### E6.2 Benefits Measurement

- Pilot metrics (B-001, B-002, B-005) come from workflow and approval records, surveys and reviewer feedback
- Governance metrics (B-003, B-004, B-007) come from audit, evaluation and cloud policy reports
- Benefits are reviewed at each gate. The Outline Business Case converts B-005, B-009 and B-010 into financial values

## E7. Risk Management

### E7.1 Top 10 Strategic Risks

From `ARC-001-RISK-v1.1` (ranked by residual score):

| Rank | Risk | Residual | Owner | Response |
|------|------|----------|-------|----------|
| 1 | R-001 Role concentration undermines independent assurance | 16 (High) | Haim Ozchakir | Treat |
| 2 | R-016 No business case or confirmed funding runway | 15 (High) | Haim Ozchakir | Treat |
| 3 | R-005 Privacy impact assessment not completed before pilot | 12 | Chris McKelt | Treat |
| 4 | R-006 Safety disclosure obligations conflict with participant control | 12 | Haim Ozchakir | Treat |
| 5 | R-008 On-device transcription fails for Parkinsonian speech | 12 | Chris McKelt | Treat |
| 6 | R-019 Team capacity is insufficient for Phase 1 scope | 12 | Chris McKelt | Treat |
| 7 | R-002 Parkinson's pack is classified as a medical device | 12 | Haim Ozchakir | Treat |
| 8 | R-013 Clinicians do not use the briefs | 12 | Chris McKelt | Treat |
| 9 | R-018 Pace pressure overrides safety and regulatory gates | 12 | Haim Ozchakir | Treat |
| 10 | R-024 Participant consent invalidated by changing capacity | 12 | Chris McKelt | Treat |

### E7.2 Risk Mitigation Summary

- **Governance risks (R-001, R-018)**: independent clinical safety adviser and privacy review, funded in the assurance budget; written go/no-go criteria
- **Funding risk (R-016)**: this business case, gated release and the Outline Business Case
- **Compliance risks (R-002, R-005, R-006, R-024)**: Phase 0 legal and regulatory advice; privacy impact assessment conditions before enrolment
- **Adoption risks (R-013, R-008)**: brief prototypes with clinicians and speech evaluation in Phase 0
- **Delivery risk (R-019)**: modular monolith, one cloud, prioritised backlog

---

# PART F: RECOMMENDATION & NEXT STEPS

## F1. Summary of Recommendation

**Recommendation**: PROCEED with Option 2, a phased platform with two reference packs, and release **Phase 0 funding of A$0.46M now**. Later phases are funded at gates.

Option 2 is the only option that proves the platform thesis while limiting commitment to what the evidence supports. The main uncertainties (regulatory classification, clinician adoption, funding runway and pricing) are all resolved or reduced in Phase 0 and the pilot, before most of the money is spent.

## F2. Conditions for Approval

1. Phase 0 funding only; Phase 1 needs an approved Outline Business Case at Gate 1
2. Engage an independent clinical safety adviser in Phase 0 (risk R-001)
3. Confirm the funding source and runway before Gate 1 (R-016)
4. Obtain regulatory and legal advice in Phase 0 (R-002, R-006, R-007)
5. Decide the code and content licence for the open repository in Phase 0

## F3. Next Steps if Approved

1. **By 2026-10-15**: release Phase 0 funding; approve the proposed risk appetite
2. **October–December 2026 (Phase 0)**:
   - Regulatory determination and legal advice
   - Engage an independent clinical safety adviser and name a commercial lead
   - Memory provider evaluation (FR-051), speech evaluation, model availability (`/arckit:aws-research`)
   - Brief prototypes tested with at least 5 clinicians
   - Market research and pricing (`/arckit:research`)
   - Record key decisions (`/arckit:adr`) and produce a project plan (`/arckit:plan`)
3. **By 2026-12-15**: Outline Business Case with refined costs, pricing and funding; Gate 1

## F4. Next Steps if Not Approved

- Keep the published design and governance artefacts as the record of the work
- Optionally fund only the no-build parts of Phase 0 (regulatory and legal advice, clinician interviews, market research) to reduce uncertainty for a later decision
- Revisit if funding or a pilot partner becomes available

---

# APPENDICES

## Appendix A: Stakeholder Analysis

`ARC-001-STKE-v1.2`: 18 stakeholders, 19 drivers, 11 goals, 6 outcomes, RACI and engagement plan.

## Appendix B: Architecture Principles

`ARC-000-PRIN-v1.0`: 23 principles, including a domain-free core (P1), deterministic decisions (P2), participant ownership (P4), regulated-pack isolation (P9) and residency by policy (P11). The options were assessed against them: Option 1 conflicts with P1 and P9.

## Appendix C: Options Analysis Details

Section B2 holds the full options analysis. Cost assumptions are listed at the start of B2.

## Appendix D: Benefits Calculation

Benefits are qualitative at SOBC stage (section B2 and E6.1). Quantification (clinician time saved, cost per domain, revenue) is deferred to the Outline Business Case.

## Appendix E: Risk Register

`ARC-001-RISK-v1.1`: 25 risks; the top 10 are in section E7.1.

## Appendix F: Market Research

None yet. Run `/arckit:research` in Phase 0.

## Appendix G: Governance Terms of Reference

- **Steering** (fortnightly): executive sponsor (chair), product owner, independent clinical safety adviser once engaged. It decides gate readiness, budget and risks above appetite
- **Architecture Review Board** (monthly): architecture owner (chair), engineering lead, clinical safety lead, privacy officer. It decides architecture, principle exceptions and requirement conflicts

## Appendix H: Glossary

| Term | Meaning |
|------|---------|
| FTE | Full-time equivalent |
| OBC | Outline Business Case, the next stage after this SOBC |
| Phase gate | A funding decision point based on defined evidence |
| ROM | Rough order of magnitude estimate |
| TCO | Total cost of ownership |

---

## Document Approval

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Executive Sponsor (business case owner and approver) | Haim Ozchakir | | |
| Product Owner and Architecture Owner (prepared by) | Chris McKelt | | |

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
| [CSD-C1] | CSD | §19 Delivery roadmap | Business Requirement | "The platform contract should be proven against two materially different Domain Packs—Parkinson’s symptom capture and mentorship—so generic boundaries are discovered through real requirements." |
| [CSD-C2] | CSD | §21.1 Open questions | Stakeholder Need | "Who is the platform buyer/operator: direct-to-consumer, service provider, enterprise, health service, or a mixture?" |
| [CSD-C3] | CSD | §3.1 Core platform services | Design Decision | "The MVP does not need twelve separately deployed microservices. These are logical boundaries." |
| [CSD-C4] | CSD | §16 AWS reference deployment profile | Design Decision | "AWS remains a practical reference profile for the initial client environment, but it is an adapter set rather than the product architecture." |

### Unreferenced Documents

| Filename | Source Location | Reason |
|----------|-----------------|--------|
| 002_technotes.md | `000-global/external/` | Memory choices are covered by the requirements and Phase 0 evaluation |
| .gitkeep | `000-global/policies/` | No budget, funding or financial documents provided |

---

**Generated by**: ArcKit `/arckit:sobc` command
**Generated on**: 2026-09-29
**ArcKit Version**: 6.16.4
**Project**: Cairn — Longitudinal Guidance and Evidence Platform (Project 001)
**Model**: Claude Opus 5.5 (claude-opus-5-5)
