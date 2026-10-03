# Technology and Service Research: Cairn — Longitudinal Guidance and Evidence Platform

> **Template Origin**: Official | **ArcKit Version**: 6.1.7 | **Command**: `/arckit:research`

## Document Control

| Field | Value |
|-------|-------|
| **Document ID** | ARC-001-RSCH-v1.0 |
| **Document Type** | Technology and Service Research |
| **Project** | Cairn — Longitudinal Guidance and Evidence Platform (Project 001) |
| **Classification** | OFFICIAL |
| **Status** | DRAFT |
| **Version** | 1.0 |
| **Created Date** | 2026-10-03 |
| **Last Modified** | 2026-10-03 |
| **Review Cycle** | Monthly |
| **Next Review Date** | 2026-11-03 |
| **Owner** | Chris McKelt (Architecture Owner, S-10) |
| **Reviewed By** | [PENDING] |
| **Approved By** | [PENDING] |
| **Distribution** | Executive Sponsor, Architecture Review Board, Engineering and delivery team, Privacy Officer, Clinical Safety and Regulatory Lead |

## Revision History

| Version | Date | Author | Changes | Approved By | Approval Date |
|---------|------|--------|---------|-------------|---------------|
| 1.0 | 2026-10-03 | ArcKit AI | Initial creation from `/arckit:research` agent. Commodity build-versus-buy, LLM inference residency, and the Graphiti graph database backend researched in depth; health diary/PRO and mentoring market scans only partly complete (see Gaps) | PENDING | PENDING |

> **Status note**: This is a DRAFT shortlist. It recommends; it does not decide. The executive sponsor (S-11), the Architecture Review Board and, for any contract, the commercial lead decide. Research stopped early because of the agent's turn budget, so several categories are marked **Further research** with explicit open questions.

---

## Executive Summary

### Research Scope

This document presents research on the technology, services and products that could meet the requirements in `ARC-001-REQ-v1.1`, within `ARC-000-PRIN-v1.0`. It answers the three questions the SOBC left open (C1.1): the digital health diary and patient-reported outcome (PRO) market, mentoring platforms, and build-versus-buy for commodity components. It also gathers evidence for the **follow-on ADR on the Graphiti graph database backend** (`ARC-001-ADR-001-v1.0`, section 12.2). It does not reopen ADR-001: Graphiti remains the selected memory provider behind the provider-neutral interface, and the Parkinson's pilot uses the null provider.

**Context that shapes every recommendation**: Cairn is a private-sector product deployed in Australia by default. UK Government platforms, the UK Digital Marketplace and UK code-reuse sources do not apply. Australian equivalents (in-region Australian services, the Privacy Act 1988 and APP 8, TGA software-as-a-medical-device rules) are used instead.

**Requirements Analyzed**: 52 functional, 41 non-functional, 12 integration and 15 data requirements, plus 13 business requirements and 10 technical constraints (133 requirements in total)

**Research Categories Identified**: 13 categories researched, and 9 more identified but not yet researched (listed after Category 13)

**Research Approach**: Vendor documentation and AWS Price List data for the Sydney region (fetched 2026-10-03), open-source repository review, and the existing ArcKit artefacts. The agent memory options are already assessed in `000-global/external/002_technotes.md` and are cited, not repeated.

### Key Findings

- **LLM inference: buy Amazon Bedrock through Australian geographic inference profiles.** The `au.` profiles route only between Sydney and Melbourne and "keep data within Australia regions" [WEB-8-C2]. Bedrock does not store prompts or outputs by default [WEB-11-C1]. Not every model qualifies: Claude Sonnet 5.5, Fable 5.1 and Mythos 5.1 are global-only from Australia [WEB-4-C1], and Fable traffic is retained for up to 30 days [WEB-11-C2]. Those models must never be bound to a Cairn task. Regional endpoints carry a 10% premium [WEB-9-C2].
- **Model churn will hit the pilot.** Only Claude Haiku 4.5 and Sonnet 4.6 list Bedrock "structured outputs" among the Australian-resident models [WEB-7-C3] [WEB-13-C1]. Graphiti needs structured output [WEB-1-C4]. Yet Haiku 4.5's end of life is "no sooner than" 2026-10-16 [WEB-7-C1], and Sonnet 4.6's is 2027-02-17 [WEB-13-C1], both before or during the Parkinson's pilot (July to December 2027). Newer Australian-resident models (Sonnet 5, Opus 5, Opus 5.5) do not list structured outputs on `bedrock-runtime` [WEB-12-C1] [WEB-14-C1] [WEB-8-C3]. Evaluation-gated model rebinding (FR-046, P21) is recurring work and must be budgeted.
- **Graph backend for Graphiti: there is no permissive, upstream-supported, self-hosted option.** Neo4j Community is GPL v3 [WEB-16-C1] and lacks RBAC, multiple databases and online backup [WEB-24-C1]. FalkorDB is SSPLv1 [WEB-18-C1]. Kuzu was archived on 2025-10-10 [WEB-23-C1]. Graphiti closed the PostgreSQL driver RFC as "not planned" [WEB-21-C1]. Amazon Neptune works but is AWS-only, and Graphiti then also needs Amazon OpenSearch Serverless [WEB-1-C2], billed at a minimum of 2 OCUs [WEB-26-C1] (about US$410 per month per data plane at Sydney prices [WEB-30-C1]). **Recommended shortlist for the follow-on ADR: Neo4j (Community, pending a GPL v3 legal opinion, with an Enterprise quote in parallel) as the portable default, and Neptune Serverless as the AWS-only fallback.**
- **Memory ingestion is likely to cost more than the conversation itself.** Estimated model spend is about US$23.76 per memory-enabled journey-year for Graphiti ingestion, against US$7.92 for extraction and phrasing (estimate; method in Category 3). The base case stays inside the SOBC's A$0.62M infrastructure and inference line. In the requirements' growth projection (50,000 journeys in Year 3), inference alone reaches about A$0.91M in Year 3. This reinforces R-017 and the NFR-P-006 cap.
- **Durable workflow: adopt self-hosted Temporal.** Temporal Cloud offers Sydney but not Melbourne [WEB-2-C2]. Its replication therefore cannot provide the second-Australian-region standby that NFR-A-002 asks of certified production. Temporal Cloud pricing was not obtained.
- **Market scans are incomplete.** One mentoring vendor (Mentorloop: hosted in Australia, the UK or the US, Pro "Starting from $299/mo" [WEB-15-C1] [WEB-15-C2]) was verified. The health diary and PRO landscape has search leads only. Both remain BUILD per the SOBC sourcing route, but the differentiation claim is unverified until v1.1.

### Build vs Buy Summary

All figures are 3-year totals (October 2026 to September 2029) in Australian dollars, excluding GST and contingency, for the base case. Assumptions are under TCO Assumptions.

| Approach | Categories | Total 3-Year TCO | Rationale |
|----------|-----------|------------------|-----------|
| **BUILD** (Custom Development) | 5: health diary/PRO pack, mentorship pack, model gateway, event outbox, policy engine | A$73.1k (gateway only; packs, outbox and policy engine sit in the SOBC core build of A$3.20M) | The differentiator (P1 to P7) and the governance choke points (FR-036, FR-046, FR-050) |
| **BUY** (Commercial / managed) | 5: LLM inference, cloud platform foundation, speech server path, email, observability | A$335.5k | Commodity, in-region, pay-as-you-go behind adapters (SOBC C1.2) |
| **ADOPT** (Open Source) | 2: durable workflow (Temporal), graph backend (Neo4j Community) | A$203.9k | Replaceable, self-hosted inside each data plane (TC-4, C-7) |
| **GOV.UK Platforms** | Not applicable | Not applicable | Australian private-sector product |
| **Further research** | 1: identity (Cognito indicative only) | A$0.0k at base volumes | Feature fit not yet verified |
| **TOTAL** | 13 categories | **A$612.5k** | Blended approach (commodity and platform layer only) |

### Top Recommended Vendors

**Shortlist for further evaluation**:

1. **Amazon Web Services (Amazon Bedrock, Australian geo profiles)** for LLM inference: Australian-resident Claude models, zero data retention by default [WEB-11-C1], and model providers have no access to prompts [WEB-10-C1]. The cloud platform foundation is on the same supplier.
2. **Neo4j** for the Graphiti graph backend: Graphiti's primary backend [WEB-1-C2], and portable across clouds. The Community licence (GPL v3) needs a legal opinion. The Enterprise edition is unpriced.
3. **Temporal** for durable workflow: self-hosted per data plane, with Temporal Cloud Sydney as a managed option for unregulated planes once priced.

### Requirements Coverage

- **82.7%** (110 of 133) of requirements have an identified solution path: 31 through researched external products or services, and 79 through custom development in the core by design
- **79** requirements need custom development, because they are Cairn's differentiator and no product is expected to meet them
- **23** requirements (17.3%) need further research before a solution can be named

---

## Research Categories

> **Note**: Research categories are dynamically identified from the requirements, not taken from a fixed list. Categories 1 and 2 are the SOBC's market questions. Categories 3 to 13 are the commodity build-versus-buy questions. Category 7 feeds the follow-on graph database ADR.

| # | Category | Key requirements | Depth | Recommendation |
|---|----------|------------------|-------|----------------|
| 1 | Patient-held symptom diaries and PRO platforms | FR-048, BR-002, BR-007 | Partial (search leads only) | BUILD (pack on core) |
| 2 | Mentoring platforms | FR-049, BR-009, INT-007 | Partial (1 vendor verified) | BUILD (pack on core) |
| 3 | LLM inference in Australian regions | INT-001, FR-046, NFR-C-004 | Full | BUY: Amazon Bedrock AU geo |
| 4 | Task-level model gateway | FR-046, INT-003 | Partial | BUILD (thin) |
| 5 | Speech-to-text | FR-011, INT-002, NFR-U-002 | Partial (server path only) | On-device TBD; BUY Transcribe for consented server path |
| 6 | Durable workflow engine | FR-024, INT-004 | Partial (pricing missing) | ADOPT: Temporal self-hosted |
| 7 | Graph database backend for Graphiti | INT-003, FR-041, TC-9 | Full | ADOPT: Neo4j (shortlist), Neptune fallback |
| 8 | Event streaming and transactional outbox | FR-050, INT-008 | Partial | BUILD on PostgreSQL |
| 9 | Identity and authentication | NFR-SEC-001, INT-005 | Pricing only | Further research |
| 10 | Policy and authorisation engine | FR-036, NFR-SEC-002 | Pricing only | BUILD in-process |
| 11 | Notifications (email, SMS, push) | INT-009, FR-033 | Email only | BUY: Amazon SES (email) |
| 12 | Observability | NFR-M-001, P17 | Pricing only | BUY: Amazon CloudWatch (pilot) |
| 13 | Cloud platform foundation | INT-010, TC-1, TC-6 | Full (pricing) | BUY: AWS managed services behind adapters |

---

## Category 1: Patient-Held Symptom Diaries and Patient-Reported Outcome Platforms

**Requirements Addressed**: BR-002, BR-007, FR-011, FR-013, FR-014, FR-030, FR-032, FR-033, FR-048, INT-006, INT-012

**Why This Category**: The SOBC (C1.1) records that no market research exists and asks whether products already serve people living with Parkinson's between specialist visits. The answer decides whether the Parkinson's pack should be built, bought or partnered, and how Cairn positions itself to health-service buyers (SD-8).

**Research status**: PARTIAL. A web search surfaced research tools and products, but none was fetched and verified in this version, so no pricing, compliance or capability claims are made here. The leads below are inputs for v1.1, not findings.

**Search leads to verify in v1.1** (unverified):

- PRO-PD (Patient-Reported Outcomes in Parkinson's Disease), described in search results as a free patient-centred symptom tracking app
- The Parkinson's Image Self (PIS) Report app and the "MyParkinson's" digital diary, both described in recent research publications
- Electronic motor-symptom diaries described in Movement Disorder Society abstracts
- Product segments still to profile: clinician-prescribed wearable monitoring, consumer symptom trackers, ePRO/PROM platforms sold to health services, and national record services as an integration channel

---

### Option 1A: Build Custom Solution (Parkinson's pack on the Cairn core)

**Description**: The Parkinson's symptom-capture pack (FR-048) on the domain-free core: voice and text diary, guided captures with on-device features, deterministic coverage and planning, and a one-page cited clinician brief that the participant approves item by item.

**Technology Stack**: As TC-4: React Native and TypeScript (mobile), Next.js (web), Python with FastAPI (services), PostgreSQL, Temporal, model gateway to Amazon Bedrock (Category 3)

**Effort Estimate**: Not re-estimated here. The SOBC's development team line (A$3.20M over 3 years, 6 to 7 FTE) covers the core and both packs.

**Pros**:

- Pro: The only option that enforces P2 (rules decide), P3 (every claim cited), P4 (participant approval) and P8 (on-device first) by construction
- Pro: Proves the platform thesis (SD-10, G-7), which is the investment rationale
- Pro: Keeps the regulatory position deliberate (BR-007, R-002)

**Cons**:

- Con: Highest effort and longest time to pilot
- Con: Differentiation against existing apps is unverified until the v1.1 market scan
- Con: Clinician adoption risk (R-013) is not reduced by building

**Risks**:

- An existing product may already offer cited, participant-approved briefs. Mitigation: complete the v1.1 scan before Gate 1 (December 2026).

---

### Option 1B: Buy or Licence a PRO Platform

**Description**: Licence an ePRO or symptom-diary product for the pilot instead of building the pack.

**Status**: Not evaluated (no verified vendor data). **Screening criteria for v1.1**, drawn from the principles:

| Criterion | Source | Why it screens out most engagement-driven products |
|-----------|--------|------------------------------------------------------|
| Per-item, per-recipient participant approval before any sharing | P4, FR-032 | Many products share by default with the prescribing clinic |
| Every statement in a summary cited to source evidence | P3, FR-030 | Free-text or model-written summaries fail |
| Deterministic, replayable logic for prompts and detection | P2, FR-020, FR-022 | Model-driven nudging fails |
| Raw media stays on device by default | P8, FR-014 | Server-side video or audio analysis fails |
| Data and inference in Australian regions | P11, NFR-C-004 | Offshore hosting fails |
| Clear TGA status for any device-like feature | BR-007, NFR-C-005 | Unclear status transfers regulatory risk |

---

### Build vs Buy Recommendation for Patient-Held Symptom Diaries

**Recommended Approach**: BUILD (unchanged from SOBC C1.2)

**Rationale**: The product's value lies in properties that the principles make non-negotiable, and an engagement-driven diary would have to be redesigned to meet them. That conclusion rests on principle analysis, not on verified competitor evidence. The v1.1 scan should test it, and should also record competitors' TGA status as a benchmark for the regulatory determination (R-002).

**Next Steps**:

- [ ] Fetch and profile 6 to 8 products across the four segments above, including TGA status, hosting location and sharing model
- [ ] Record whether any competitor separates "not reported" from "not asked" (CSD-C18), which is a likely differentiator for clinicians (SD-6)

---

## Category 2: Mentoring Platforms

**Requirements Addressed**: BR-009, BR-011, BR-013, FR-037, FR-049, INT-007

**Why This Category**: The SOBC asks for a mentoring-platform scan. Employer buyers will compare Cairn's mentorship pack with established mentoring software, and their expectations (single sign-on, HR system connectors, reporting) shape INT-007 and the contract terms in BR-013.

**Research status**: PARTIAL. One vendor was verified by fetch. Others are listed for v1.1.

---

### Option 2A: Build Custom Solution (Mentorship pack on the Cairn core)

**Description**: The mentorship pack (FR-049) on the same core as the Parkinson's pack, with no domain-specific core changes (BR-001).

**Effort Estimate**: Within the SOBC development team line (Phase 2, January to June 2028).

**Pros**:

- Pro: It is the platform-thesis proof (G-7, B-006)
- Pro: Participant-controlled sharing and aggregate-only employer reporting (BR-009, BR-011, Conflict C-8) are built in
- Pro: No hidden scoring or engagement mechanics (P5, P6)

**Cons**:

- Con: The market has incumbents with mature matching, administration and integrations
- Con: Phase 2 timing (June 2028) is late relative to incumbents

---

### Option 2B: Buy — Mentorloop

**Description**: Cloud mentoring software for running mentoring programmes at scale.

**Pricing Model**: Subscription. **Mentorloop Pro** is "Starting from $299/mo" for simpler programmes; **Mentorloop Enterprise** is "Contact for pricing" [WEB-15-C1]. The page does not state the currency.

**Cost Breakdown** (illustrative benchmark only: Pro list price, 10% annual increase, currency as listed):

| Cost Item | Year 1 | Year 2 | Year 3 | Notes |
|-----------|--------|--------|--------|-------|
| Subscription (Pro) | 3,588 | 3,947 | 4,341 | 12 × $299, then +10% a year |
| Integration (SSO, HRIS) | Not estimated | 0 | 0 | Enterprise features [WEB-15-C3] |
| **3-Year TCO** | | | **11,876** | Excludes Enterprise tier and integration |

**Key Features** (from the vendor's pricing page): unlimited matches, goal setting, video and chat, sentiment tracking, activity monitoring, live dashboards and milestones. Enterprise adds expert support, SSO, integrations and bespoke matching [WEB-15-C1].

**Integration**: SSO with Microsoft Azure Active Directory and Okta. HRIS and CRM connectors for Salesforce, SAP SuccessFactors, BambooHR and Oracle. Calendar, Slack, Zoom and Teams integrations [WEB-15-C3].

**Compliance & Security**: Hosting locations "Australia," "United Kingdom," "United States" [WEB-15-C2]. The pricing page lists Cyber Essentials certification, GDPR compliance and ICO registration [WEB-15-C3]. It does not mention ISO 27001 or SOC 2; this is unconfirmed rather than absent.

**Pros**:

- Pro: Australian hosting is available, which aligns with P11
- Pro: Mature employer integrations (SSO, HRIS)

**Cons**:

- Con: It does not deliver the domain-free core or the platform thesis
- Con: Activity monitoring and sentiment tracking for programme owners pull in a different direction from Cairn's aggregate-only, describe-never-evaluate position (P4, P5, BR-009)

**Exit Strategy**: Not assessed.

**What this tells Cairn**:

- **Requirement signal for INT-007**: Employer buyers will expect Azure AD and Okta SSO and HRIS connectors as table stakes.
- **Pricing signal for the Outline Business Case**: An entry price of about $3,600 a year for a small programme sits far below the SOBC breakeven illustration (A$100k to A$500k annual contract values, D4.2). Mentorship pricing needs evidence before the OBC.

---

### Build vs Buy Recommendation for Mentoring Platforms

**Recommended Approach**: BUILD the mentorship pack on the core

**Rationale**: Buying a mentoring platform would abandon the platform thesis, which is the reason for the investment (SD-10). The incumbents' features are best used as a buyer-expectation checklist (SSO, HRIS connectors, programme dashboards that stay aggregate-only) and as pricing evidence.

**Shortlist for further evaluation (v1.1)**: Mentorloop (verified here), plus other established mentoring platforms used by Australian employers, with pricing, hosting and certification verified by fetch.

---

## Category 3: LLM Inference in Australian Regions

**Requirements Addressed**: INT-001, FR-016, FR-025, FR-031, FR-046, NFR-C-004, NFR-P-001, NFR-SEC-006, DR-012; risks R-009, R-017; DPIA condition 5

**Why This Category**: Every extraction, phrasing, quote-shortening, embedding and Graphiti ingestion call needs a residency-compliant model (P11). R-009 asks whether capable models exist in Australia without cross-region routing. This category answers that question for the first cloud. It does not replace `/arckit:aws-research`.

### Australian availability of candidate models (Amazon Bedrock, `bedrock-runtime`, as fetched 2026-10-03)

| Model | Availability from Sydney / Melbourne | Bedrock structured outputs | List price, US$ per M tokens (in / out) | AU geo price (+10%) | End of life no sooner than |
|-------|--------------------------------------|----------------------------|------------------------------------------|---------------------|-----------------------------|
| Claude Haiku 4.5 | AU geo (Sydney and Melbourne); in-region Melbourne on `bedrock-mantle` [WEB-7-C2] | Supported [WEB-7-C3] | 1 / 5 [WEB-9-C1] | 1.10 / 5.50 | 2026-10-16 [WEB-7-C1] |
| Claude Sonnet 4.6 | AU geo [WEB-13-C1] | Supported [WEB-13-C1] | 3 / 15 [WEB-9-C1] | 3.30 / 16.50 | 2027-02-17 [WEB-13-C1] |
| Claude Sonnet 5 | AU geo; in-region Melbourne on `bedrock-mantle` [WEB-12-C2] | Not supported [WEB-12-C1] | 2 / 10 [WEB-9-C1] | 2.20 / 11.00 | 2027-06-30 [WEB-12-C1] |
| Claude Opus 5 | AU geo [WEB-14-C1] | Not supported [WEB-14-C1] | 5 / 25 [WEB-9-C1] | 5.50 / 27.50 | 2027-07-24 [WEB-14-C1] |
| Claude Opus 5.5 | AU geo (Sydney); in-region Melbourne [WEB-4-C1] | Not supported [WEB-8-C3] | 4 / 20 [WEB-9-C1] | 4.40 / 22.00 | 2027-09-22 [WEB-8-C1] |
| Claude Sonnet 5.5 | Global only [WEB-4-C1] | Not applicable | 2 / 10 [WEB-9-C1] | Not compliant (P11) | Not applicable |
| Claude Fable 5.1, Mythos 5.1 | Global only [WEB-4-C1]; Fable traffic retained up to 30 days [WEB-11-C2] | Not applicable | 10 / 50 [WEB-9-C1] | Not compliant (P11, DPIA condition 5) | Not applicable |
| Amazon Titan Text Embeddings V2 | In-region Sydney [WEB-4-C2] | Not applicable | [UNSOURCED] | [UNSOURCED] | Not checked |
| Amazon Nova Pro, Lite, Micro | In-region and AU geo, Sydney [WEB-4-C2] | Not checked | [UNSOURCED] | [UNSOURCED] | Not checked |

Notes on the table:

- The AU geo price applies Anthropic's statement that "Regional and multi-region endpoints include a 10% premium over global endpoints" for Claude 4.5 and later models [WEB-9-C2]. The Bedrock pricing page itself was only partly retrieved, so these prices must be confirmed (open question OQ-3).
- Claude 4.7 and later models use a tokenizer that "produces approximately 30% more tokens for the same text" [WEB-9-C3]. Per-token prices for Sonnet 5 and the Opus 5 family therefore understate their cost relative to Sonnet 4.6 and Haiku 4.5 by about that margin.
- "Structured outputs" is the Bedrock feature list on each model card. Models without it can still return JSON through prompting or tool use, and Cairn validates every proposal deterministically anyway (FR-016). Graphiti, however, "works best with LLM services that support Structured Output" and warns of "ingestion failures" otherwise [WEB-1-C4].

### Residency controls this evidence implies

- Bind tasks only to `au.` geo profiles or in-region endpoints. A geography-tied profile's "destination Region list will never change" [WEB-5-C1], and the AU profile routes only between Sydney and Melbourne [WEB-3-C1].
- The approved region set must include both ap-southeast-2 and ap-southeast-4. "If any destination Region in a cross-Region inference profile is blocked in your SCPs, the request will fail" [WEB-5-C3]. This matches assumption A-5 (two Australian regions).
- Melbourne is an opt-in region. Requests can route there even without opt-in, and "input prompts and output results may be stored in the opt-in Regions for abuse detection purposes" [WEB-5-C2]. Both regions are Australian, so residency holds, but the privacy notice and DPIA data inventory should say so.
- The gateway must reject `global.` profile identifiers outright (FR-046).
- Exclude the Claude Fable models from every Cairn task, because their traffic is retained for 30 days with possible human review [WEB-11-C2]. That conflicts with "no content logging" in DPIA condition 5.
- Bedrock's default is zero data retention [WEB-11-C1], and model providers "don't have access to Amazon Bedrock logs or to customer prompts and completions" [WEB-10-C1]. This supports DPIA condition 5 for the models that remain eligible.

---

### Option 3A: Build Custom Solution

Not viable. Training or fine-tuning a foundation model is outside Cairn's scope and would need a separate consent purpose for participant data (DR-012).

---

### Option 3B: Buy — Amazon Bedrock (Australian geo profiles)

**Description**: Pay-per-token inference on Claude models through `au.` profiles, plus Titan embeddings in Sydney, all through the Cairn model gateway.

**Vendor**: Amazon Web Services, with Anthropic as model provider.

**Pricing Model**: Per input and output token. List prices are in the table above, and AU geo endpoints add 10%.

**Proposed initial bindings** (to be confirmed by the pack evaluation suites):

| Task | Model | Reason |
|------|-------|--------|
| Extraction (FR-016) and Graphiti ingestion (INT-003) | Claude Sonnet 4.6, AU geo | Structured outputs supported; end of life no sooner than February 2027 |
| Companion phrasing (FR-025), quote shortening (FR-031) | Claude Haiku 4.5, AU geo | Lowest cost; no structured output needed. Pre-certify Sonnet 5 as the fallback binding because of Haiku's end-of-life date |
| Embeddings (Graphiti, any search projection) | Titan Text Embeddings V2, in-region Sydney | In-region; price to be confirmed |

**Cost model** (estimate; every input below is an assumption to be replaced by gateway measurements under NFR-P-006):

- 30 confirmed turns per journey per month
- Extraction: 3,000 input and 500 output tokens per turn; phrasing: 2,500 input and 200 output tokens per turn
- Result: US$0.0220 per turn, which is **US$7.92 per journey-year**
- Graphiti ingestion: 10,000 input and 2,000 output tokens per episode, one episode per confirmed turn, on Sonnet 4.6. Result: US$0.066 per episode, which is **US$23.76 per memory-enabled journey-year** (US$7.92 if Haiku-class models suffice)
- A$10k a year for evaluation-suite inference

**Cost Breakdown** (A$k; base case = SOBC-aligned volumes of 50, 1,000 and 3,000 journey-years, with 0, 225 and 1,500 memory-enabled mentorship journey-years):

| Cost Item | Year 1 | Year 2 | Year 3 | Notes |
|-----------|--------|--------|--------|-------|
| Conversation (extraction and phrasing) | 0.6 | 12.0 | 36.1 | US$7.92 per journey-year × 1.52 |
| Graphiti ingestion (mentorship only) | 0.0 | 8.1 | 54.2 | US$23.76 per memory journey-year × 1.52 |
| Evaluation inference | 10.0 | 10.0 | 10.0 | Assumption |
| **Total** | **10.6** | **30.2** | **100.3** | |
| **3-Year TCO** | | | **141.1** | Growth case (REQ NFR-S-001): 13.0, 124.4, 912.9 = **1,050.3** |

**Pros**:

- Pro: Capable Claude models with Australian-only routing, and documented residency per model [WEB-8-C2]
- Pro: Zero data retention by default; no provider access to prompts [WEB-11-C1] [WEB-10-C1]
- Pro: No GPU capacity to run; scales with use

**Cons**:

- Con: Only two Australian-resident models list structured outputs, and both reach end of life within about 16 months
- Con: Pricing carries a 10% regional premium and is in US dollars (exchange-rate exposure)
- Con: AWS-specific. The second cloud (Phase 3) needs its own certified bindings

**Compliance & Security**: Zero operator access and zero data retention by default [WEB-11-C1]. Retained abuse-detection data, where it applies, stays in the destination region [WEB-11-C3].

**Exit Strategy**: All calls go through the Cairn gateway (FR-046), so rebinding to another provider is an evaluated release, not a code change. Lock-in risk: LOW at the code level, MEDIUM operationally (certified configurations).

---

### Option 3C: Buy — Azure AI Foundry (Australia East) or Google Vertex AI (Sydney)

Not researched in v1.0. Relevant to the Phase 3 second cloud (BR-008). Open question OQ-12.

---

### Option 3D: Adopt — In-Cluster Open-Weight Models on GPU

**Description**: Serve open-weight models inside each production data plane (the R-009 fallback).

**Hosting evidence (Sydney, on-demand Linux)**: g6.xlarge (one NVIDIA L4 GPU) US$1.0464 per hour; g5.xlarge US$1.308 per hour. g6e.xlarge is not in the Sydney price feed [WEB-37-C1].

**Cost Breakdown** (A$k; two g6.xlarge per production plane for availability, 0.2 FTE operations, 6 person-weeks setup):

| Cost Item | Year 1 | Year 2 | Year 3 | Notes |
|-----------|--------|--------|--------|-------|
| GPU instances | 7.0 | 55.7 | 111.5 | A$27.9k per production plane-year; 0.25, 2 and 4 production plane-years |
| Setup | 23.1 | 0.0 | 0.0 | 6 person-weeks |
| Operations | 40.0 | 40.0 | 40.0 | 0.2 FTE |
| Evaluation inference | 10.0 | 10.0 | 10.0 | Assumption |
| **3-Year TCO** | **80.0** | **105.7** | **161.5** | **347.2** (growth case 1,245.9) |

**Cons**: Costs about 2.5 times Option 3B at base volumes. A 24 GB GPU limits model size, so extraction quality must be proven against the pack evaluation suites. It adds GPU operations to every data plane.

---

### Build vs Buy Recommendation for LLM Inference

**Recommended Approach**: BUY: Amazon Bedrock through `au.` geo profiles, with in-cluster open-weight models as a tested fallback

**Rationale**: Bedrock gives the capability the packs need with Australian-only routing and zero retention, at roughly 40% of the self-hosted cost in the base case. The main operational risk is model churn, not residency. The gateway's evaluation-gated rebinding (FR-046, P21) should be treated as a recurring activity, with two or three rebinding evaluations a year. The structured-output gap should be raised with the AWS account team.

**Key Decision Factors**:

- **Residency (P11)**: Enforced by binding only `au.` profiles and by SCPs over both Australian regions
- **No content logging (DPIA condition 5)**: Holds for every model except Fable, which is excluded
- **Cost (R-017)**: Memory ingestion is the largest variable; measure it in the ADR-001 acceptance gate

**Next Steps**:

- [ ] Confirm Bedrock AU geo prices and structured-output plans for Sonnet 5 and the Opus 5 family with the AWS account team
- [ ] Pre-certify fallback bindings (Sonnet 5 for phrasing) before Haiku 4.5 reaches end of life
- [ ] Add a gateway rule rejecting `global.` profile identifiers and the Fable models

---

## Category 4: Task-Level Model Gateway

**Requirements Addressed**: FR-046, INT-001, INT-003, NFR-M-001, NFR-SEC-006, NFR-C-004

**Why This Category**: The gateway is the single enforcement point for residency, versioning, evaluation gating and content-free telemetry, so it is a governance component rather than a commodity proxy.

**Key finding**: For Claude models, `bedrock-runtime` supports the Messages, Converse and Invoke APIs, but not Chat Completions or Responses [WEB-8-C4]. Graphiti's generic client expects "any OpenAI-compatible `/v1` endpoint" [WEB-1-C3]. The gateway must therefore expose an OpenAI-compatible façade for chat and embeddings and translate to Bedrock in-region. Graphiti's model calls then stay inside the gateway's binding, region and telemetry controls (INT-003, R-6). Pointing Graphiti's native Anthropic client straight at Bedrock would bypass the gateway and breach FR-046.

### Option 4A: Build — Thin Task-Level Gateway (recommended)

**Description**: A small service that maps tasks to bindings, checks region and purpose, exposes an OpenAI-compatible façade, records metadata only, and blocks unbound tasks.

**Cost Breakdown** (A$k):

| Cost Item | Year 1 | Year 2 | Year 3 | Notes |
|-----------|--------|--------|--------|-------|
| Development | 23.1 | 0.0 | 0.0 | 6 person-weeks (estimate) |
| Maintenance | 10.0 | 20.0 | 20.0 | 0.05 FTE, then 0.1 FTE (estimate) |
| Infrastructure | 0.0 | 0.0 | 0.0 | Runs on data plane nodes (Category 13) |
| **3-Year TCO** | **33.1** | **20.0** | **20.0** | **73.1** |

**Pros**: Exactly the controls FR-046 needs; no third-party component in the prompt path; content-free telemetry by design (P17).
**Cons**: Cairn owns the code and must track Bedrock API changes.

### Option 4B: Adopt — Open-Source LLM Proxy

Not researched in v1.0. Open-source proxies could supply the OpenAI-compatible translation layer. Each needs review of its licence, security record, and whether it can be configured never to log prompt or completion text (P17). Open question OQ-8.

### Build vs Buy Recommendation for the Model Gateway

**Recommended Approach**: BUILD a thin gateway, optionally embedding a reviewed open-source translation library. Do not route Graphiti or any other component directly to a provider.

---

## Category 5: Speech-to-Text

**Requirements Addressed**: FR-011, FR-012, INT-002, NFR-U-002, NFR-P-001, NFR-P-005; risk R-008; DPIA condition 5

**Why This Category**: Voice is the main input for people with tremor. On-device transcription is the default (P8). A consented server path exists for soft or slurred speech (Conflict C-3).

**Research status**: PARTIAL. The server path is priced. On-device engines were not researched, and accuracy on Parkinsonian speech remains the open question behind R-008.

### Option 5A: On-Device Engine (default path)

Not researched in v1.0. Candidates are the platform speech frameworks on iOS and Android and open-source on-device models. The Phase 0 device-lab evaluation (R-008 action, due 2026-12-15) must measure word error rate on representative voices against the proposed 15% target (NFR-U-002). Open question OQ-5.

### Option 5B: Buy — Amazon Transcribe in Sydney (consented server path)

**Pricing** (Sydney): streaming US$0.0001667 per second (about US$0.010 per minute); batch US$0.0001 per second (about US$0.006 per minute) [WEB-32-C1].

**Cost Breakdown** (A$k; participant-years using the server path of 5, 60 and 150 in the base case; 3 minutes of audio a day):

| Cost Item | Year 1 | Year 2 | Year 3 | Notes |
|-----------|--------|--------|--------|-------|
| Streaming transcription | 0.1 | 1.0 | 2.5 | US$10.95 per participant-year × 1.52 |
| Integration | 7.7 | 0.0 | 0.0 | 2 person-weeks (estimate) |
| **3-Year TCO** | **7.8** | **1.0** | **2.5** | **11.3** (growth case 67.8) |

**Data handling**: Audio is deleted after confirmation (FR-011). Whether Transcribe content can be used for service improvement, and how to opt out, was not checked. This must be verified for DPIA condition 5 (open question OQ-6).

### Option 5C: Buy — Amazon Transcribe Medical

Priced in Sydney at US$0.00125 per second (about US$0.075 per minute) [WEB-32-C1], 7.5 times standard streaming. Base case 3-year TCO A$34.5k. A medical vocabulary may not help with patient speech. Evaluate it only if standard transcription misses clinical terms in the evaluation set.

### Build vs Buy Recommendation for Speech-to-Text

**Recommended Approach**: On-device by default (engine to be chosen in the device lab), and BUY Amazon Transcribe standard streaming in Sydney for the consented server path, once data-use terms are confirmed.

---

## Category 6: Durable Workflow Engine

**Requirements Addressed**: FR-024, INT-004, NFR-A-002, NFR-A-004, NFR-SEC-003; TC-4; Conflict C-7

**Why This Category**: Journeys last months or years. Reminders, reviews and escalations must survive restarts and deployments without duplicates.

**Key findings**: Temporal Cloud offers an AWS Sydney region (`aws-ap-southeast-2`) with "Same Region Replication: Available" [WEB-2-C1]. Sydney is the only Australian region; Melbourne is not offered [WEB-2-C2]. Any Temporal Cloud replication to another region would therefore leave Australia. For certified production, NFR-A-002's warm standby in a second approved region cannot be met with Temporal Cloud alone. Temporal Cloud pricing was not retrieved [UNSOURCED].

### Option 6A: Build — Custom Durable Workflow on PostgreSQL

Not recommended. Estimated at 20 person-weeks plus 0.25 FTE a year of maintenance: A$126.9k, A$50.0k and A$50.0k, so **A$226.9k** over 3 years (estimate). It would rebuild a mature commodity and its versioning semantics (FR-024).

### Option 6B: Adopt — Temporal, Self-Hosted in Each Data Plane (recommended)

**Description**: Temporal on Kubernetes, with persistence on the data plane's PostgreSQL and payloads encrypted client-side with tenant-held keys (FR-024, INT-004).

**Cost Breakdown** (A$k; one extra m7g.large node per plane at US$0.096 per hour in Sydney [WEB-37-C1]; 1.25, 3 and 5 plane-years in the base case):

| Cost Item | Year 1 | Year 2 | Year 3 | Notes |
|-----------|--------|--------|--------|-------|
| Infrastructure | 1.6 | 3.8 | 6.4 | A$1,278 per plane-year |
| Setup (Helm, encryption codec, runbooks) | 15.4 | 0.0 | 0.0 | 4 person-weeks (estimate) |
| Operations (upgrades, version pinning, chaos tests) | 30.0 | 30.0 | 30.0 | 0.15 FTE (estimate) |
| **3-Year TCO** | **47.0** | **33.8** | **36.4** | **117.2** (growth case 158.4) |

**Pros**: Runs in every data plane, regulated ones included (P9). No extra processor for the DPIA. Works on any certified cloud (P10).
**Cons**: Operations take about 0.15 FTE, against a small platform allocation (R-019).

### Option 6C: Buy — Temporal Cloud (Sydney)

**Status**: Candidate for unregulated planes only. It needs pricing, a data processing agreement, client-side payload encryption, and contractual approval under INT-004 and Conflict C-7. **Break-even note**: Scenario B below is cheaper than the recommended blend only if Temporal Cloud costs less than about A$120k over 3 years (about US$26k a year at the assumed exchange rate). Obtain a quote (OQ-4).

### Build vs Buy Recommendation for Durable Workflow

**Recommended Approach**: ADOPT self-hosted Temporal (the TC-4 baseline). Reassess Temporal Cloud Sydney for unregulated planes once priced, accepting that it is limited to same-region replication.

---

## Category 7: Graph Database Backend for Graphiti (input to the follow-on ADR)

**Requirements Addressed**: INT-003, FR-040 to FR-045, FR-051, NFR-SEC-003, NFR-SEC-007, NFR-A-002, NFR-I-004, TC-9; risks R-13, R-022, R-023; ADR-001 section 12.2

**Why This Category**: ADR-001 selects Graphiti and defers the backend to a follow-on ADR with a TC-9 licence review. The technology notes flag graph infrastructure as Graphiti's main concern [TN-C1]. Memory stays a derived projection that can be rebuilt [TN-C2], and is never a system of record [TN-C3]. That lowers the backend's durability and backup requirements but not its isolation, encryption or licence requirements.

**Upstream facts**: Graphiti is Apache-2.0 [WEB-1-C1], with 31.4k stars and 3.2k forks [WEB-1-C5]. It supports Neo4j 5.26, FalkorDB 1.1.2, Amazon Neptune (with an "Amazon OpenSearch Serverless collection (serves as the full text search backend)"), and Kuzu 0.11.2, which "is deprecated and will be removed in a future release" [WEB-1-C2].

### Mandatory gates (pass or fail, applied before scoring)

| Option | G1: data stays in the tenant data plane in an approved Australian region (P11, CSD-C23, Conflict C-7) | G2: maintained and supported by Graphiti | G3: licence permitted, or approvable, under TC-9 | Result |
|--------|------|------|------|--------|
| 7A Neo4j Community (self-hosted) | Pass | Pass (primary backend) | Conditional: GPL v3 [WEB-16-C1] needs legal review | Proceed (conditional) |
| 7B Neo4j Enterprise (self-managed) | Pass | Pass | Pass (commercial licence; price unknown) | Proceed |
| 7C Neo4j AuraDB (managed SaaS) | Fail for pilot and regulated planes: vendor-hosted, and Australian regions are not stated [WEB-17-C2] | Pass | Pass | Excluded for now |
| 7D Amazon Neptune Serverless with OpenSearch Serverless | Pass (inside Cairn's AWS account in Sydney) | Pass, with an extra service [WEB-1-C2] | Pass (managed service) | Proceed |
| 7E FalkorDB | Pass | Pass | Fail unless approved: SSPLv1 [WEB-18-C1] | Excluded (unless a commercial licence is approved) |
| 7F Cairn-maintained PostgreSQL driver | Pass | Fail upstream: PR closed 2026-09-29 as stale [WEB-20-C1]; RFC "Closed as not planned" [WEB-21-C1]; third-party driver is alpha [WEB-22-C1] | Pass | Contingency only |
| 7G Kuzu (or its forks) | Pass | Fail: archived 2025-10-10 [WEB-23-C1]; deprecated in Graphiti [WEB-1-C2] | Pass (MIT) | Excluded |

Apache AGE would allow a PostgreSQL-native graph, but it is not available on Amazon RDS; the request has been open since 2023 [WEB-25-C1]. It is not a near-term option on the first cloud.

### Evaluation matrix (options passing or conditionally passing the gates)

Scores run from 1 (poor) to 5 (strong). Weights total 100%.

| Criterion | Weight | 7A Neo4j Community | 7B Neo4j Enterprise | 7D Neptune with OpenSearch | 7F PostgreSQL driver | 7E FalkorDB (reference only) |
|-----------|--------|-----|-----|-----|-----|-----|
| Licence fit (TC-9) | 20% | 3 | 4 | 5 | 5 | 1 |
| Portability across clouds (P10) | 20% | 5 | 5 | 1 | 5 | 5 |
| Isolation and security features (FR-041, NFR-SEC-007) | 15% | 3 | 5 | 3 | 4 | 4 |
| Operability for a small team (R-019) | 15% | 3 | 4 | 5 | 2 | 3 |
| 3-year cost, base and growth | 15% | 4 | 1 | 3 | 2 | 4 |
| Graphiti support maturity | 15% | 5 | 5 | 3 | 1 | 4 |
| **Weighted score** | **100%** | **3.85** | **4.05** | **3.30** | **3.35** | **3.45** |

Scoring notes: Neo4j Enterprise's cost score of 1 reflects an unknown price ("contact sales" [UNSOURCED]), not a known high one. Neo4j Community's isolation score reflects that multiple databases, role-based access control and online backup are Enterprise-only [WEB-24-C1]. FalkorDB supports multiple graphs per instance [WEB-18-C2], which would allow per-journey graphs, but it fails gate G3.

### 3-year cost by option (A$k)

Base case: 1, 2 and 3 memory-enabled data planes (non-production gate, mentorship, one employer). Growth case: 1, 5 and 15 planes. Infrastructure is at Sydney list prices; labour at the SOBC rate.

| Option | Infrastructure per plane-year | Setup and one-off | Operations | Base 3-year | Growth 3-year |
|--------|-------------------------------|-------------------|------------|-------------|---------------|
| 7A Neo4j Community | A$1.9k (one r7g.large-class node, US$0.144/h [WEB-37-C1]) | 2 person-weeks plus A$7.5k legal review (estimate) | 0.10 FTE | **86.7** | 115.5 |
| 7B Neo4j Enterprise | As 7A plus licence [UNSOURCED] | As 7A | 0.08 FTE (estimate) | Not computable | Not computable |
| 7D Neptune with OpenSearch, high availability | A$10.1k (1 NCU at US$0.1941/h [WEB-28-C1] plus 2 OCU at US$0.281/h [WEB-30-C1]) | 1.5 person-weeks | 0.03 FTE | 84.2 | 235.2 |
| 7D Neptune with OpenSearch, dev-test (1 OCU) | A$6.3k | 1.5 person-weeks | 0.03 FTE | 61.7 | 156.6 |
| 7F PostgreSQL driver | A$1.4k (db.t4g.medium, US$0.102/h [WEB-39-C1]) | 8 person-weeks | 0.15 FTE | 128.9 | 149.3 |
| 7C AuraDB Professional, 2 GB (excluded) | A$2.4k (US$0.09 per GB-hour [WEB-17-C1]) | 1 person-week plus A$5k contract review | 0.03 FTE | 43.2 | 85.9 |

Neptune Serverless's minimum is 1 NCU (about 2 GB of memory) [WEB-19-C1]. The OpenSearch Serverless minimum is 2 OCUs with standby, or 1 OCU in dev-test mode without standby [WEB-26-C1]. Because memory needs no RPO and degrades to the null provider (NFR-A-002, NFR-A-003), the dev-test configuration may be acceptable for memory. The ADR should decide that.

### Option 7A: Adopt — Neo4j Community Edition, Self-Hosted (recommended default, conditional)

**Pros**:

- Pro: Graphiti's primary backend, so the best-tested driver path [WEB-1-C2]
- Pro: Runs inside every data plane on any certified cloud (P10, P11)
- Pro: Lowest growth-case cost of the compliant options

**Cons**:

- Con: GPL v3 [WEB-16-C1]. Whether Cairn "distributes" Neo4j depends on the operating model: vendor-operated planes versus certified configurations deployed into a tenant's cloud (A-4, BR-008). A legal opinion is required (TC-9). This document does not give one.
- Con: One user database, no role-based access control, and offline backup only [WEB-24-C1]. Isolation rests on the adapter's server-derived `group_id`, which ADR-001 already accepts, and on network policy that lets only the adapter reach the database (FR-041). Backups matter little because memory is rebuilt from canonical events (DR-015).
- Con: Encryption at rest relies on encrypted volumes with cloud KMS keys. Native Neo4j encryption features were not verified (OQ-10).

### Option 7D: Buy — Amazon Neptune Serverless with Amazon OpenSearch Serverless (AWS fallback)

**Pros**: No copyleft licence. Managed, so the lowest operations load. Data stays in Cairn's AWS account in Sydney.
**Cons**: AWS-only, so the Phase 3 second cloud needs another backend and Graphiti driver. Two managed services per data plane. Higher cost at scale (A$235.2k in the growth case). Graphiti's Neptune path is less exercised than Neo4j.

### Build vs Buy Recommendation for the Graph Backend

**Recommended Approach** (for the follow-on ADR): ADOPT **Neo4j**. Use Community Edition if the GPL v3 legal opinion is favourable for both operating models, and request a Neo4j Enterprise quote in parallel; Enterprise scores highest technically if its price fits. Keep **Amazon Neptune Serverless with OpenSearch Serverless** as the AWS-only fallback if the GPL opinion is negative or operations capacity becomes the binding constraint. Track the PostgreSQL driver as a contingency, not a plan. Exclude FalkorDB (unless a commercial licence is approved), Kuzu and, for pilot planes, AuraDB.

**Key Decision Factors**:

- **Licence (TC-9)**: Decides between 7A and 7D. Commission the legal opinion first
- **Portability (P10)**: Favours Neo4j
- **Capacity (R-019)**: Favours Neptune
- **Evidence**: Run the ADR-001 acceptance gate (isolation, deletion probes including entity summaries, latency) on the chosen backend before any non-synthetic data is ingested

**Next Steps**:

- [ ] Request a legal opinion on Neo4j Community GPL v3 for vendor-operated and tenant-deployed configurations
- [ ] Request a Neo4j Enterprise quote, including any start-up programme
- [ ] Confirm whether AuraDB offers Australian regions, for later unregulated use (OQ-9)
- [ ] Raise the follow-on ADR with `/arckit:adr` using the gates, matrix and costs above

---

## Category 8: Event Streaming and Transactional Outbox

**Requirements Addressed**: FR-050, INT-008, NFR-I-002, DR-001, DR-015, INT-010

**Why This Category**: Projections, including Graphiti, consume only the canonical event stream, published after commit and ordered per journey.

**Findings**: Amazon MSK in Sydney costs US$0.255 per broker-hour for kafka.m7g.large, and MSK Serverless costs US$0.9375 per cluster-hour before partition, data and storage charges [WEB-47-C1]. A three-broker cluster is about A$10.2k per data plane-year before storage. MSK Serverless is about A$12.5k per plane-year in base charges alone. Projected load is modest: 20 turns per second on average in certified production (NFR-P-001).

### Options

| Option | 3-year view | Assessment |
|--------|-------------|------------|
| 8A Build: PostgreSQL transactional outbox plus relay (claim-check, as in `ARC-001-DATA-v1.0`) | No extra infrastructure; effort sits inside the core build | **Recommended**. Same transaction as the canonical write; ordering by journey sequence |
| 8B Adopt: self-hosted open-source broker | Not researched | Revisit if fan-out or throughput grows |
| 8C Buy: Amazon MSK | From about A$10.2k per plane-year | AWS-only; unnecessary at projected volumes |

**Recommended Approach**: BUILD the outbox on PostgreSQL behind the internal event abstraction (NFR-I-002). Defer any broker until measured load or consumer count needs one.

---

## Category 9: Identity and Authentication

**Requirements Addressed**: NFR-SEC-001, INT-005, FR-003, FR-033, FR-039; Conflict C-10

**Research status**: Pricing only. Feature fit (passkeys and platform biometrics for participants, phishing-resistant MFA for staff, SAML federation through a broker, accessible hosted pages, Australian residency) was not verified.

**Findings**: Amazon Cognito in Sydney costs US$0.015 per monthly active user (MAU) on the Essentials tier, US$0.0055 on Lite (first 90,000) and US$0.02 on Plus, with a global free tier of 10,000 MAU on Essentials [WEB-45-C1]. Assuming two identities per journey (participant plus contributors and reviewers), the base case stays inside the free tier through Year 3 (6,000 MAU). The growth case reaches about 60,000 MAU in Year 3, about A$13.7k that year.

**Recommended Approach**: FURTHER RESEARCH. Cognito Essentials is a low-cost candidate behind the identity adapter. Compare it with a self-hosted open-source identity provider and with SaaS providers that host in Australia, on passkey support, accessibility and federation (OQ-7).

---

## Category 10: Policy and Authorisation Engine

**Requirements Addressed**: FR-036, NFR-SEC-002, FR-003, FR-038, FR-041

**Findings**: Amazon Verified Permissions in Sydney costs "150 USD per million Batch Authorization Requests" for the first 40 million, falling to US$75 and then US$40 per million [WEB-46-C1]. Cairn checks policy on every read, write, model call and memory call (FR-036). At an assumed 50 checks per turn, the base case reaches 54 million checks in Year 3, about A$10.7k. The growth case reaches 540 million, about A$42.7k a year. Every check would also add a network call, and the service is AWS-only.

**Recommended Approach**: BUILD in-process policy evaluation in the core, so decisions are deterministic, replayable and versioned (P2, P12) and portable (P10). Use an embeddable open-source policy engine if one passes review (not researched; OQ-8).

---

## Category 11: Notifications (Email, SMS, Push)

**Requirements Addressed**: INT-009, FR-033, FR-023, NFR-SEC-001; DPIA-012; APP 8

**Findings**: Amazon SES in Sydney costs US$0.00016 per outbound email on the Essentials plan (first 10 million) [WEB-31-C1]. Base-case email cost over 3 years is about A$0.1k. In-region sending meets the DPIA preference for an in-region provider.

**Not researched**: SMS providers and any Australian sender-identity rules for one-time codes; push delivery (Apple and Google push services act as offshore processors by design, so they need an APP 8 assessment even with content-free payloads, as INT-009 requires).

**Recommended Approach**: BUY Amazon SES for email. SMS and push remain open (OQ-11).

---

## Category 12: Observability

**Requirements Addressed**: NFR-M-001, NFR-C-004, P17

**Findings**: Amazon CloudWatch in Sydney costs US$0.67 per GB of log ingestion, US$0.033 per GB-month of log storage, and US$0.30 per metric-month for the first 10,000 metrics [WEB-43-C1]. The platform baseline below assumes 30 GB of logs a month, 100 GB stored and 200 custom metrics per data plane.

**Recommended Approach**: BUY CloudWatch behind OpenTelemetry collectors (TC-4) for the pilot, because it is in-region by construction (P11, P17). Any SaaS observability tool considered later must offer Australian hosting and content-free ingestion. Alternatives were not researched.

---

## Category 13: Cloud Platform Foundation (Kubernetes, PostgreSQL, Storage, Keys, Secrets)

**Requirements Addressed**: INT-010, TC-1, TC-4, TC-6, NFR-S-001, NFR-S-003, NFR-SEC-003, NFR-SEC-004, NFR-A-002, DR-001, DR-014

**Findings** (Sydney list prices, on demand):

| Service | Unit price | Source |
|---------|-----------|--------|
| Amazon EKS cluster | US$0.10 per cluster-hour | [WEB-29-C1] |
| EC2 m7g.xlarge (worker node) | US$0.192 per hour | [WEB-37-C1] |
| RDS PostgreSQL db.r7g.large, Multi-AZ | US$0.574 per hour | [WEB-39-C1] |
| RDS PostgreSQL db.t4g.medium, Single-AZ | US$0.102 per hour | [WEB-39-C1] |
| S3 Standard | US$0.025 per GB-month (first 50 TB) | [WEB-40-C1] |
| AWS KMS customer-managed key | US$1 per key version per month | [WEB-41-C1] |
| AWS Secrets Manager | US$0.40 per secret per month | [WEB-42-C1] |
| Application Load Balancer | US$0.0252 per hour plus US$0.008 per LCU-hour | [WEB-44-C1] |

**Per-data-plane baseline**: about US$1,084.64 a month, about **A$19.8k a year**. This covers EKS (US$73.00), three m7g.xlarge nodes (US$420.48), Multi-AZ PostgreSQL (US$419.02), load balancer (US$24.24), 100 GB of S3 (US$2.50), 50 KMS keys (US$50.00), 30 secrets (US$12.00) and CloudWatch (US$83.40). It excludes NAT gateways, data transfer and EBS volumes [UNSOURCED].

| Cost Item | Year 1 | Year 2 | Year 3 | Notes |
|-----------|--------|--------|--------|-------|
| Platform baseline, base case | 24.7 | 59.4 | 98.9 | 1.25, 3 and 5 plane-years |
| **3-Year TCO (A$k)** | | | **183.0** | Growth case (1.5, 10 and 30 plane-years): **821.0** |

**Recommended Approach**: BUY managed AWS services behind adapters, as the SOBC sourcing route already proposes. Growth comes from more data planes (NFR-S-001), so the platform line scales almost linearly with tenants. This is the main reason the growth case costs four times as much.

---

## Categories Identified but Not Yet Researched (v1.1)

| Category | Requirements | Question to answer |
|----------|--------------|--------------------|
| On-device motor and voice feature extraction | FR-014, FR-048, NFR-P-5, INT-012 | Which on-device libraries can compute pack capture features within NFR-P-005, and does any feature change the TGA position? |
| Mobile offline store and on-device safety floor | FR-015, NFR-SEC-009 | Which encrypted local store and attestation options suit React Native? |
| Clinical interoperability | FR-034, INT-006 | Tooling for FHIR R4 AU Core payloads, SNOMED CT-AU licensing, and secure clinical messaging eligibility |
| Evaluation harness tooling | FR-047, NFR-M-006, FR-051 | Which open-source evaluation libraries suit an in-region certification harness? |
| Supply-chain and vulnerability tooling | NFR-SEC-005, NFR-SEC-008 | Signing, SBOM and scanning tools that feed the SOUP register |
| Regulated lifecycle and quality tooling | NFR-C-005 | Proportionate QMS tooling if the Parkinson's pack is a medical device |
| Enterprise HR and learning connectors | INT-007 | Which connectors employer buyers expect (Category 2 gives a first signal) |
| Second-cloud equivalents | NFR-I-004, BR-008 | Inference, graph and workflow equivalents on the Phase 3 cloud |
| Australian procurement pathways | BR-013 | How Australian public health services and Commonwealth buyers procure software like Cairn, and whether they expect IRAP-assessed hosting |

---

## Total Cost of Ownership (TCO) Summary

### Blended TCO Across All Categories

**Recommended Approach (Blended), base case, A$k** (commodity and platform layer only; the differentiating core and packs are in the SOBC development team line of A$3.20M and are not repeated here):

| Category | Recommended Option | Year 1 | Year 2 | Year 3 | 3-Year TCO |
|----------|-------------------|--------|--------|--------|------------|
| Cloud platform foundation | Buy (AWS managed) | 24.7 | 59.4 | 98.9 | 183.0 |
| LLM inference | Buy (Bedrock AU geo) | 10.6 | 30.2 | 100.3 | 141.1 |
| Model gateway | Build (thin) | 33.1 | 20.0 | 20.0 | 73.1 |
| Durable workflow | Adopt (Temporal self-hosted) | 47.0 | 33.8 | 36.4 | 117.2 |
| Graph backend | Adopt (Neo4j Community) | 37.1 | 23.8 | 25.8 | 86.7 |
| Speech server path | Buy (Transcribe) | 7.8 | 1.0 | 2.5 | 11.3 |
| Email | Buy (SES) | 0.0 | 0.0 | 0.1 | 0.1 |
| Identity | Further research (Cognito indicative) | 0.0 | 0.0 | 0.0 | 0.0 |
| **TOTAL** | | **160.3** | **168.2** | **284.0** | **612.5** |

**Growth case (REQ NFR-S-001: 500, 10,000 and 50,000 journeys), same blend, A$k**: 168.0, 424.7 and 1,708.2, so **2,301.0** over 3 years. The main drivers are the platform (821.0) and LLM inference (1,050.3, of which Graphiti ingestion is the largest part).

Figures are rounded to the nearest A$0.1k, so totals may differ from column sums by 0.1.

### Alternative Scenarios (base case, commodity and platform layer)

| Scenario | Components that differ | Year 1 | Year 2 | Year 3 | 3-Year TCO |
|----------|------------------------|--------|--------|--------|------------|
| A: Build everything | Custom durable workflow on PostgreSQL; Cairn-maintained PostgreSQL graph driver | 265.2 | 193.3 | 305.9 | 764.4 |
| B: Buy everything (managed) | Neptune with OpenSearch (high availability); Temporal Cloud (fees **excluded**, [UNSOURCED]) | 98.0 | 136.7 | 258.0 | 492.7 plus Temporal Cloud fees |
| C: Open source everything | In-cluster open-weight models on GPU; self-hosted STT on the same GPUs; self-hosted identity provider (0.05 FTE operations, estimate) | 247.3 | 252.8 | 352.6 | 852.7 |
| D: Recommended blend | As in the table above | 160.3 | 168.2 | 284.0 | 612.5 |

- **Scenario A**: Maximum control, but it rebuilds commodities and costs about 25% more than D
- **Scenario B**: Cheapest on paper, but it excludes Temporal Cloud fees (D wins if those exceed about A$120k over 3 years) and ties the memory store to AWS (P10)
- **Scenario C**: Lowest licence exposure, but GPU costs and operations make it the most expensive at base volumes, with model-quality risk
- **Scenario D**: Balances portability, capacity and cost. Its main sensitivity is the operations labour for self-hosted Temporal and Neo4j

### TCO Assumptions

- **Labour**: A$200k per FTE-year blended (SOBC B2), so A$3,846 per person-week and A$16,667 per person-month. Effort figures marked "estimate" are the analyst's, not vendor data
- **Exchange rate**: US$1 = A$1.52, a planning assumption [UNSOURCED]. Replace it with the Reserve Bank rate in the Outline Business Case
- **Infrastructure**: AWS Sydney (ap-southeast-2) on-demand list prices from the AWS Price List data published between 2026-09-11 and 2026-10-01 (sources in Appendix D). No reserved-instance or savings-plan discounts
- **Volumes, base case** (aligned to SOBC Option 2): data plane-years of 1.25, 3 and 5; memory-enabled planes 1, 2 and 3; journey-years 50, 1,000 and 3,000; memory-enabled journey-years 0, 225 and 1,500
- **Volumes, growth case** (REQ NFR-S-001): data plane-years 1.5, 10 and 30; memory planes 1, 5 and 15; journey-years 250, 5,000 and 30,000; memory journey-years 0, 1,500 and 15,000
- **SaaS escalation**: 10% a year where a subscription applies (AuraDB, Mentorloop); cloud list prices held flat
- **Excluded**: GST, contingency (the SOBC applies 40%), NAT gateways and data transfer, SMS and push, Temporal Cloud and Neo4j Enterprise fees, and the differentiating core build
- **Year boundaries**: Year 1 runs October 2026 to September 2027, as in the SOBC

### Sensitivity Analysis (Scenario D)

| Variable | Change | Effect on 3-year TCO (base) | Effect (growth) |
|----------|--------|-----------------------------|-----------------|
| Operations labour for Temporal, Neo4j and gateway maintenance (A$200k base) | ±50% | ±A$100.0k | ±A$100.0k or more |
| Tokens per Graphiti episode | ±50% | ±A$31.1k | ±A$298.0k |
| Haiku-class model for Graphiti ingestion instead of Sonnet 4.6 | Switch | −A$41.5k | −A$397.3k |
| Exchange rate | ±10% | ±A$32.1k (US$-denominated items) | ±A$190k approx. |
| Rebinding to Sonnet 5 for phrasing (+30% tokens at US$2.20/US$11.00) | Switch | About +A$5k | About +A$45k |
| Graph backend Neptune (high availability) instead of Neo4j Community | Switch | −A$2.5k | +A$119.7k |

### Risk-Adjusted TCO

| Scenario | Base TCO | Contingency | Risk-Adjusted TCO | Risk Factors |
|----------|----------|-------------|-------------------|--------------|
| A: Build everything | A$764.4k | +20% | A$917.3k | Custom workflow and graph driver; scope creep; skills |
| B: Buy (managed) | A$492.7k plus Temporal Cloud fees | +10% | A$542.0k plus fees | Price increases; AWS-only memory store; Temporal Cloud DR limits |
| C: Open source | A$852.7k | +15% | A$980.6k | GPU operations; model quality; underestimated maintenance |
| D: Recommended | A$612.5k | +12% | A$686.0k | Model churn; GPL opinion; operations capacity (R-019) |

---

## Requirements Traceability

### Requirements Coverage Matrix

Status key: **Identified** = an external product or service is recommended with sourced evidence; **Build** = custom development in the core or packs (by design); **Further research** = no solution can be named yet.

| Requirement ID | Requirement Description | Research Category | Recommended Solution | Rationale |
|----------------|------------------------|-------------------|---------------------|-----------|
| BR-001, BR-002, BR-003, BR-004, BR-005, BR-006, BR-007, BR-009, BR-011, BR-012, BR-013 | Programme-level outcomes (one core, evidence-backed briefs, ownership, explainability, burden, safety, regulatory readiness, employer safety, insight, pack scale, first tenants) | Categories 1 and 2 | Build: core and packs | The differentiator; market scans incomplete |
| BR-008 | Deploy within residency | 3, 13 | Identified: AWS Sydney and Melbourne; Bedrock `au.` profiles | Australian-only routing [WEB-8-C2] |
| BR-010 | Replaceable AI and memory | 4, 7 | Identified: gateway; Graphiti behind the interface (ADR-001); null provider | Rebinding is a release, not a code change |
| FR-001, FR-002, FR-003, FR-004, FR-005, FR-006, FR-007, FR-008, FR-009, FR-010 | Tenancy, participants, relationships, journeys, pack registry and lifecycle | Core | Build on PostgreSQL (TC-4) | No product meets the pack contract |
| FR-011 | Text and voice turns | 5 | Further research: on-device engine TBD; server path Transcribe | R-008 unresolved |
| FR-012, FR-013 | Transcript confirmation; activities runner | Core | Build | Core behaviour |
| FR-014 | On-device features | Not yet researched | Further research | Category not covered in v1.0 |
| FR-015 | Offline capture and on-device floor | Not yet researched | Further research | Category not covered in v1.0 |
| FR-016 | Schema-constrained extraction | 3 | Identified: Sonnet 4.6 (AU geo) plus deterministic validation | Structured outputs supported [WEB-13-C1] |
| FR-017, FR-018, FR-019, FR-020, FR-021, FR-022, FR-023 | Evidence, timeline, coverage, rules, algorithms, planner, burden budget | Core | Build | Deterministic core (P2) |
| FR-024 | Durable workflows | 6 | Identified: Temporal self-hosted | TC-4 baseline |
| FR-025 | Companion phrasing | 3 | Identified: Haiku 4.5 (AU geo), Sonnet 5 fallback | Lowest-cost compliant model |
| FR-026, FR-027, FR-028, FR-029, FR-030 | Safety floor, red flags, safety events, prohibited decisions, brief assembly | Core | Build | No model or vendor in these paths |
| FR-031 | Quote shortening | 3 | Identified: Bedrock AU geo plus subsequence check | As FR-025 |
| FR-032 | Participant approval | Core | Build | P4 |
| FR-033 | Secure share links and recipient verification | 11 | Further research: email codes via SES identified; SMS provider TBD | SMS not researched |
| FR-034 | Structured exports | Not yet researched | Further research | FHIR AU tooling not covered |
| FR-035 | Participant data export | Core | Build | Core behaviour |
| FR-036 | Purpose-based consent enforcement | 10 | Further research: build in-process; engine TBD | Engine not researched |
| FR-037, FR-038, FR-039 | Aggregates, administration, break-glass | Core | Build | Core behaviour |
| FR-040, FR-041, FR-042, FR-043, FR-044, FR-045 | Memory interface, isolation, retain and recall, never govern, deletion, synthesis | 7 | Identified: Graphiti (ADR-001) on Neo4j (shortlist) or Neptune | Category 7 gates and matrix |
| FR-046 | Task-level model gateway | 3, 4 | Identified: thin gateway with an OpenAI-compatible façade over Bedrock | Bedrock lacks Chat Completions for Claude [WEB-8-C4] |
| FR-047 | Evaluation harness | Not yet researched | Further research | Tooling not covered |
| FR-048, FR-049 | Reference packs | 1, 2 | Build | Platform thesis |
| FR-050 | Canonical event stream | 8 | Identified: PostgreSQL transactional outbox | Volumes do not justify a broker |
| FR-051, FR-052 | Acceptance gate; pack memory ontology | 7 | Identified: Graphiti versus null gate; pack entity types | ADR-001 |
| NFR-P-001, NFR-P-002, NFR-P-004 | Responsiveness, timeline and brief performance, throughput | Core, 13 | Build; validate by load test | Platform sized in Category 13 |
| NFR-P-003, NFR-P-006 | Memory recall budget; ingestion and rebuild budget | 3, 7 | Identified: measured in the acceptance gate; cost model in Category 3 | Ingestion cost estimate given |
| NFR-P-005 | On-device efficiency | Not yet researched | Further research | Device floor not covered |
| NFR-A-001, NFR-A-003 | Availability; graceful degradation | Core | Build | Null provider and fixed wording |
| NFR-A-002 | Disaster recovery | 6, 13 | Identified: RDS Multi-AZ; standby design in second Australian region; Temporal Cloud limited to Sydney | [WEB-2-C2] |
| NFR-A-004 | Long-duration workflow durability | 6 | Identified: Temporal | Workflow versioning |
| NFR-S-001, NFR-S-003 | Horizontal scaling; data plane provisioning | 13 | Identified: EKS and infrastructure as code | [WEB-29-C1] |
| NFR-S-002 | Data volume scaling | Core | Build (partitioning, storage tiering) | DATA model |
| NFR-SEC-001 | Authentication | 9 | Further research: Cognito priced; fit not verified | OQ-7 |
| NFR-SEC-002 | Authorisation | 10 | Further research: in-process engine TBD | OQ-8 |
| NFR-SEC-003 | Encryption | 13 | Identified: AWS KMS plus encrypted volumes for the graph store | [WEB-41-C1] |
| NFR-SEC-004 | Secrets management | 13 | Identified: AWS Secrets Manager | [WEB-42-C1] |
| NFR-SEC-005 | Vulnerability management | Not yet researched | Further research | Tooling not covered |
| NFR-SEC-006, NFR-SEC-007, NFR-SEC-009 | AI security, isolation testing, mobile security | Core | Build | Cairn-specific tests |
| NFR-SEC-008 | Supply-chain integrity | Not yet researched | Further research | Tooling not covered |
| NFR-C-001, NFR-C-002, NFR-C-003, NFR-C-006 | Privacy compliance, audit, assurance reporting, responsible AI | Core | Build; vendor terms per DPIA condition 5 | Bedrock terms support condition 5 |
| NFR-C-004 | Residency enforcement | 3, 13 | Identified: `au.` profiles only; SCPs over Sydney and Melbourne; reject `global.` | [WEB-5-C1] [WEB-5-C3] |
| NFR-C-005 | Regulated pack assurance | Not yet researched | Further research | QMS tooling not covered |
| NFR-U-001, NFR-U-003 | User experience; localisation | Core | Build | Design work |
| NFR-U-002 | Accessibility, including speech accuracy | 5 | Further research: engine evaluation (R-008) | OQ-5 |
| NFR-M-001 | Observability without content | 12 | Further research: CloudWatch priced; stack decision open | Alternatives not covered |
| NFR-M-002, NFR-M-003, NFR-M-004, NFR-M-005 | Documentation, runbooks, dependency rules, everything as code | Core | Build | Engineering practice |
| NFR-M-006 | Evaluation-gated delivery | Not yet researched | Further research | Tooling not covered |
| NFR-I-001, NFR-I-002, NFR-I-003 | API standards, integration, data portability | Core | Build | Engineering practice |
| NFR-I-004 | Cloud portability | 3, 7 | Further research: Phase 3 equivalents; Neptune would need replacement | OQ-12 |
| INT-001 | Model providers | 3 | Identified: Bedrock AU geo | Category 3 |
| INT-002 | Speech engines | 5 | Further research: on-device TBD; Transcribe for server path | OQ-5 |
| INT-003 | Context memory provider | 7 | Identified: Graphiti on Neo4j (shortlist) or Neptune | Category 7 |
| INT-004 | Durable workflow engine | 6 | Identified: Temporal self-hosted | Category 6 |
| INT-005 | Identity providers | 9 | Further research | OQ-7 |
| INT-006 | Clinical systems | Not yet researched | Further research | FHIR AU tooling not covered |
| INT-007 | Enterprise HR and learning systems | 2 | Further research: buyer expectations noted (SSO, HRIS) | [WEB-15-C3] |
| INT-008 | Generic outbound integration | 8 | Build on the outbox | Category 8 |
| INT-009 | Notification channels | 11 | Further research: SES identified; SMS and push open | OQ-11 |
| INT-010 | Cloud platform services | 13 | Identified: AWS Sydney services behind adapters | Category 13 |
| INT-011 | Control plane to data plane | Core | Build | Core design |
| INT-012 | Device health platforms | Not yet researched | Further research | Category not covered |
| DR-001 | Canonical system of record | 13 | Identified: PostgreSQL (RDS) | [WEB-39-C1] |
| DR-002, DR-003, DR-004, DR-005, DR-006, DR-007, DR-008, DR-009, DR-010, DR-011, DR-012, DR-013 | Integrity, manifests, classification, consent, retention, partitioning, aggregation privacy, projection records, temporal semantics, raw media, secondary use, non-production data | Core | Build | Core data design (`ARC-001-DATA-v1.0`) |
| DR-014 | Bi-temporal canonical state | 13 | Identified: PostgreSQL range types and exclusion constraints | DATA model implementation guidance |
| DR-015 | Disposable, rebuildable projections | Core, 7 | Build (replay from the outbox) | Graphiti episodes rebuilt per journey |

### Coverage Summary

**Requirements with Identified Solutions**:

- **31 requirements (23.3%)** have a recommended commercial, managed or open-source solution backed by sourced evidence
- **79 requirements (59.4%)** require custom development, by design, because they are Cairn's differentiator
- **23 requirements (17.3%)** need further research or clarification

**Gaps and Concerns**:

**GAP-1**: BR-002, FR-048: health diary and PRO market scan (SOBC ask 1) not completed

- **Impact**: The build decision and differentiation claims rest on principle analysis, not competitor evidence
- **Options**: Complete the scan in v1.1 | Commission an analyst brief
- **Recommendation**: v1.1 before Gate 1 (December 2026)

**GAP-2**: FR-049, INT-007: mentoring landscape covers one vendor (SOBC ask 2)

- **Impact**: Pricing evidence for the Outline Business Case is thin, and the one data point is far below the SOBC illustration
- **Recommendation**: Profile five or more mentoring platforms, including Australian-hosted ones, in v1.1

**GAP-3**: FR-011, INT-002, NFR-U-002: on-device speech accuracy for Parkinsonian speech (R-008)

- **Impact**: The default voice path may not meet the 15% word error rate target
- **Recommendation**: Device-lab evaluation by 2026-12-15, as R-008 already plans

**GAP-4**: NFR-SEC-001, INT-005: identity provider fit not verified

- **Recommendation**: Short comparison covering passkeys, accessibility, federation and Australian hosting before build starts (January 2027)

**GAP-5**: INT-004: Temporal Cloud pricing and terms unknown; Sydney-only region limits replication

- **Recommendation**: Obtain a quote; keep self-hosting as the baseline

**GAP-6**: INT-003, TC-9: GPL v3 legal opinion, Neo4j Enterprise price and AuraDB Australian regions all unknown

- **Recommendation**: Commission the legal opinion and the quote before the follow-on ADR

**GAP-7**: INT-009, FR-033: SMS and push providers and their APP 8 treatment not researched

**GAP-8**: FR-034, INT-006: clinical interoperability tooling and licensing not researched (MEDIUM priority; the secure link is the Phase 1 channel)

**GAP-9**: FR-036, FR-047, NFR-SEC-008: open-source selection for the policy engine, evaluation harness and supply-chain tooling not researched

**GAP-10**: BR-013: Australian public-sector procurement pathways and buyers' hosting-assurance expectations not researched

---

## Australian Considerations (replaces UK Government Considerations)

> **Note**: The template's UK Government section (Technology Code of Practice, GOV.UK platforms, G-Cloud and DOS) does not apply. Cairn is a private-sector product deployed in Australia by default, as REQ v1.1, RISK v1.1, the DPIA and ADR-001 record. The Australian equivalents are below.

### Privacy Act 1988 and the APPs: what the vendor evidence means

| Obligation | Vendor evidence | Implication |
|-----------|-----------------|-------------|
| APP 8 (cross-border disclosure) | Bedrock `au.` profiles keep data in Australia [WEB-8-C2]; SES and Transcribe are priced and run in Sydney [WEB-31-C1] [WEB-32-C1] | No cross-border disclosure for inference, email or the speech server path |
| APP 11 (security and destruction) | Bedrock zero data retention by default [WEB-11-C1]; Fable retention of 30 days [WEB-11-C2] | Exclude Fable; keep the gateway's no-prompt-logging rule |
| DPIA condition 5 (processor terms) | No provider access to prompts on Bedrock [WEB-10-C1]; Transcribe data-use terms unverified | Confirm Transcribe opt-out before using the server path (OQ-6) |
| DPIA data inventory | Melbourne may hold abuse-detection copies when routed there [WEB-5-C2] | List both Australian regions as storage locations |
| Mentoring vendor hosting | Mentorloop offers Australian hosting [WEB-15-C2] | Australian hosting is available in this market, so buyers will expect it |

### TGA and SOUP

If the Parkinson's pack is a medical device (R-002), every third-party component in its path is SOUP (P9). That includes the Bedrock-hosted models, the speech engine, Temporal, PostgreSQL and libraries. The model end-of-life dates in Category 3 mean a regulated release would face SOUP changes within months; the pinned-release model (TC-8) must budget for that. Graphiti and its graph database stay out of the regulated pilot (ADR-001, DPIA), so the graph backend decision does not touch the SOUP register now.

### Procurement Pathway Notes

- **Cairn as buyer**: Components are bought on standard commercial terms (AWS pay-as-you-go, open-source licences). Neo4j Enterprise and Temporal Cloud would need contracts with residency, no-training and data-processing terms (SOBC C1.3).
- **Cairn as seller**: Federal and state procurement channels for health-service customers, and whether buyers expect IRAP-assessed hosting, were not researched (GAP-10). The UK Digital Marketplace equivalents are not relevant.

### Hosting and Data Residency

**Data Classification**: Restricted-Health and Restricted-Personal (DR-004). **Recommended approach**: AWS Sydney as the primary region and Melbourne as the second approved region (A-5), with inference through `au.` profiles only and SCPs that deny every other region.

---

## Integration with Wardley Mapping

### Value Chain Components by Evolution

| Component | Evolution Stage | Recommended Approach | Rationale |
|-----------|----------------|---------------------|-----------|
| Deterministic rules, planner, cited brief assembly, consent engine | Genesis to Custom | Build | Cairn's differentiator (P2, P3, P4) |
| Domain packs (Parkinson's, mentorship) | Custom | Build | Platform thesis (G-7) |
| Task-level model gateway | Custom | Build (thin) | Governance choke point (FR-046) |
| Long-term memory (Graphiti) | Custom moving to Product | Adopt (ADR-001) | Open-source library |
| Graph database | Product | Adopt (Neo4j) or managed (Neptune) | Category 7 |
| Durable workflow | Product | Adopt (Temporal) | Mature open source |
| LLM inference | Commodity (utility) | Buy (Bedrock AU geo) | Pay per token, in-region |
| Speech-to-text, typical speech | Commodity | Buy (server path) | Priced utility |
| Speech-to-text, atypical speech | Custom | Evaluate | R-008 |
| Identity | Product | Buy or adopt (TBD) | Category 9 |
| Kubernetes, PostgreSQL, storage, keys, email | Commodity | Buy managed | Category 13 |

**Strategic Insights**:

- **Inference is a utility, but models move fast**: Treat model bindings like dependencies with expiry dates, and budget recurring rebinding
- **The memory store is the least mature commodity in the stack**: Keep it portable and disposable (DR-015) so the backend can change without migration
- **Self-hosting creates an operations tax**: Temporal and Neo4j together consume about 0.25 FTE a year, close to the SOBC's 0.5 FTE platform allocation

**Next Steps**: Run `/arckit:wardley` with these positions.

---

## Integration with SOBC Economic Case

### Options Analysis for SOBC

The SOBC's options (0 to 3) are about scope. The scenarios here are about sourcing within Option 2 (recommended), so they refine Option 2's cost lines rather than replace the options.

- **Option 0 (Do nothing)**: Not applicable to sourcing
- **Scenario A (Build everything)**: A$764.4k over 3 years for the commodity layer; not preferred
- **Scenario B (Buy everything)**: A$492.7k plus Temporal Cloud fees; preferred only if those fees are under about A$120k and AWS-only memory is acceptable
- **Scenario C (Open source everything)**: A$852.7k; not preferred at base volumes
- **Scenario D (Recommended blend)**: A$612.5k (A$686.0k risk-adjusted)

**Preferred Option**: Scenario D within SOBC Option 2

### Cost Data for SOBC

**One-off setup and build for the commodity layer (Year 1)**: about A$61.3k. This is the gateway (A$23.1k), Temporal setup (A$15.4k), Neo4j setup and legal review (A$15.2k) and Transcribe integration (A$7.7k).

**Ongoing (Year 3, base)**: about A$284.0k a year, made up of platform A$98.9k, inference A$100.3k, Temporal A$36.4k, Neo4j A$25.8k, gateway maintenance A$20.0k, Transcribe A$2.5k and email A$0.1k.

**Reconciliation with the SOBC**: Infrastructure and inference in Scenario D total about A$0.35M over 3 years before contingency, inside the SOBC's A$0.62M "Cloud infrastructure and model inference" line. The remaining A$0.26M of Scenario D is labour (about 1.3 FTE-years) that must come from the SOBC team, mostly the 0.5 FTE platform and SRE role. In the requirements' growth case, inference alone (A$1.05M) exceeds the SOBC infrastructure line, so the OBC must model volume explicitly.

### Benefits for SOBC

Not quantified in this research. One commercial signal: entry-level mentoring software is listed from $299 a month (Category 2), which questions the SOBC's illustrative contract values for employer customers.

---

## Vendor Shortlist for Further Evaluation

### Top 3 Vendors/Products Recommended

#### 1. Amazon Web Services (Amazon Bedrock, Australian geo profiles) for LLM inference

**Overall Rating**: 4/5

**Strengths**:

- Australian-only routing with documented residency per model [WEB-8-C2]
- Zero data retention by default; no model-provider access to prompts [WEB-11-C1] [WEB-10-C1]
- Same supplier as the platform foundation, with Sydney prices published

**Concerns**:

- Structured outputs are limited to models nearing end of life
- 10% regional premium; US dollar pricing

**Next Steps**:

- [ ] Confirm AU geo prices and structured-output plans with the AWS account team
- [ ] Pre-certify fallback bindings

**Decision Criteria**:

- [ ] Every bound model is `au.` or in-region, never global
- [ ] Pack evaluation suites pass for each binding
- [ ] Per-turn cost measured and capped (NFR-P-006)

#### 2. Neo4j for the Graphiti graph backend

**Overall Rating**: 3.5/5 (Community, conditional); Enterprise unpriced

**Strengths**:

- Graphiti's primary backend [WEB-1-C2]
- Portable to any certified cloud

**Concerns**:

- GPL v3 needs a legal opinion [WEB-16-C1]
- Community lacks RBAC, multiple databases and online backup [WEB-24-C1]

**Next Steps**:

- [ ] Legal opinion on GPL v3
- [ ] Enterprise quote
- [ ] Acceptance gate on Neo4j (isolation, deletion probes including entity summaries)

#### 3. Temporal for durable workflow

**Overall Rating**: 4/5 (self-hosted)

**Strengths**:

- Already the TC-4 baseline; runs in every data plane, including regulated planes
- Temporal Cloud is available in Sydney [WEB-2-C1]

**Concerns**:

- Self-hosting takes about 0.15 FTE (estimate)
- Temporal Cloud is Sydney-only [WEB-2-C2] and unpriced

**Next Steps**:

- [ ] Temporal Cloud quote and data processing terms
- [ ] Client-side payload encryption design (FR-024)

---

## Risks and Mitigations

### Vendor Risks

**VR-1: Model lifecycle churn**

- **Risk**: Bound models reach end of life during the pilot (Haiku 4.5 no sooner than 2026-10-16; Sonnet 4.6 no sooner than 2027-02-17)
- **Impact**: HIGH: forced rebinding, re-evaluation, SOUP changes for any regulated release
- **Likelihood**: HIGH
- **Mitigation**: Budget two or three rebinding evaluations a year; pre-certify fallback bindings; keep every binding behind the gateway

**VR-2: Lock-in to AWS-only services**

- **Risk**: Neptune, Verified Permissions and MSK would tie projections or policy to AWS
- **Impact**: MEDIUM: the Phase 3 second cloud needs replacements
- **Likelihood**: MEDIUM
- **Mitigation**: Prefer portable components for stateful projections and policy; adapters for everything else

**VR-3: Price and exchange-rate movement**

- **Risk**: US dollar pricing plus a 10% regional premium
- **Impact**: MEDIUM (±A$32.1k over 3 years for ±10% exchange rate, base case)
- **Mitigation**: Track cost per turn (R-017); consider savings plans once usage stabilises

**VR-4: Licence constraints (TC-9)**

- **Risk**: GPL v3 (Neo4j Community) or SSPL (FalkorDB) in the data path
- **Impact**: MEDIUM
- **Mitigation**: Legal opinion before the follow-on ADR; Neptune as the fallback

### Technical Risks

**TR-1: Structured-output gaps on newer Australian-resident models**

- **Mitigation**: Bind Graphiti and extraction to models that support structured outputs; use tool use plus deterministic validation elsewhere; raise the gap with AWS

**TR-2: Graphiti backend maturity outside Neo4j**

- **Mitigation**: Choose Neo4j where licence allows; test the Neptune driver in the acceptance gate if it becomes the fallback

**TR-3: Operations capacity (R-019)**

- **Risk**: Self-hosted Temporal and Neo4j take about 0.25 FTE a year
- **Mitigation**: Consider managed equivalents for unregulated planes once priced

**TR-4: Memory ingestion cost at scale (R-017)**

- **Mitigation**: Measure in the ADR-001 acceptance gate; cap per configuration; test Haiku-class ingestion; retain only selected event types

### Compliance Risks

**CR-1: Residency drift through global profiles or excluded models**

- **Mitigation**: The gateway rejects `global.` identifiers and the Fable and Mythos models; SCPs cover only Sydney and Melbourne

**CR-2: Temporal Cloud replication outside Australia**

- **Mitigation**: Same-region replication only, if Temporal Cloud is ever used

**CR-3: Processor terms not yet confirmed (DPIA condition 5)**

- **Mitigation**: Confirm Transcribe data-use opt-out and record Bedrock terms in the processor register

---

## Next Steps and Recommendations

### Immediate Actions (0-2 weeks)

1. **Stakeholder review**: Present this draft to the ARB, with an independent reviewer because of role concentration (R-001)
2. **Legal opinion**: Neo4j Community GPL v3 for both operating models (TC-9)
3. **Quotes**: Neo4j Enterprise and Temporal Cloud (Sydney)
4. **AWS account team**: AU geo pricing and structured-output plans for the newer Claude models

### Vendor Evaluation (2-6 weeks, inside Phase 0)

5. **Follow-on ADR**: Graph database backend, using Category 7 (`/arckit:adr`)
6. **Acceptance gate**: Graphiti on the chosen backend against the null provider (ADR-001, due 2026-12-15)
7. **Device lab**: Speech engines on representative voices (R-008)
8. **Research v1.1**: Complete GAP-1 and GAP-2 (market scans) and GAP-4 (identity) before Gate 1

### Decision and Procurement (6-12 weeks)

9. **Bindings**: Certify initial model bindings and fallbacks
10. **Contracts**: Only if Neo4j Enterprise or Temporal Cloud is chosen

### Integration with Other Commands

11. **Update the business case**: Feed the cost data above into the Outline Business Case (`/arckit:sobc`)
12. **Wardley map**: `/arckit:wardley` with the positions above
13. **Statement of work**: `/arckit:sow` if specialist services (legal, device lab) are procured
14. **AWS research**: `/arckit:aws-research` to complete per-task model availability (R-009)

---

## Appendices

### Appendix A: Research Methodology

**Data Sources**: Vendor documentation and pricing pages; AWS Price List API files and AWS pricing-page data feeds for the Sydney region (two large feeds were downloaded and parsed because they exceeded the fetch size limit); GitHub repositories and issues; existing ArcKit artefacts and the agent memory technology notes.

**Evaluation Criteria**: Mandatory gates (residency, maintenance status, licence), then weighted criteria (licence, portability, isolation, operability, cost, integration maturity).

**Limitations**:

- Research stopped early because of the agent's turn budget. Categories marked Further research have no sourced vendor comparison.
- Search results that were not fetched are listed as leads only and support no claim.
- List prices only, before discounts. AU geo inference prices are derived from Anthropic's 10% regional premium statement, because the Bedrock pricing page was only partly retrieved.
- The exchange rate is an assumption.
- Model availability and lifecycle change monthly. This research should be refreshed within a month (next review 2026-11-03).

### Appendix B: Glossary

- **AU geo profile**: An Amazon Bedrock cross-region inference profile (`au.` prefix) that routes only between Sydney and Melbourne
- **CRIS**: Cross-Region inference
- **MAU**: Monthly active user
- **NCU / OCU**: Neptune Capacity Unit / OpenSearch Compute Unit
- **SOUP**: Software of unknown provenance (P9)
- **TCO**: Total cost of ownership
- **TC-9**: Cairn's licence policy for data-path components
- **ZDR**: Zero data retention

### Appendix C: Vendor Contact Information

Not collected in this version. Contacts are needed for Neo4j (Enterprise quote), Temporal (Cloud quote) and the AWS account team.

### Appendix D: Detailed Pricing Sheets

AWS Sydney (ap-southeast-2) list prices used in this document, in US dollars, as published in the source files:

| Item | Price | Publication date | Source |
|------|-------|------------------|--------|
| Neptune Serverless | US$0.1941 per NCU-hour | 2026-09-11 | [WEB-28-C1] |
| Neptune db.t4g.medium / db.r7g.large | US$0.1424 / US$0.333 per hour | 2026-09-11 | [WEB-28-C1] |
| Neptune storage / I/O | US$0.110 per GB-month / US$0.22 per million requests | 2026-09-11 | [WEB-28-C1] |
| OpenSearch Serverless indexing / search | US$0.281 per OCU-hour each | 2026-09-27 | [WEB-30-C1] |
| EKS cluster | US$0.10 per hour | 2026-09-28 | [WEB-29-C1] |
| EC2 m7g.large / m7g.xlarge / r7g.large | US$0.096 / US$0.192 / US$0.144 per hour | 2026-09-25 | [WEB-37-C1] |
| EC2 g6.xlarge / g5.xlarge | US$1.0464 / US$1.308 per hour | 2026-09-25 | [WEB-37-C1] |
| RDS PostgreSQL db.t4g.medium (Single-AZ / Multi-AZ) | US$0.102 / US$0.203 per hour | 2026-10-01 | [WEB-39-C1] |
| RDS PostgreSQL db.m7g.large (Single-AZ / Multi-AZ) | US$0.234 / US$0.468 per hour | 2026-10-01 | [WEB-39-C1] |
| RDS PostgreSQL db.r7g.large (Single-AZ / Multi-AZ) | US$0.287 / US$0.574 per hour | 2026-10-01 | [WEB-39-C1] |
| S3 Standard | US$0.025 per GB-month | Not recorded | [WEB-40-C1] |
| KMS key / requests | US$1 per key-month / US$0.03 per 10,000 | 2026-09-11 | [WEB-41-C1] |
| Secrets Manager | US$0.40 per secret-month | 2026-09-11 | [WEB-42-C1] |
| CloudWatch logs ingest / storage / metrics | US$0.67 per GB / US$0.033 per GB-month / US$0.30 per metric-month | 2026-09-22 | [WEB-43-C1] |
| Application Load Balancer | US$0.0252 per hour plus US$0.008 per LCU-hour | Not recorded | [WEB-44-C1] |
| Transcribe streaming / batch / Medical | US$0.0001667 / US$0.0001 / US$0.00125 per second | 2026-09-11 | [WEB-32-C1] |
| SES outbound (Essentials) | US$0.00016 per email | 2026-09-11 | [WEB-31-C1] |
| Cognito Essentials / Lite / Plus | US$0.015 / US$0.0055 / US$0.02 per MAU | 2026-09-25 | [WEB-45-C1] |
| Verified Permissions | US$150 per million authorisation requests (first 40 million) | 2026-09-11 | [WEB-46-C1] |
| MSK kafka.m7g.large / Serverless cluster | US$0.255 per broker-hour / US$0.9375 per cluster-hour | 2026-09-11 | [WEB-47-C1] |

### Appendix E: Open Questions

| ID | Question | Owner | Needed by |
|----|----------|-------|-----------|
| OQ-1 | Which health diary and PRO products compete with the Parkinson's pack, and what is their TGA status? | Product owner (S-18) | Gate 1 (December 2026) |
| OQ-2 | What do mentoring platforms cost at employer scale, and which host in Australia? | Commercial lead (S-13) | OBC |
| OQ-3 | What are Bedrock's published AU geo prices for each bound model, and when will newer models support structured outputs? | Architecture owner (S-10) | Before binding certification |
| OQ-4 | What does Temporal Cloud cost in Sydney, and will Temporal sign residency, no-training and encryption terms? | Architecture owner (S-10) | Before any managed-workflow decision |
| OQ-5 | Which on-device speech engine meets the word error rate target on Parkinsonian speech? | Engineering (S-12) | 2026-12-15 (R-008) |
| OQ-6 | Can Amazon Transcribe content be excluded from service improvement, and how is that recorded? | Privacy officer (S-8) | Before enabling the server path |
| OQ-7 | Which identity provider best meets the passkey, accessibility, federation and Australian hosting needs? | Architecture owner (S-10) | January 2027 |
| OQ-8 | Which open-source components (gateway translation library, policy engine, evaluation harness) pass licence and security review? | Engineering (S-12) | Phase 1 build start |
| OQ-9 | Does Neo4j AuraDB offer Australian regions, and at what tier? | Architecture owner (S-10) | Follow-on ADR |
| OQ-10 | Does Neo4j provide native encryption at rest, or is volume encryption the only control? | Engineering (S-12) | Follow-on ADR |
| OQ-11 | Which SMS and push providers meet INT-009 and APP 8, and what sender-identity rules apply in Australia? | Privacy officer (S-8) | Phase 1 |
| OQ-12 | What are the inference, graph and workflow equivalents on the Phase 3 second cloud? | Architecture owner (S-10) | Gate 4 (June 2028) |
| OQ-13 | What exchange rate should the OBC use? | Executive sponsor (S-11) | OBC |

---

**Document History**

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-10-03 | ArcKit AI | Initial draft |

## External References

> This section provides traceability from generated content back to source documents.
> Follow citation instructions in the project's citation reference guide.

### Document Register

| Doc ID | Filename | Type | Source Location | Description |
|--------|----------|------|-----------------|-------------|
| TN | 002_technotes.md | Technology Assessment | `000-global/external/` | Cairn Technology Notes — Agent Memory Options Assessment |
| WEB-1 | https://github.com/getzep/graphiti | Web URL | github.com | Graphiti repository README (licence, backends, LLM providers) |
| WEB-2 | https://docs.temporal.io/cloud/regions | Web URL | docs.temporal.io | Temporal Cloud service regions |
| WEB-3 | https://aws.amazon.com/blogs/machine-learning/introducing-amazon-bedrock-cross-region-inference-for-claude-sonnet-4-5-and-haiku-4-5-in-japan-and-australia/ | Web URL | aws.amazon.com | AWS blog: Australian geographic cross-Region inference (2025-10-31) |
| WEB-4 | https://docs.aws.amazon.com/bedrock/latest/userguide/models-region-compatibility.html | Web URL | docs.aws.amazon.com | Bedrock regional availability by model |
| WEB-5 | https://docs.aws.amazon.com/bedrock/latest/userguide/inference-profiles-support.html | Web URL | docs.aws.amazon.com | Bedrock supported inference profiles |
| WEB-6 | https://aws.amazon.com/bedrock/pricing/ | Web URL | aws.amazon.com | Bedrock pricing page (partly retrieved) |
| WEB-7 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-haiku-4-5.html | Web URL | docs.aws.amazon.com | Claude Haiku 4.5 model card |
| WEB-8 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-opus-5-5.html | Web URL | docs.aws.amazon.com | Claude Opus 5.5 model card |
| WEB-9 | https://platform.claude.com/docs/en/about-claude/pricing | Web URL | platform.claude.com | Anthropic model pricing (reached by redirect from docs.claude.com) |
| WEB-10 | https://docs.aws.amazon.com/bedrock/latest/userguide/data-protection.html | Web URL | docs.aws.amazon.com | Bedrock data protection |
| WEB-11 | https://docs.aws.amazon.com/bedrock/latest/userguide/abuse-detection.html | Web URL | docs.aws.amazon.com | Bedrock abuse detection and retention |
| WEB-12 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-sonnet-5.html | Web URL | docs.aws.amazon.com | Claude Sonnet 5 model card |
| WEB-13 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-sonnet-4-6.html | Web URL | docs.aws.amazon.com | Claude Sonnet 4.6 model card |
| WEB-14 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-opus-5.html | Web URL | docs.aws.amazon.com | Claude Opus 5 model card |
| WEB-15 | https://mentorloop.com/pricing/ | Web URL | mentorloop.com | Mentorloop pricing, hosting, certifications, integrations |
| WEB-16 | https://neo4j.com/licensing/ | Web URL | neo4j.com | Neo4j licensing index |
| WEB-17 | https://neo4j.com/pricing/ | Web URL | neo4j.com | Neo4j AuraDB pricing |
| WEB-18 | https://github.com/FalkorDB/FalkorDB | Web URL | github.com | FalkorDB repository |
| WEB-19 | https://aws.amazon.com/neptune/pricing/ | Web URL | aws.amazon.com | Amazon Neptune pricing page (US baseline) |
| WEB-20 | https://github.com/getzep/graphiti/pull/1777 | Web URL | github.com | Graphiti PR: PostGraph PostgreSQL driver |
| WEB-21 | https://github.com/getzep/graphiti/issues/1781 | Web URL | github.com | Graphiti RFC: PostgreSQL-backed graph driver |
| WEB-22 | https://github.com/uahic/graphiti-postgres | Web URL | github.com | Third-party Graphiti PostgreSQL driver |
| WEB-23 | https://github.com/kuzudb/kuzu | Web URL | github.com | Kuzu repository (archived) |
| WEB-24 | https://neo4j.com/docs/operations-manual/current/introduction/ | Web URL | neo4j.com | Neo4j edition comparison |
| WEB-25 | https://github.com/apache/age/issues/998 | Web URL | github.com | Apache AGE: support on Amazon RDS request |
| WEB-26 | https://aws.amazon.com/opensearch-service/pricing/ | Web URL | aws.amazon.com | OpenSearch Serverless pricing and minimums |
| WEB-27 | https://www.usage.ai/blogs/aws/database-savings-plans/neptune/serverless-ncu-pricing/ | Web URL | usage.ai | Neptune Serverless pricing article |
| WEB-28 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonNeptune/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: Neptune, Sydney |
| WEB-29 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonEKS/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: EKS, Sydney |
| WEB-30 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonES/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: OpenSearch, Sydney |
| WEB-31 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonSES/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: SES, Sydney |
| WEB-32 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/transcribe/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: Transcribe, Sydney |
| WEB-33 | https://instances.vantage.sh/aws/rds/db.r7g.large?region=ap-southeast-2 | Web URL | instances.vantage.sh | Instance pricing page |
| WEB-34 | https://instances.vantage.sh/aws/rds/db.t4g.medium?region=ap-southeast-2 | Web URL | instances.vantage.sh | Instance pricing page |
| WEB-35 | https://instances.vantage.sh/aws/ec2/m7g.large?region=ap-southeast-2 | Web URL | instances.vantage.sh | Instance pricing page |
| WEB-36 | https://instances.vantage.sh/aws/ec2/g6e.xlarge?region=ap-southeast-2 | Web URL | instances.vantage.sh | Instance pricing page |
| WEB-37 | https://b0.p.awsstatic.com/pricing/2.0/meteredUnitMaps/ec2/USD/current/ec2-ondemand-without-sec-sel/Asia%20Pacific%20(Sydney)/Linux/index.json | Web URL | b0.p.awsstatic.com | AWS pricing feed: EC2 Linux on-demand, Sydney |
| WEB-38 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonRDS/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: RDS, Sydney (not retrieved) |
| WEB-39 | https://b0.p.awsstatic.com/pricing/2.0/meteredUnitMaps/rds/USD/current/rds-postgresql-ondemand.json | Web URL | b0.p.awsstatic.com | AWS pricing feed: RDS PostgreSQL on-demand (downloaded and parsed) |
| WEB-40 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonS3/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: S3, Sydney |
| WEB-41 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/awskms/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: KMS, Sydney |
| WEB-42 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AWSSecretsManager/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: Secrets Manager, Sydney |
| WEB-43 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudWatch/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: CloudWatch, Sydney |
| WEB-44 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AWSELB/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: Elastic Load Balancing, Sydney |
| WEB-45 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCognito/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: Cognito, Sydney |
| WEB-46 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonVerifiedPermissions/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: Verified Permissions, Sydney |
| WEB-47 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonMSK/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: MSK, Sydney |
| WEB-48 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List offer index |
| WEB-49 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonVPC/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: VPC, Sydney |
| WEB-50 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonGrafana/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: Managed Grafana, Sydney |
| WEB-51 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonPrometheus/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: Managed Prometheus, Sydney |
| WEB-52 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonSNS/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | AWS Price List: SNS, Sydney |

### Citations

| Citation ID | Doc ID | Page/Section | Category | Quoted Passage |
|-------------|--------|--------------|----------|----------------|
| [TN-C1] | TN | Summary Assessment (table) | Risk Factor | Graphiti row: main concern "Requires graph infrastructure; surrounding user/session management remains Cairn's responsibility" |
| [TN-C2] | TN | Design Principle: Memory Is Disposable | Design Decision | "The memory system must remain a derived projection of authoritative Cairn data." |
| [TN-C3] | TN | Graphiti, Recommended Cairn boundary | Design Decision | "Graphiti should still not become the clinical or operational system of record." |
| [WEB-1-C1] | WEB-1 | README, licence | Market Evidence | "Apache-2.0 license" |
| [WEB-1-C2] | WEB-1 | README, graph backends | Market Evidence | Supported backends Neo4j 5.26, FalkorDB 1.1.2, Amazon Neptune (requires an "Amazon OpenSearch Serverless collection (serves as the full text search backend)"), Kuzu 0.11.2: "Kuzu is deprecated and will be removed in a future release — the upstream Kuzu project is no longer maintained" |
| [WEB-1-C3] | WEB-1 | README, LLM providers | Integration Requirement | "Graphiti can use any OpenAI-compatible `/v1` endpoint for LLM inference via `OpenAIGenericClient`" |
| [WEB-1-C4] | WEB-1 | README, structured output | Non-Functional Requirement | "Graphiti works best with LLM services that support Structured Output (such as OpenAI, Anthropic, and Gemini). Using other services may result in incorrect output schemas and ingestion failures." |
| [WEB-1-C5] | WEB-1 | Repository header | Market Evidence | 31.4k stars and 3.2k forks (described) |
| [WEB-2-C1] | WEB-2 | AWS regions table | Market Evidence | Sydney (`aws-ap-southeast-2`): "Same Region Replication: Available" |
| [WEB-2-C2] | WEB-2 | Asia Pacific regions | Risk Factor | Sydney is the only Australian region listed; Melbourne (ap-southeast-4) is not offered on AWS or GCP (described) |
| [WEB-3-C1] | WEB-3 | Australia CRIS | Compliance Constraint | "Requests from the Sydney Region can be automatically routed to either Sydney or Melbourne Regions" |
| [WEB-3-C2] | WEB-3 | Data residency | Compliance Constraint | "GEO CRIS is the recommended option, as it makes sure inference processing stays within the geography boundaries of the specified GEO." |
| [WEB-3-C3] | WEB-3 | Quotas | Non-Functional Requirement | "For geographic-specific CRIS, quota management is performed at the source Region level" |
| [WEB-4-C1] | WEB-4 | Anthropic table, Sydney and Melbourne rows | Market Evidence | Sonnet 5.5, Fable 5.1 and Mythos 5.1: Global only; Opus 5.5: Geo in Sydney, In-Region and Geo in Melbourne; Opus 5: Geo (described) |
| [WEB-4-C2] | WEB-4 | Amazon table, Sydney rows | Market Evidence | Titan Text Embeddings V2 In-Region in Sydney; Nova Pro, Lite and Micro In-Region and Geo in Sydney; Nova 2 Lite Global only (described) |
| [WEB-5-C1] | WEB-5 | Supported cross-Region inference profiles | Compliance Constraint | "if an inference profile is tied to a geography (such as US, EU, or APAC), its destination Region list will never change." |
| [WEB-5-C2] | WEB-5 | Note on opt-in Regions | Compliance Constraint | "your inference request can be routed to any of the destination Regions in the profile, even if you did not opt-in to such Regions in your account. Your input prompts and output results may be stored in the opt-in Regions for abuse detection purposes." |
| [WEB-5-C3] | WEB-5 | SCPs and IAM | Compliance Constraint | "If any destination Region in a cross-Region inference profile is blocked in your SCPs, the request will fail even if other Regions remain allowed." |
| [WEB-7-C1] | WEB-7 | Model details | Risk Factor | "Model launch date: Oct 16, 2025"; "EOL no sooner than: Oct 16, 2026" |
| [WEB-7-C2] | WEB-7 | Geo inference details, AU | Compliance Constraint | `au.anthropic.claude-haiku-4-5-20251001-v1:0`, source Sydney, destinations Sydney and Melbourne; in-region Melbourne on `bedrock-mantle` (described) |
| [WEB-7-C3] | WEB-7 | Features on bedrock-runtime | Market Evidence | Structured outputs and client-side tool calling listed as supported (described) |
| [WEB-7-C4] | WEB-7 | Programmatic access | Compliance Constraint | "Geo and global inference profiles can route requests outside the source Region and don't provide single-Region data residency. For single-Region inference, use the bedrock-mantle endpoint with the bare model ID." |
| [WEB-8-C1] | WEB-8 | Model details | Risk Factor | "Model launch date: September 22, 2026"; "EOL no sooner than: September 22, 2027" |
| [WEB-8-C2] | WEB-8 | Data residency | Compliance Constraint | "AU geo (`au.anthropic.claude-opus-5-5`): Keeps data within Australia regions." |
| [WEB-8-C3] | WEB-8 | Features on bedrock-runtime | Market Evidence | Structured outputs listed under Not Supported (described) |
| [WEB-8-C4] | WEB-8 | APIs supported on bedrock-runtime | Integration Requirement | Messages, Converse and Invoke supported; Responses and Chat Completions not supported (table, described) |
| [WEB-9-C1] | WEB-9 | Model pricing table | Market Evidence | Haiku 4.5 $1/$5; Sonnet 4.6 $3/$15; Sonnet 5 and 5.5 $2/$10; Opus 5 $5/$25; Opus 5.5 $4/$20; Fable 5.1 and Mythos 5.1 $10/$50 per MTok input/output (table, described) |
| [WEB-9-C2] | WEB-9 | Cloud platform pricing note | Market Evidence | "Regional and multi-region endpoints include a 10% premium over global endpoints." |
| [WEB-9-C3] | WEB-9 | Model pricing, tokenizer note | Market Evidence | "This tokenizer produces approximately 30% more tokens for the same text." |
| [WEB-9-C4] | WEB-9 | Batch processing | Market Evidence | "The Batch API allows asynchronous processing of large volumes of requests with a 50% discount on both input and output tokens." |
| [WEB-10-C1] | WEB-10 | Model Deployment Account | Security Requirement | "Because the model providers don't have access to those accounts, they don't have access to Amazon Bedrock logs or to customer prompts and completions." |
| [WEB-11-C1] | WEB-11 | Data security model | Security Requirement | "Amazon Bedrock uses a zero data retention (ZDR) data security model. This means that by default, Amazon Bedrock does not store model inputs or outputs." |
| [WEB-11-C2] | WEB-11 | Model exceptions | Compliance Constraint | "For Anthropic Claude Fable 5 and Claude Fable 5.1, all traffic will be retained for up to 30 days for automated offline abuse detection. Classifier-flagged traffic will be subject to potential human review performed by AWS." |
| [WEB-11-C3] | WEB-11 | Cross-region storage | Compliance Constraint | "If cross-region inference is enabled for these models, retained inputs and outputs are stored in destination regions" |
| [WEB-12-C1] | WEB-12 | Model details and features | Risk Factor | Launch June 30, 2026; EOL no sooner than June 30, 2027; structured outputs listed under Not Supported on bedrock-runtime (described) |
| [WEB-12-C2] | WEB-12 | Data residency | Compliance Constraint | "AU geo (`au.anthropic.claude-sonnet-5`): Keeps data within Australia regions." |
| [WEB-13-C1] | WEB-13 | Model details, features, geo details | Market Evidence | Launch Feb 17, 2026; EOL no sooner than Feb 17, 2027; structured outputs and client-side tool calling supported; AU geo destinations Sydney and Melbourne (described) |
| [WEB-14-C1] | WEB-14 | Model details, features, residency | Market Evidence | Launch July 24, 2026; EOL no sooner than July 24, 2027; structured outputs not supported on bedrock-runtime; AU geo keeps data within Australia (described) |
| [WEB-15-C1] | WEB-15 | Pricing tiers | Market Evidence | Mentorloop Pro "Starting from $299/mo"; Mentorloop Enterprise contact for pricing, with "1-1 support by mentoring experts," SSO, integrations and bespoke matching |
| [WEB-15-C2] | WEB-15 | Data and security | Market Evidence | Hosting locations: "Australia," "United Kingdom," "United States" |
| [WEB-15-C3] | WEB-15 | Certifications and integrations | Market Evidence | Cyber Essentials Certified, GDPR Compliant, ICO Registered; SSO with Microsoft Azure Active Directory and Okta; HRIS and CRM connectors for Salesforce, SAP SuccessFactors, BambooHR, Oracle (described) |
| [WEB-16-C1] | WEB-16 | Developer offerings | Procurement Constraint | "Neo4j Community Edition (GPL v3)" |
| [WEB-17-C1] | WEB-17 | AuraDB tiers | Market Evidence | Professional "$0.09/GB/hour" (minimum 1 GB); Business Critical "$0.20/GB/hour" (minimum 2 GB) with "99.95% uptime SLA"; Virtual Dedicated Cloud custom pricing |
| [WEB-17-C2] | WEB-17 | Cloud availability | Compliance Constraint | Deployment on "AWS, Azure, and Google Cloud"; Australian regions not stated on the page (described) |
| [WEB-18-C1] | WEB-18 | Licence | Procurement Constraint | "Licensed under the Server Side Public License v1 (SSPLv1)" |
| [WEB-18-C2] | WEB-18 | README examples | Security Requirement | Multiple graphs selectable per instance (for example `db.select_graph('social')`); 6.6k stars (described) |
| [WEB-19-C1] | WEB-19 | Neptune Serverless | Market Evidence | "1 NCU has approximately two GB of memory"; minimum 1 NCU starting capacity (described) |
| [WEB-20-C1] | WEB-20 | PR status | Risk Factor | Closed 2026-09-29 with "needs-rfc" and "stale" labels: "requested changes were not made within the window"; required PostgreSQL 14+ and pgvector (described) |
| [WEB-21-C1] | WEB-21 | Issue status | Risk Factor | RFC "Closed as not planned" (described) |
| [WEB-22-C1] | WEB-22 | README warning | Risk Factor | "THIS IS AN EXPERIMENTAL IMPLEMENTATION IN ALPHA VERSION. BACKUP DATA BEFORE RUNNING ANY CODE FROM THIS REPOSITORY." MIT licence; 2 stars (described) |
| [WEB-23-C1] | WEB-23 | Repository status | Risk Factor | Repository archived by the owner on October 10, 2025 and read-only; MIT licence (described) |
| [WEB-24-C1] | WEB-24 | Edition comparison table | Design Decision | Enterprise-only: "Autonomous clustering", "Online backup and restore", "Multiple databases (beyond the system and default databases)", "Role-based access control", "Property-based access control", "Sub-graph access control"; Community includes offline backup and full-text and vector indexes (described) |
| [WEB-25-C1] | WEB-25 | Issue #998 | Risk Factor | "Apache AGE is not directly supported on Amazon RDS"; open since June 18, 2023 with no response (described) |
| [WEB-26-C1] | WEB-26 | OpenSearch Serverless minimums | Market Evidence | "You will be billed at least for a minimum of 2 OCUs (1 OCU [0.5 x 2] indexing includes primary and standby, and 1 OCU [0.5 x 2] search includes one replica for HA)"; dev-test option "0.5 OCU for indexing and 0.5 OCU for search" |
| [WEB-28-C1] | WEB-28 | Sydney price list (published 2026-09-11) | Market Evidence | "$0.1941 per NCU-hr for Neptune:ServerlessUsage ... in Asia Pacific (Sydney)"; storage "$0.110 per GB / month"; "$0.22 per 1 million I/O requests"; db.t4g.medium $0.1424/hr; db.r7g.large $0.333/hr (described) |
| [WEB-29-C1] | WEB-29 | Sydney price list (published 2026-09-28) | Market Evidence | "Amazon EKS cluster usage in Asia Pacific (Sydney)" at $0.10 per hour (described) |
| [WEB-30-C1] | WEB-30 | Sydney price list (published 2026-09-27) | Market Evidence | "$0.281 per OCU-hours for IndexingOCU in Asia Pacific (Sydney)"; SearchOCU $0.281 per OCU-hour (described) |
| [WEB-31-C1] | WEB-31 | Sydney price list (published 2026-09-11) | Market Evidence | "$0.00016 per Count from 0 to 10,000,000 for Essentials-Outbound-Email in Asia Pacific (Sydney)" |
| [WEB-32-C1] | WEB-32 | Sydney price list (published 2026-09-11) | Market Evidence | "$0.0001667 per second for StreamingAudio in Asia Pacific (Sydney)"; "$0.0001 per second for TranscribeAudio in Asia Pacific (Sydney)"; "$0.00125 per seconds for MedicalTranscribeAudio" |
| [WEB-37-C1] | WEB-37 | Sydney Linux on-demand feed (2026-09-25) | Market Evidence | m7g.large 0.096; m7g.xlarge 0.192; r7g.large 0.144; c7g.large 0.0944; g6.xlarge 1.0464; g5.xlarge 1.308 USD per hour; g6e.xlarge not listed (described) |
| [WEB-39-C1] | WEB-39 | RDS PostgreSQL feed (2026-10-01), Sydney | Market Evidence | db.t4g.medium 0.102 Single-AZ / 0.203 Multi-AZ; db.m7g.large 0.234 / 0.468; db.r7g.large 0.287 / 0.574 USD per hour (described) |
| [WEB-40-C1] | WEB-40 | Sydney price list | Market Evidence | "$0.025 per GB - first 50 TB / month of storage used" |
| [WEB-41-C1] | WEB-41 | Sydney price list (2026-09-11) | Market Evidence | "$1 per customer managed KMS key version in Asia Pacific (Sydney)"; "$0.03 per 10000 KMS requests in Asia Pacific (Sydney)" |
| [WEB-42-C1] | WEB-42 | Sydney price list (2026-09-11) | Market Evidence | "$0.40 per Secret" |
| [WEB-43-C1] | WEB-43 | Sydney price list (2026-09-22) | Market Evidence | "$0.67 per GB custom log data ingested in Standard log class - Asia Pacific (Sydney)"; "$0.033 per GB-mo of log storage"; "$0.30 per metric-month for the first 10,000 metrics" |
| [WEB-44-C1] | WEB-44 | Sydney price list | Market Evidence | "$0.0252 per Application LoadBalancer-hour (or partial hour)"; "$0.008 per used Application load balancer capacity unit-hour (or partial hour)" |
| [WEB-45-C1] | WEB-45 | Sydney price list (2026-09-25) | Market Evidence | Essentials $0.015 per MAU ("Cognito Essentials ap-southeast-2 tier 1 pricing"); global free tier 0 to 10,000 MAU; Lite $0.0055; Plus $0.02 (described) |
| [WEB-46-C1] | WEB-46 | Sydney price list (2026-09-11) | Market Evidence | "150 USD per million Batch Authorization Requests for Amazon Verified Permissions in Asia Pacific (Sydney)" |
| [WEB-47-C1] | WEB-47 | Sydney price list (2026-09-11) | Market Evidence | "$0.255 per broker hour for Kafka.m7g.large in Asia Pacific (Sydney)"; "$0.9375 per cluster-hour for serverless cluster in Asia Pacific (Sydney)" |

### Unreferenced Documents

| Filename | Source Location | Reason |
|----------|-----------------|--------|
| 001_cairn_solution_design.md | `000-global/external/` | Not re-read; its content is already traced into `ARC-001-REQ-v1.1`, which this document cites by requirement ID |
| .gitkeep | `000-global/external/`, `000-global/policies/` | Placeholder files, no content |
| https://aws.amazon.com/bedrock/pricing/ (WEB-6) | aws.amazon.com | Only partly retrieved (legacy models); current-model prices taken from WEB-9 |
| https://www.usage.ai/blogs/aws/database-savings-plans/neptune/serverless-ncu-pricing/ (WEB-27) | usage.ai | No regional figures; superseded by WEB-28 |
| Vantage instance pages (WEB-33 to WEB-36) | instances.vantage.sh | Rendered only the default region, not Sydney |
| AWS Price List: RDS, Sydney (WEB-38) | pricing.us-east-1.amazonaws.com | Exceeded the fetch size limit; WEB-39 used instead |
| AWS Price List offer index (WEB-48) | pricing.us-east-1.amazonaws.com | Used only to locate offer files |
| AWS Price Lists: VPC, Managed Grafana, Managed Prometheus, SNS (WEB-49 to WEB-52) | pricing.us-east-1.amazonaws.com | Retrieved but not analysed in this version |

---

## Spawned Knowledge

The following standalone knowledge files were created or updated from this research:

### Vendor Profiles

- `vendors/amazon-web-services-profile.md` — Created
- `vendors/neo4j-profile.md` — Created
- `vendors/mentorloop-profile.md` — Created

### Tech Notes

- `tech-notes/graphiti-graph-database-backends.md` — Created
- `tech-notes/amazon-bedrock-australian-data-residency.md` — Created

---

**Generated by**: ArcKit `/arckit:research` agent
**Generated on**: 2026-10-03
**ArcKit Version**: 6.1.7
**Project**: Cairn — Longitudinal Guidance and Evidence Platform (Project 001)
**AI Model**: Claude Opus 5.5 (claude-opus-5-5[1m])
