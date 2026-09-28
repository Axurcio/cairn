**Version 0.2 · 29 September 2026 · Master platform design · Codename: Cairn**

A configurable platform for long-duration human-development and evidence-gathering journeys, with a portable long-term memory plane.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Design basis<br />
</strong>This document supersedes the Longitudinal Guidance &amp; Evidence Platform v0.1 design. It retains the Core Platform + Domain Pack architecture and adds Hindsight as the default pluggable long-term memory provider behind a Cairn-owned abstraction. Parkinson’s symptom capture and mentorship remain reference Domain Packs. Hindsight is explicitly non-authoritative: canonical journey, evidence, consent, pattern and decision state remains in Cairn.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Executive summary

Cairn supports people through journeys that unfold over weeks, months or years. Participants can talk, type, upload evidence, complete guided activities and involve trusted relationships. Cairn turns those interactions into a structured longitudinal timeline, detects patterns or gaps using versioned rules, chooses the next useful question or activity, remembers relevant context across long periods, and produces evidence-backed outputs for a human decision-maker or mentor.

The core product is deliberately not tied to Parkinson’s disease, mentoring, a specific cloud, a specific LLM, or a single memory implementation. Domain-specific meaning lives in versioned Domain Packs. Hindsight provides the default long-term semantic memory plane through a provider interface; the authoritative journey record remains Cairn’s typed PostgreSQL domain model and evidence store.

| **\#** | **Decision**        | **Choice**                                                                           | **Why**                                                                                                                            |
|--------|---------------------|--------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| 1      | Product shape       | Stable Core Platform + versioned Domain Packs                                        | Allows one product to support healthcare, mentorship and future journeys without duplicating the platform.                         |
| 2      | Decision boundary   | LLMs extract and communicate; policy/rules decide by default                         | Keeps important actions explainable, testable and stable across model changes.                                                     |
| 3      | Memory              | Canonical timeline/evidence store + pluggable Hindsight memory plane                 | Cairn remains auditable and replayable while Hindsight provides long-term conversational recall, observations and mental models.   |
| 4      | Workflow            | Temporal for durable orchestration                                                   | Long-running waits, reminders and resumable processes are first-class.                                                             |
| 5      | Data model          | Generic internal domain model; external standards via adapters                       | FHIR belongs to healthcare; HR/LMS schemas belong to mentorship; the platform core remains clean.                                  |
| 6      | Cloud               | Portable Kubernetes core with certified per-cloud deployment profiles                | A deployment can run in AWS, Azure or GCP without rewriting product logic.                                                         |
| 7      | Evidence            | Every material output claim links to source evidence and provenance                  | Reports are projections of evidence, not free-form AI opinions.                                                                    |
| 8      | Isolation           | No cross-domain inference or sharing by default                                      | Health, mentoring and other journeys remain separately governed unless an explicit policy permits linkage.                         |
| 9      | OSS memory adoption | Hindsight behind LongTermMemoryProvider; never called directly by mobile/domain code | Avoids rebuilding generic agent memory while preserving replaceability, consent enforcement and a clean system-of-record boundary. |

# 1. Product vision and scope

Cairn’s reusable product proposition is: capture a person’s experience over time, structure it into evidence, compare it with their own baseline or goals, detect meaningful patterns and gaps, ask for the next useful piece of evidence, remember relevant context across months, and prepare an evidence-backed view for the person and their trusted counterpart.

<img src="Cairn_Solution_Design_v0.2_assets/media/image1.png" style="width:6.65in;height:3.52059in" alt="Image: image1.png" />

*Figure 1 — The domain-neutral longitudinal guidance loop.*

## 1.1 Platform scope

| **Category**            | **Boundary**                                                                                                                                                                                                                                                                                                                                                                                                 |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| In scope                | Participant mobile/web experience; voice, text, video, photo and document capture; guided activities; participant profile and preferences; longitudinal journeys; evidence and provenance; versioned pattern engine; deterministic planner; Temporal workflows; trusted relationships; configurable reports; Domain Pack registry; multi-cloud deployment; integration adapters.                             |
| Out of scope by default | General-purpose autonomous agents; unrestricted medical diagnosis or treatment advice; automated employment decisions; a single global store of participant data across customers; silent cross-domain profiling; unbounded model memory; cross-cloud movement of participant data without an explicit deployment design.; semantic/agent memory as an authoritative source of truth or direct policy engine |

## 1.2 Domain responsibility

Every Domain Pack must state its intended purpose, target participants, allowed decisions, prohibited decisions, evidence model, safety boundaries, privacy classification, human roles and evaluation gates. The platform does not assume that all domains have the same regulatory or ethical profile.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Key product boundary<br />
</strong>The Core Platform supplies mechanics. The Domain Pack supplies meaning. A healthcare pack may require clinical governance and medical-device controls; a mentorship pack may require organisational privacy and power-imbalance controls. Those responsibilities must not be hidden inside generic AI prompts.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 2. Architecture principles

| **\#** | **Principle**                                                 | **In practice**                                                                                                                                                                                          |
|--------|---------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1      | Core generic, packs specific                                  | Core services understand Journey, Event, Evidence, Activity, Pattern and Report. Terms such as Symptom, Competency or ClinicalObservation belong to a Domain Pack.                                       |
| 2      | Evidence before inference                                     | Material claims and reports link to the source event, evidence and provenance that support them.                                                                                                         |
| 3      | Deterministic policy at decision boundaries                   | Safety, permissions, workflow transitions, burden limits and default planning are deterministic and versioned.                                                                                           |
| 4      | LLMs are replaceable language components                      | LLMs may extract structured candidates or phrase responses; they do not become the authoritative record.                                                                                                 |
| 5      | Authoritative memory is data; semantic memory is a projection | Journey facts live in typed records and evidence. Hindsight may learn observations or mental models from those records, but it cannot silently become the source of truth or a governed decision engine. |
| 6      | Participant agency                                            | People can inspect, correct, skip, revoke and control who receives their information.                                                                                                                    |
| 7      | Respect attention and burden                                  | Every Domain Pack defines an engagement budget so the platform does not hunt for signals or over-prompt.                                                                                                 |
| 8      | Portable core, native adapters                                | Differentiating logic is portable; storage, AI, identity and observability use cloud-specific adapters where beneficial.                                                                                 |
| 9      | Version everything                                            | Domain packs, prompts, models, rules, workflows, schemas and report templates are versioned and stamped on outputs.                                                                                      |
| 10     | Domain-specific assurance                                     | A model or rule accepted for mentoring is not automatically accepted for healthcare. Each certified configuration passes its own evaluation suite.                                                       |
| 11     | No cross-domain inference by default                          | A person may have multiple journeys, but one journey cannot silently read or infer from another pack’s data.                                                                                             |
| 12     | Accessible by default                                         | Voice-first options, plain language, large touch targets, low-friction correction and configurable interaction styles are core platform capabilities.                                                    |

# 3. Platform and Domain Pack architecture

<img src="Cairn_Solution_Design_v0.2_assets/media/image2.png" style="width:6.65in;height:3.96639in" alt="Image: image2.png" />

*Figure 2 — Stable core platform with versioned Domain Packs.*

A Journey is created for a Participant within a Tenant and is bound to one DomainPackVersion. The binding fixes the terminology, extraction schemas, rules, activities, planner policy, safety policy and report templates used by that journey. Upgrading a journey to a new pack version is an explicit, auditable operation.

## 3.1 Core platform services

| **Service boundary**               | **Responsibility**                                                                                                                                                                                                      |
|------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Participant & Relationship Service | Participants, trusted people, roles, permissions, preferences and relationship boundaries.                                                                                                                              |
| Journey Service                    | Creates and manages long-running journeys, goals, stages, coverage state and lifecycle.                                                                                                                                 |
| Conversation Service               | Voice/text turns, transcription orchestration, structured extraction and companion responses.                                                                                                                           |
| Evidence Service                   | Events, observations, files, source spans, derived features, provenance and evidence links.                                                                                                                             |
| Activity Service                   | Configurable guided tasks, forms, reflections, media captures, role-plays and assessments.                                                                                                                              |
| Pattern Engine                     | Evaluates versioned rules and validated feature algorithms over the timeline.                                                                                                                                           |
| Planner                            | Selects the next allowed question, activity or no-action using pack policy, coverage and burden budget.                                                                                                                 |
| Workflow Service                   | Temporal workflows for waits, reminders, escalation, review and multi-step activities.                                                                                                                                  |
| Report Service                     | Deterministically assembles domain-specific briefs and evidence packs.                                                                                                                                                  |
| Consent & Policy Service           | Purpose-based consent, permissions, retention, sharing and domain policy checks.                                                                                                                                        |
| Domain Pack Registry               | Stores signed pack manifests, schemas, rules, templates and certification metadata.                                                                                                                                     |
| Integration Gateway                | Adapters for cloud services and external domain systems such as FHIR, HR/LMS or CRM.                                                                                                                                    |
| Long-Term Memory Service           | Provider-neutral memory abstraction. Hindsight is the default implementation: journey-scoped banks, retain/recall, observations and mental models. All access is server-side, purpose-authorised and non-authoritative. |

The MVP does not need twelve separately deployed microservices. These are logical boundaries. A modular monolith can host most services initially, while Temporal workers, media processing and high-cost model inference can scale independently.

# 4. Logical architecture

| **Layer**                     | **Responsibilities**                                                                                                                                                                                              |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Experience layer              | React Native mobile app; responsive web/portal; voice, text, media and document capture; Activity Runner; local encrypted vault where required.                                                                   |
| AI-assisted interaction layer | Speech-to-text adapter; schema-constrained extraction; deterministic safety check; deterministic planner; companion phrasing; optional domain-approved model tools.                                               |
| Journey core                  | Journey state; timeline; evidence; coverage; pattern engine; Temporal workflows; burden budget; profile and relationship policy.                                                                                  |
| Domain Pack runtime           | Manifest, terminology, schemas, rules, activities, reports, safety policies, integration mappings and evaluation contracts.                                                                                       |
| Data and integration layer    | PostgreSQL; object storage; pgvector where justified; event bus adapter; identity; secrets/KMS; external systems.                                                                                                 |
| Output layer                  | Evidence-backed participant reports, clinician/mentor briefs, secure links, exports and domain-specific integration payloads.                                                                                     |
| Long-term memory plane        | Hindsight behind LongTermMemoryProvider; receives consented projections of confirmed content, recalls permitted context for interaction, and maintains observations/mental models without owning canonical state. |

## 4.1 One interaction turn

1\. Participant speaks, types, uploads evidence or completes an activity.

2\. Input is normalised; speech is transcribed; the participant can correct important content.

3\. The Extraction component proposes structured Events/Observations using a Domain Pack schema and source spans.

4\. Domain safety and permissions run before state-changing actions.

5\. Confirmed records are persisted with pack, prompt, model and engine provenance.

6\. Relevant pattern rules and baseline algorithms re-evaluate.

7\. The Planner chooses one allowed next action using coverage, triggers, cooldowns and the engagement budget.

8\. The Memory Service recalls relevant journey-scoped context from Hindsight after Cairn authorisation; failure or unavailability does not block the governed workflow.

9\. The Companion phrases the Planner’s selected action using canonical state plus permitted recalled context, or the turn ends with no further ask.

10\. Confirmed conversational content and selected evidence are retained asynchronously into the journey’s Hindsight bank with canonical source identifiers and Domain Pack metadata.

11\. Temporal schedules any future wait, reminder, review or dependency.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Default autonomy policy<br />
</strong>Extraction, companion phrasing and semantic memory may use LLMs. Safety, permissions, persistence, workflow transitions, report assembly and default planning remain deterministic/versioned. Hindsight observations and reflect outputs are context or candidate insight only; they do not directly change governed state.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 5. Core domain model and data contracts

The internal operational model is intentionally generic. External standards such as FHIR are projections or adapters, not the platform’s canonical storage model. Hindsight is treated the same way: its memories, observations and mental models are a non-authoritative projection over selected canonical records, with explicit source identifiers back to Cairn.

| **Entity**                            | **Purpose**                                                                                                                                                               |
|---------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Tenant                                | Customer or operating boundary that owns configuration and deployment policy.                                                                                             |
| Participant                           | Person undertaking one or more journeys.                                                                                                                                  |
| Relationship                          | Trusted counterpart such as clinician, carer, mentor, coach, teacher or reviewer.                                                                                         |
| Journey                               | Long-duration instance bound to a DomainPackVersion.                                                                                                                      |
| Goal                                  | Participant-selected or pack-defined desired outcome.                                                                                                                     |
| Event                                 | Something that happened or was reported at a point/period in time.                                                                                                        |
| Observation                           | Structured interpretation of an event, with source evidence and confidence.                                                                                               |
| Evidence                              | Verbatim text, document, image, audio/video clip, sensor sample or external record.                                                                                       |
| DerivedFeature                        | Algorithmically calculated feature from evidence; never silently promoted to a human-facing conclusion.                                                                   |
| Baseline                              | Participant-specific reference distribution, state or goal baseline.                                                                                                      |
| CoverageItem                          | Pack-defined topic/competency/domain state: not asked, absent, reported, needs detail, complete, etc.                                                                     |
| PatternDefinition / PatternEvaluation | Versioned rule plus its execution record and source inputs.                                                                                                               |
| Activity / ActivityAttempt            | Guided task and a participant’s execution/result.                                                                                                                         |
| NextAction                            | Planner output: question, activity, wait, review, share, or none.                                                                                                         |
| Report                                | Versioned evidence-backed projection assembled for a specific audience.                                                                                                   |
| ConsentGrant                          | Purpose, modality, recipient and expiry/revocation conditions.                                                                                                            |
| Provenance                            | Versions and actors that created or transformed a record.                                                                                                                 |
| DomainPackVersion                     | Immutable version of the domain configuration and assurance bundle.                                                                                                       |
| MemoryProjection                      | Reference linking a memory provider/bank item back to canonical JourneyEvent/Evidence ids, purpose, DomainPackVersion and retention state; never authoritative by itself. |

## 5.1 Example internal contracts

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th>PatientEvent / JourneyEvent<br />
{<br />
"event_id": "evt_...",<br />
"journey_id": "jrn_...",<br />
"domain_pack": "mentorship@1.2.0",<br />
"event_type": "participant_statement",<br />
"occurred_at": "...",<br />
"source": {"kind": "voice", "evidence_id": "ev_..."},<br />
"payload": {...},<br />
"provenance": {"extractor": "extract-v4", "model_binding": "..."}<br />
}<br />
<br />
DerivedFeature<br />
{<br />
"feature_id": "feat_...",<br />
"evidence_id": "ev_...",<br />
"feature_type": "speech_rate" | "goal_progress" | "arm_swing_asymmetry",<br />
"value": 0.42,<br />
"unit": "domain-defined",<br />
"algorithm_version": "...",<br />
"quality": {...}<br />
}<br />
<br />
PatternEvaluation<br />
{<br />
"pattern_id": "pat_...",<br />
"rule_version": "2.1.0",<br />
"inputs": ["obs_...", "feat_..."],<br />
"result": "triggered",<br />
"next_action_candidates": ["activity:..."],<br />
"evaluated_at": "..."<br />
}</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## 5.2 External interoperability adapters

| **Domain**              | **Adapter examples**                                                                                                                                                          |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Healthcare              | FHIR R4 / AU Core, SNOMED CT-AU, AMT and secure clinical document exchange as required by the healthcare Domain Pack.                                                         |
| Mentorship / enterprise | HRIS, LMS, competency catalogues, calendar, document systems or CRM via tenant-approved connectors. Mentoring content is not automatically written to HR performance systems. |
| Education / training    | LMS/LTI/xAPI or client-defined competency frameworks where appropriate.                                                                                                       |
| Generic                 | Webhooks, REST, event streams, secure file export and signed evidence links.                                                                                                  |

# 6. Domain Pack specification

A Domain Pack is the primary extension mechanism. It is a signed, versioned bundle stored in Git and the Domain Pack Registry. The core runtime loads it as configuration and policy rather than embedding domain logic throughout application code.

| **Pack component**     | **Contents**                                                                                                                                                            |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Manifest               | Pack id/version, intended purpose, target users, owner, reviewers, compatible core version, status and data classifications.                                            |
| Terminology / ontology | Domain concepts, synonyms, codes and relationships.                                                                                                                     |
| Extraction schemas     | Structured outputs the language model may propose, including source-span and confidence requirements.                                                                   |
| Coverage model         | What the journey seeks to understand and the allowed state of each coverage item.                                                                                       |
| Rules                  | Temporal, baseline, completeness, consistency, safety-adjacent and progress/gap rules.                                                                                  |
| Activities             | Questionnaires, reflections, media captures, exercises, assessments, role-plays and evidence requests.                                                                  |
| Planner policy         | Priorities, cooldowns, eligibility, maximum asks, allowed actions and stop conditions.                                                                                  |
| Safety policy          | Red flags, restricted behaviours, fixed messages, escalation routes and human review requirements.                                                                      |
| Interaction policy     | Tone, language, accessibility, adaptation and burden-budget rules.                                                                                                      |
| Report templates       | Sections, evidence requirements, audience, wording rules and approval steps.                                                                                            |
| Integration mappings   | FHIR mappings, HR/LMS mappings, webhooks and other domain-specific interfaces.                                                                                          |
| Evaluation suite       | Synthetic timelines, extraction labels, safety cases, report faithfulness cases and domain-specific quality gates.                                                      |
| Memory policy          | Observation mission, mental models, recall filters, retention/purpose policy, whether reflect is permitted, and tests preventing cross-domain or unsupported inference. |

## 6.1 Illustrative pack structure

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th>domain-packs/<br />
mentorship/<br />
manifest.yaml<br />
terminology.yaml<br />
schemas/<br />
observation.schema.json<br />
reflection.schema.json<br />
coverage.yaml<br />
rules/<br />
progress.yaml<br />
blockers.yaml<br />
safety.yaml<br />
activities/<br />
reflection.yaml<br />
role-play.yaml<br />
goal-review.yaml<br />
planner.yaml<br />
interaction.yaml<br />
reports/<br />
mentee-progress.yaml<br />
mentor-brief.yaml<br />
integrations/<br />
lms.yaml<br />
memory/<br />
observations.yaml<br />
mental-models.yaml<br />
recall.yaml<br />
retention.yaml<br />
evaluations/<br />
extraction.jsonl<br />
safety.jsonl<br />
timelines/</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## 6.2 Illustrative manifest

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th>id: mentorship<br />
version: 1.2.0<br />
core_compatibility: "&gt;=0.1 &lt;1.0"<br />
intended_purpose: "Support a participant and mentor to structure a long-term development journey."<br />
allowed_decisions:<br />
- ask_follow_up<br />
- suggest_activity<br />
- prepare_progress_brief<br />
prohibited_decisions:<br />
- employment_performance_rating<br />
- promotion_recommendation<br />
- mental_health_diagnosis<br />
engagement_budget:<br />
max_unsolicited_asks_per_day: 2<br />
report_templates:<br />
- mentor_brief@1<br />
safety_policy: mentorship-safety@2<br />
certification_status: pilot<br />
<br />
memory:<br />
provider: hindsight<br />
observations_mission: mentorship-observations@1<br />
mental_models:<br />
- communication_style<br />
- development_goals<br />
- recurring_blockers<br />
recall_policy: mentorship-recall@1<br />
retention_policy: mentorship-memory-retention@1<br />
allow_reflect: true</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 7. Pattern engine and planning

The Pattern Engine is a reusable rules runtime. It evaluates Domain Pack rules over a participant’s timeline, personal baseline, coverage state and goals. The engine can call validated feature algorithms, but the governing rule remains explicit and versioned.

| **Rule type**            | **Generic meaning**                                                        | **Examples**                                                                                                                         |
|--------------------------|----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Temporal                 | A topic or event repeats within a defined period.                          | Parkinson’s: right-hand shaking reported three times in 14 days. Mentorship: public-speaking concern appears three times in 30 days. |
| Change from own baseline | A validated feature shifts beyond a participant-specific threshold.        | Parkinson’s: repeated change in a guided voice feature. Mentorship: sustained drop in self-rated confidence after a role transition. |
| Coverage gap             | A relevant area has not been explored.                                     | Parkinson’s: sleep domain untouched. Mentorship: no discussion of stakeholder management for a leadership goal.                      |
| Completeness             | A reported item lacks required context.                                    | Ask for onset/frequency/side; or ask for a concrete example, impact and desired outcome.                                             |
| Consistency              | Evidence conflicts with an earlier report or another source.               | Ask the participant to clarify; do not silently reconcile.                                                                           |
| Progress / stall         | A goal has evidence of progress, regression or prolonged inactivity.       | Mentorship: goal open for 45 days with no evidence or action completion.                                                             |
| Safety adjacency         | An event may require a domain-specific safety path before normal planning. | Healthcare red flag; mentorship distress or inappropriate workplace request.                                                         |

## 7.1 Algorithm plug-ins

Rules may call approved algorithms such as rolling statistics, CUSUM, Bayesian change-point detection, trend analysis, similarity/embedding retrieval or domain-specific machine-learning models. An algorithm output is recorded as a DerivedFeature with version and quality metadata. It does not bypass the rule, planner or report policy.

## 7.2 Planner

The Planner selects a single next action, or none, from eligible actions. It uses rule triggers, coverage gaps, participant goals, engagement budget, cooldowns, journey stage, relationship permissions and activity prerequisites. The default implementation is deterministic and replayable.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th>eligible = policy.allowed_actions(journey, participant)<br />
candidates = triggers + coverage_gaps + due_workflow_actions<br />
candidates = apply_cooldowns(candidates)<br />
candidates = apply_engagement_budget(candidates)<br />
candidates = apply_safety_and_permissions(candidates)<br />
next_action = deterministic_priority(candidates) or NONE</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 8. Long-term memory plane — Hindsight

Cairn uses Hindsight as the default implementation of a pluggable LongTermMemoryProvider. Its job is to give the interaction layer durable, journey-scoped context across weeks or months without turning chat history or probabilistic synthesis into the system of record. Hindsight can retain memories, recall relevant context, consolidate observations and maintain mental models; Cairn remains authoritative for journeys, events, evidence, consent, rules, NextAction and reports.

| **Capability**            | **Use Hindsight for**                                                             | **Keep authoritative in Cairn**                                                          |
|---------------------------|-----------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Conversation continuity   | Recall prior discussions, examples, preferences and relevant temporal context.    | Conversation source records, confirmed Events/Observations and consent.                  |
| Participant understanding | Mental models such as communication style, development goals or recurring themes. | Explicit preferences, goals, relationship rights and regulated attributes.               |
| Emerging themes           | Evidence-grounded Hindsight observations that may surface repeated themes.        | PatternDefinition/PatternEvaluation and governed state transitions.                      |
| Reasoning                 | Optional reflect for non-governed assistance where the Domain Pack permits it.    | Safety, permissions, planner policy, clinical/employment decisions and report authority. |
| Retrieval                 | Semantic, keyword, graph and temporal recall over the journey memory bank.        | Canonical query APIs and evidence provenance.                                            |
| Portability               | Self-hosted memory service that follows the data plane across clouds.             | Tenant deployment policy, residency, encryption and audit.                               |

<img src="Cairn_Solution_Design_v0.2_assets/media/image4.png" style="width:7in;height:3.98001in" />

*Figure 3 — Cairn keeps Hindsight as a non-authoritative long-term memory plane.*

## 8.1 Provider boundary and failure model

Application and Domain Pack code call Cairn’s LongTermMemoryProvider interface, never the Hindsight SDK directly. The initial provider supports retain, recall, observations, mental models, delete/export and optional reflect. A NullMemoryProvider is also supported so a deployment can continue safely if semantic memory is disabled or unavailable. Memory failure must degrade personalisation, not corrupt or block the canonical journey workflow.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th>class LongTermMemoryProvider:<br />
retain(journey_id, content, source_refs, purpose, metadata)<br />
recall(journey_id, query, filters, budget)<br />
observations(journey_id, scope)<br />
mental_model(journey_id, model_id)<br />
delete(journey_id, source_refs | all)<br />
export(journey_id)<br />
<br />
# optional and pack-gated<br />
reflect(journey_id, query)</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## 8.2 Bank, purpose and consent strategy

The default isolation unit is one Hindsight bank per Tenant + Journey. A person who participates in both a health journey and a mentoring journey therefore has separate banks. Bank identifiers are derived server-side from authenticated Cairn state; they are never accepted from an untrusted mobile request. Tags may organise memories within a bank, but tags are not treated as the security boundary.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Health / mentorship isolation<br />
</strong>The Parkinson’s bank cannot be recalled by the mentorship journey and vice versa unless Cairn implements a future explicit cross-journey linkage grant. Even then, linkage would expose selected canonical records through policy-controlled projections rather than merging memory banks.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

Every retain and recall call is preceded by Cairn policy evaluation: actor, participant, journey, purpose, data class, Domain Pack and current consent. Hindsight Memory Defense/PII filtering may be enabled as defence in depth, but Cairn does not rely on it as the consent, privacy or tenancy enforcement mechanism.

## 8.3 Retain, recall, observations and mental models

| **Hindsight capability** | **Cairn usage**                                                                                                                                          | **Boundary**                                                                                                         |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| retain                   | Store a consented projection of confirmed conversation/evidence with journey_event_id, evidence_id, occurred_at, DomainPackVersion and purpose metadata. | Do not retain unconfirmed clinical facts as authoritative observations.                                              |
| recall                   | Supply relevant journey context to the Companion after the Planner has selected the governed next action.                                                | Recall may improve phrasing/context; it does not bypass policy or choose the action.                                 |
| observations             | Surface consolidated recurring themes or durable preferences with supporting memories.                                                                   | Treat as learned context/candidate insight; any governed use requires explicit pack policy and canonical provenance. |
| mental models            | Maintain inexpensive standing views such as communication style, current mentoring goals or recurring topics.                                            | Explicit participant settings and canonical goals always override inferred models.                                   |
| reflect                  | Optional deeper reasoning for non-governed tasks such as mentorship reflection summaries.                                                                | Disabled for diagnosis, urgent clinical referral, employment ratings, permissions and other prohibited decisions.    |

When Cairn deletes or revokes a source record, the Memory Service must remove the corresponding Hindsight memories and verify that derived observations/mental models no longer retain the deleted information. Whole-bank deletion is the default for journey deletion. Export/import is allowed for controlled deployment migration, subject to the same residency and authorization policy as the canonical record.

## 8.4 Domain Pack memory configuration

A Domain Pack controls what semantic memory should learn and how it may be used. Memory configuration is versioned alongside rules and prompts so a journey can be replayed against the memory policy that applied at the time.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th>memory:<br />
provider: hindsight<br />
bank_scope: tenant_journey<br />
observations_mission: mentorship-observations@1<br />
mental_models:<br />
- communication_style<br />
- development_goals<br />
- recurring_blockers<br />
recall_policy: mentorship-recall@1<br />
retention_policy: mentorship-memory-retention@1<br />
allow_reflect: true<br />
canonical_source_required: true<br />
cross_journey_recall: false</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

For the Parkinson’s pack, the observations mission should preserve explicitly reported experiences, daily-life impact and communication preferences while prohibiting diagnostic inference or severity labelling. For mentorship, it can learn durable goals, strengths, recurring blockers, achievements and communication preferences while prohibiting hidden performance ratings, mental-health inference or manager-facing profiling.

## 8.5 Deployment and adoption position

Hindsight fits Cairn’s portability strategy because it can be self-hosted with Docker/Kubernetes and PostgreSQL/pgvector and can bind to multiple LLM providers. The production recommendation is self-hosted Hindsight inside each customer data plane unless a managed offering has separately satisfied residency, contractual and assurance requirements. The evaluated release is still pre-1.0, so Cairn pins an approved version per certified deployment configuration and treats provider upgrades as evaluated changes.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Adoption decision<br />
</strong>Adopt Hindsight experimentally as Cairn’s default pluggable memory provider; do not redesign the platform around it. A short spike must validate recall quality, contradiction handling, deletion propagation, bank isolation, provenance, latency/cost and behaviour with both the mentorship and Parkinson’s reference timelines before it is promoted into the production baseline.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 9. Personalisation, tone and relationships

Personalisation is based primarily on explicit preferences and the participant’s own interaction history. Hindsight mental models may supply secondary conversational context such as preferred style or recurring topics, but explicit settings and canonical records always win. The platform adapts how it communicates without turning communication cues into ungrounded psychological or clinical labels.

| **Profile attribute**           | **Source**                                                    | **Effect**                                                                                             |
|---------------------------------|---------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| Preferred input                 | Onboarding and usage                                          | Default to voice, text, video or mixed mode.                                                           |
| Interaction length              | Explicit preference and recent behaviour                      | Adjust turn length and number of follow-ups.                                                           |
| Language / plain-language level | Onboarding                                                    | Vocabulary, pace and output rendering.                                                                 |
| Best time / cadence             | Participant choice and journey schedule                       | When optional prompts or check-ins may occur.                                                          |
| Engagement budget               | Pack default + participant preference                         | Maximum asks/activities and quiet periods.                                                             |
| Tone / register                 | Explicit request, content and own baseline                    | Formality, acknowledgement and response length; never labels an emotion as fact.                       |
| Relationship permissions        | Participant-controlled                                        | What a mentor, clinician, carer, coach or reviewer may contribute or read.                             |
| Memory-derived context          | Hindsight mental model / recall, consented and journey-scoped | Secondary phrasing/context only; never overrides explicit preference or creates a regulated attribute. |

## 9.1 Relationship model

Relationships are first-class records rather than special-case roles. A Relationship links two participants or a participant and practitioner with a role, scope, permitted domains, read/write rights and expiry. Domain Packs can add semantics such as clinician, carer, mentor, coach or teacher.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Power-imbalance control for mentorship<br />
</strong>Where an employer sponsors a mentoring programme, mentoring conversations and reflections should not automatically become performance-management data. Any sharing with HR, managers or talent systems must be explicit, purpose-bound and visible to the participant.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 10. Capture, activities and evidence

The Activity framework generalises guided Parkinson’s micro-tasks into reusable evidence-gathering activities. A Domain Pack declares the interaction, prerequisites, capture modalities, derived features, consent requirements, completion criteria and report visibility.

| **Activity type**    | **Examples**                                 | **Produces**                                                                 |
|----------------------|----------------------------------------------|------------------------------------------------------------------------------|
| Conversation         | Voice or text diary / mentoring conversation | Transcript, structured observations and source spans.                        |
| Guided media capture | Short video, audio, image or sensor task     | Raw evidence plus on-device or server-derived features where permitted.      |
| Reflection           | Prompted free text or voice                  | Structured themes, goals, examples and participant-approved summary.         |
| Questionnaire / form | Domain-defined structured questions          | Answers with explicit schema and provenance.                                 |
| Practice / role-play | Simulated conversation or scenario           | Attempt, feedback evidence and participant reflection.                       |
| Document evidence    | Upload or link artefact                      | Document metadata, extracted text, participant annotation and evidence link. |
| External evidence    | Approved connector or API                    | Imported record with source-system provenance and permission scope.          |

## 10.1 On-device first where useful

Sensitive or high-bandwidth capture can be processed on-device when that improves privacy, latency or cost. The healthcare pack may extract pose or acoustic features locally; other packs may simply upload text or documents. Each pack declares what leaves the device by default and what requires explicit consent.

# 11. Evidence-backed outputs

Reports are deterministic projections of approved structured records and linked evidence. An LLM may perform tightly constrained shortening or language adaptation, but unsupported claims are blocked and original evidence remains accessible.

| **Output**                | **Description**                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------|
| Participant summary       | Progress, timeline, open goals, selected evidence and questions the person wants to discuss. |
| Trusted-counterpart brief | Audience-specific one-page or short brief for a clinician, mentor, coach or reviewer.        |
| Evidence pack             | Selected clips, quotes, documents, activity outputs and provenance links.                    |
| Structured export         | FHIR Composition/Observation, HR/LMS payload or generic JSON depending on the Domain Pack.   |
| Secure link               | Time-bound share with access logging and optional recipient verification.                    |

## 11.1 Report generation rules

1\. Sections are assembled from structured records and evidence, not freely invented by an LLM.

2\. Every material statement carries an evidence link and Provenance record.

3\. The report distinguishes “not observed”, “not reported” and “not asked / not covered”.

4\. Pack-specific wording rules prevent interpretive language where the intended purpose does not allow it.

5\. The participant can review, correct and approve externally shared reports unless a Domain Pack explicitly defines another lawful workflow.

6\. Report, pack, rule, prompt, model and algorithm versions are stamped into the output metadata.

# 12. Reference Domain Pack A — Parkinson’s symptom capture

This pack preserves the intent of the v0.2 Parkinson’s design: a patient-held visit-preparation diary that records and organises experiences for discussion with a clinician. It does not diagnose Parkinson’s, score disease severity or recommend treatment in its initial intended purpose.

| **Pack area**      | **Parkinson’s implementation**                                                                                                                                                                                                        |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Coverage           | Motor and non-motor experience domains, contextual details, onset/frequency/side, daily-life impact and selected differentiating details.                                                                                             |
| Activities         | Voice/text diary; resting-hands capture; finger tapping; walk/turn; sustained vowel; reading; optional handwriting or wearable evidence.                                                                                              |
| Patterns           | Temporal symptom repetition, change from personal baseline, coverage gaps, incomplete context, conflicts and safety-adjacent events.                                                                                                  |
| Relationships      | Patient, carer, GP, neurologist / movement-disorder clinician.                                                                                                                                                                        |
| Reports            | One-page clinician brief plus patient-selected evidence pack and FHIR projection.                                                                                                                                                     |
| Domain adapters    | FHIR R4/AU Core, SNOMED CT-AU, AMT and secure clinical integration where required.                                                                                                                                                    |
| Safety / assurance | Clinically reviewed deterministic red-flag rules, clinical advisory group, domain-specific evaluation and regulatory intended-purpose governance.                                                                                     |
| Memory policy      | Separate journey bank. Retain confirmed patient-reported experiences and communication preferences with source IDs. Observations mission prohibits diagnosis/severity inference; reflect is not used for governed clinical decisions. |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Why this remains a Domain Pack<br />
</strong>FHIR resources, clinical instruments, motor features, clinical red flags and medical-device considerations are important for Parkinson’s, but they should not shape the generic platform model or leak into unrelated journeys.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 13. Reference Domain Pack B — Mentorship

The Mentorship pack uses the same platform mechanics to support a person and mentor over a long-duration development relationship. The goal is to improve continuity between infrequent mentoring conversations, capture concrete examples and progress, and prepare both parties for higher-value human discussions.

| **Pack area**       | **Mentorship implementation**                                                                                                                                                                                                              |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Coverage            | Goals, skills/competencies, strengths, blockers, opportunities, relationships/stakeholders, evidence of progress, agreed actions and reflection themes.                                                                                    |
| Activities          | Short reflections, goal reviews, concrete-example capture, role-play, meeting preparation, action follow-up, evidence upload and optional feedback requests.                                                                               |
| Patterns            | Repeated blocker, recurring topic, stalled goal, progress milestone, missing evidence, repeated action not completed, coverage gap or conflicting self-assessment/evidence.                                                                |
| Relationships       | Mentee, mentor, optional programme coordinator; manager/HR access is separate and off by default.                                                                                                                                          |
| Reports             | Mentee progress view, pre-session mentor brief, meeting agenda, evidence portfolio and end-of-programme participant-approved summary.                                                                                                      |
| Domain adapters     | Client competency framework, LMS, calendar, document system or CRM as approved. No automatic performance-system feed by default.                                                                                                           |
| Safety / boundaries | No mental-health diagnosis, no autonomous employment recommendation, no hidden scoring for promotion/performance, explicit handling of harassment, distress or safeguarding pathways where the programme requires them.                    |
| Memory policy       | Separate journey bank. Learn durable goals, achievements, recurring blockers and communication preferences. Reflect may support participant-facing reflection, but cannot create hidden performance ratings or employment recommendations. |

## 13.1 Example mentorship rule

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th>id: repeated_public_speaking_blocker<br />
version: 1.0.0<br />
when:<br />
topic: public_speaking<br />
mentions_gte: 3<br />
within: 30d<br />
requirements:<br />
- participant_has_goal: leadership_communication<br />
action:<br />
type: ask_for_concrete_example<br />
cooldown: 14d<br />
follow_up_activity:<br />
optional: role_play_short_update<br />
rationale: "Collect a specific example before suggesting practice."</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## 13.2 Example mentorship output

A pre-session mentor brief might show the mentee’s three selected priorities, progress against agreed goals, recent concrete examples, outstanding actions and the questions the mentee wants to discuss. It should not silently assign a performance score or speculate about personality, motivation or mental state.

# 14. Technology stack

| **Layer**                 | **Recommended choice**                                                                                                                                              |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Mobile                    | React Native + TypeScript; native modules for camera, audio, HealthKit/Health Connect or domain-specific sensors.                                                   |
| Web portals               | Next.js / React for participant, mentor/clinician and administration experiences.                                                                                   |
| API and core services     | Python + FastAPI; Pydantic schemas; SQLAlchemy.                                                                                                                     |
| Durable workflow          | Temporal; self-hosted in the deployment or managed only where residency and contractual requirements permit.                                                        |
| Operational data          | PostgreSQL with portable extensions; pgvector only where a justified retrieval use case exists.                                                                     |
| Object evidence           | Storage interface bound to S3, Azure Blob or GCS.                                                                                                                   |
| AI gateway                | Provider-neutral task API for extraction, companion phrasing, embeddings and optional domain-approved model calls.                                                  |
| Agent/state orchestration | Typed application state machine by default; LangGraph or equivalent may be used as an implementation detail, not a product dependency.                              |
| Pattern engine            | Python rules runtime; NumPy/SciPy/ruptures plus validated domain-specific algorithms.                                                                               |
| Media / speech            | Provider adapters plus self-hosted options; MediaPipe/openSMILE/Parselmouth or domain-specific components where needed.                                             |
| Identity                  | OIDC/OAuth2 in the application; Cognito, Entra External ID, Identity Platform or customer IdP adapters.                                                             |
| Observability             | OpenTelemetry; platform-neutral traces/metrics/logs; domain-sensitive content access controls.                                                                      |
| IaC                       | Terraform or OpenTofu; Helm/GitOps for the portable Kubernetes workload.                                                                                            |
| Long-term memory          | LongTermMemoryProvider abstraction; Hindsight OSS default implementation, self-hosted in the data plane; PostgreSQL + pgvector; optional Null/alternative provider. |

# 15. Multi-cloud deployment model

<img src="Cairn_Solution_Design_v0.2_assets/media/image3.png" style="width:6.65in;height:3.85768in" alt="Image: image3.png" />

*Figure 4 — Certified per-cloud data planes with a portable runtime.*

Multi-cloud means the same product can be deployed into different clouds, not that one participant’s active data path is spread across providers. Each deployment selects a certified combination of cloud, regions, model bindings, speech engines, storage and external integrations.

| **Capability**        | **AWS profile**                                   | **Azure profile**                                         | **GCP profile**                                          |
|-----------------------|---------------------------------------------------|-----------------------------------------------------------|----------------------------------------------------------|
| Kubernetes            | EKS                                               | AKS                                                       | GKE                                                      |
| PostgreSQL            | Aurora PostgreSQL / RDS                           | Azure Database for PostgreSQL                             | Cloud SQL / AlloyDB                                      |
| Object storage        | S3                                                | Blob Storage                                              | GCS                                                      |
| Keys / secrets        | KMS / Secrets Manager                             | Key Vault                                                 | Cloud KMS / Secret Manager                               |
| Identity              | Cognito / customer IdP                            | Entra External ID / customer IdP                          | Identity Platform / customer IdP                         |
| AI adapter            | Bedrock and/or in-cluster models                  | Azure AI Foundry / Azure OpenAI and/or in-cluster         | Vertex AI and/or in-cluster                              |
| Observability backend | CloudWatch / third party                          | Azure Monitor / third party                               | Cloud Operations / third party                           |
| Long-term memory      | Hindsight on EKS + Aurora/RDS PostgreSQL/pgvector | Hindsight on AKS + Azure Database for PostgreSQL/pgvector | Hindsight on GKE + Cloud SQL/AlloyDB PostgreSQL/pgvector |

## 15.1 Certified configurations

The platform should support a small named set of certified configurations rather than promising “any cloud, any model”. A configuration records cloud, region policy, model binding, speech engine, Hindsight version/embedding and retrieval configuration, Domain Pack versions, platform release and evaluation evidence. Promotion to production requires the relevant pack and memory tests to pass against that exact configuration.

## 15.2 Control plane and data plane

A lightweight control plane may hold tenant metadata, pack catalogue information, deployment versions and licensing. Participant content, evidence and model prompts remain in the tenant data plane by default. This lets organisations operate their data plane in the cloud and region that meets their governance requirements. Hindsight runs inside the participant data plane and is not a global cross-tenant memory service.

# 16. AWS reference deployment profile

AWS remains a practical reference profile for the initial client environment, but it is an adapter set rather than the product architecture.

| **Component**    | **AWS mapping**                                                                                                                                                                                |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Compute          | EKS for portable services and workers; ECS/Fargate may be used for selected stateless services if the portability contract is preserved.                                                       |
| Data             | Aurora PostgreSQL or RDS PostgreSQL; S3 for evidence; KMS keys by data class/tenant policy.                                                                                                    |
| Workflow         | Temporal cluster in EKS or an approved managed Temporal deployment.                                                                                                                            |
| Events           | EventBridge/SQS behind an internal event abstraction where event-driven integration is required.                                                                                               |
| AI               | Bedrock adapter and/or in-cluster model serving; exact model bindings are deployment configuration, not application code.                                                                      |
| Speech           | Self-hosted or Transcribe adapter based on Domain Pack validation and residency requirements.                                                                                                  |
| Identity         | Cognito or enterprise/customer IdP through OIDC.                                                                                                                                               |
| Security         | Private endpoints where appropriate, GuardDuty/Security Hub/Config, central audit and customer-managed keys.                                                                                   |
| Observability    | OpenTelemetry exported to CloudWatch, Grafana, Datadog or client-approved platform.                                                                                                            |
| Long-term memory | Hindsight on EKS using Aurora/RDS PostgreSQL with pgvector; bank per tenant+journey; service-to-service access only; Bedrock/in-cluster model binding configured through the approved profile. |

# 17. Security, privacy, consent and isolation

Privacy and consent are executable platform data. Every read, write, model call, memory retain/recall, evidence share and external integration checks current purpose and authorization. Semantic memory inherits the sensitivity of its source and never weakens the policy that protects canonical records.

| **Data class**                    | **Examples**                                                      | **Core controls**                                                                                                            |
|-----------------------------------|-------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| Highly sensitive / regulated      | Health data, biometric media/features, safeguarding data          | Explicit purpose, encryption, shortest practical retention, narrow access, domain-specific regulatory controls.              |
| Confidential personal development | Mentoring reflections, feedback, career goals, uploaded artefacts | Participant-controlled sharing, no hidden manager/HR access, tenant isolation, retention policy.                             |
| Operational                       | Technical telemetry without content                               | Standard security controls; avoid free text or identifiers unless needed for incident investigation.                         |
| Model interaction                 | Prompts, transcripts, model outputs                               | Treat as the same sensitivity as source data; provider/data-residency policy; content logging off or restricted as required. |

## 17.1 Security controls

- Encryption in transit and at rest; tenant/data-class key strategy where justified.

- Least privilege and purpose-scoped access; break-glass access for exceptional support with full audit.

- Signed Domain Packs and deployment artefacts; supply-chain scanning and provenance.

- Prompt injection defence: participant content is data, outputs are schema-validated, and model tools expose only bounded capabilities.

- No model can alter permissions, consent, sharing policy or deployment configuration.

- Per-domain retention and deletion workflows, including object storage and backup expiry behaviour.

- Separate secrets, storage prefixes/databases or stronger tenancy boundaries according to client risk profile.

- Mobile secure storage, platform attestation where appropriate, and remote-session revocation.

- Memory-bank identifiers are derived from authenticated server state; client-supplied bank identifiers are rejected. CI includes store-as-A/read-as-B leakage tests.

- Hindsight Memory Defense/PII redaction is defence in depth only; Cairn consent, authorization, data classification and retention remain the control plane for personal information.

- No direct mobile/web access to Hindsight. Calls originate from the Cairn Memory Service using service identity and purpose-scoped policy.

## 17.2 Cross-domain isolation

A participant may have multiple journeys—for example a health journey and a mentoring journey—but a Domain Pack can only read its own journey data unless an explicit, participant-visible linkage policy grants a defined field or evidence set. The default is zero cross-domain access. The same rule applies to semantic memory: each journey gets a separate Hindsight bank by default, and recall never crosses banks merely because two journeys belong to the same person.

# 18. Evaluation, quality and governance

Platform quality is evaluated at two levels: common platform gates and Domain Pack gates. A model, rule, activity or report template change is treated like code and can trigger re-evaluation.

| **Area**                 | **Measure**                                                                                                                                     | **Release gate**                                                                                                                                                        |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Evidence faithfulness    | Share of report statements supported by accessible source evidence                                                                              | 100% material-claim evidence coverage; no unsupported claims in reviewed sample.                                                                                        |
| Extraction               | Precision/recall of pack-defined structured entities/observations                                                                               | Per-schema threshold and no unacceptable regression.                                                                                                                    |
| Safety policy            | Recall on curated red-flag/restricted-behaviour scenarios                                                                                       | Any critical miss blocks release for that pack.                                                                                                                         |
| Planner determinism      | Replay gives the same eligible/selected action for the same inputs/version                                                                      | 100% deterministic replay for deterministic planner paths.                                                                                                              |
| Burden / engagement      | Asks, activity frequency, opt-out rate and quiet-period adherence                                                                               | Within pack budget for every test persona.                                                                                                                              |
| Tone / usability         | Rubric from representative users and domain reviewers                                                                                           | No regression against accepted release.                                                                                                                                 |
| Fairness / accessibility | Above measures across relevant demographic, language, accessibility or domain cohorts                                                           | No cohort below pack-defined threshold.                                                                                                                                 |
| Adversarial              | Prompt injection, attempts to change permissions, requests outside intended purpose                                                             | No permission escalation and no prohibited decisions/actions.                                                                                                           |
| Workflow durability      | Crash/retry/replay tests across long waits and external failures                                                                                | No lost state; idempotent effects; audit trail preserved.                                                                                                               |
| Long-term memory         | Recall relevance/grounding, bank isolation, contradiction handling, deletion propagation, provenance/source resolution and failure degradation. | No cross-bank leakage; deleted sources are absent from recall/derived views; recalled claims resolve to canonical sources where required; quality meets pack threshold. |

## 18.1 Domain Pack lifecycle

| **Status** | **Meaning**                                                                      |
|------------|----------------------------------------------------------------------------------|
| Draft      | Pack can run in development; owner and intended purpose defined.                 |
| Reviewed   | Domain reviewers approve terminology, rules, safety policy and evaluation cases. |
| Pilot      | Limited real users; enhanced monitoring and human review.                        |
| Certified  | Approved for named deployment configurations and use cases.                      |
| Deprecated | No new journeys; existing journeys have migration or completion path.            |
| Retired    | Runtime blocks new use; artefacts retained for audit/replay according to policy. |

# 19. Delivery roadmap

The recommended delivery approach avoids building an abstract framework in isolation. The platform contract should be proven against two materially different Domain Packs—Parkinson’s symptom capture and mentorship—so generic boundaries are discovered through real requirements.

| **Phase**                                         | **Scope**                                                                                                                                                                                                                                                                                                          | **Exit gate**                                                                                                                                                               |
|---------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Phase 0 — Platform/domain discovery               | Confirm operating model, intended purposes, buyer/tenant model, pack contract, data classifications, workflow boundaries, cloud constraints and evaluation ownership. Run a 2–3 day Hindsight spike covering synthetic mentorship and Parkinson’s timelines, bank isolation, deletion, provenance and portability. | Gate: Core vs Domain Pack boundary approved; both reference packs can be expressed without core-specific hacks. Hindsight adoption criteria and provider boundary approved. |
| Phase 1 — Core platform + Parkinson’s pilot       | Build identity, journey/timeline/evidence, conversation, rules, planner, Temporal, report engine, Long-Term Memory Service/Hindsight and first deployment profile; implement Parkinson’s pack.                                                                                                                     | Gate: pilot safety/clinical review and platform replay/evidence tests pass.                                                                                                 |
| Phase 2 — Mentorship pack as abstraction proof    | Implement goals, competencies, reflection activities, mentor relationship permissions, progress brief and client-defined integrations.                                                                                                                                                                             | Gate: mentorship ships without changing core domain semantics for healthcare-specific concepts.                                                                             |
| Phase 3 — Second cloud + certified configurations | Deploy the same core and packs to the second cloud; run pack evaluation suites against new model/speech bindings.                                                                                                                                                                                                  | Gate: configuration certified; no cross-cloud product fork.                                                                                                                 |
| Phase 4 — Platform productisation                 | Pack authoring tooling, tenant configuration, pack marketplace/catalogue controls, migration tooling and wider domain onboarding.                                                                                                                                                                                  | Gate: a third domain can be created primarily as pack/configuration plus bounded extensions.                                                                                |

# 20. Risks and mitigations

| **Risk**                                       | **Consequence**                                                                            | **Mitigation**                                                                                                                                   |
|------------------------------------------------|--------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Premature abstraction                          | Core becomes complicated before a second domain proves it.                                 | Use Parkinson’s + mentorship as reference packs; require a concrete second-domain need before adding a new generic primitive.                    |
| Domain leakage into core                       | FHIR, symptoms or clinical rules reappear as platform entities.                            | Architecture review rejects domain terms in core contracts; use adapter/pack boundaries.                                                         |
| Over-generic pack DSL                          | Configuration becomes a programming language that is hard to test.                         | Keep pack DSL declarative; allow bounded extension services when domain logic genuinely requires code.                                           |
| Cross-domain privacy leak                      | Health or mentoring evidence is used in another journey without awareness.                 | Journey-scoped authorization, zero cross-domain access by default, explicit linkage grants and audit.                                            |
| Rule explosion                                 | Hundreds of overlapping rules become hard to reason about.                                 | Rule ownership, priority/cooldown conventions, dependency graph, synthetic-timeline regression suite.                                            |
| Model variance across clouds                   | The same prompt behaves differently across certified configurations.                       | Task-level AI gateway, structured schemas, pack evaluation suite and configuration-specific certification.                                       |
| Long-running workflow bugs                     | Months-long journeys accumulate retries or stale state.                                    | Temporal, idempotent activities, workflow versioning, replay tests and operational tooling.                                                      |
| Mentorship used for hidden performance scoring | Damages trust and creates employment/privacy risk.                                         | Explicit prohibited decision in pack; no HR sharing by default; participant-visible permissions.                                                 |
| Clinical pack drifts into diagnosis            | Regulatory position changes unexpectedly.                                                  | Intended-purpose gate on features, copy, reports and model behaviour; clinical/regulatory review.                                                |
| Configuration explosion                        | Too many cloud/model/pack combinations to assure.                                          | Small set of named certified configurations; compatibility matrix and deprecation policy.                                                        |
| Semantic memory becomes a second truth         | Probabilistic synthesis conflicts with confirmed evidence or drives unsupported actions.   | Canonical Cairn records always win; memory is projection/context only; source IDs and pack policy gate any candidate insight.                    |
| Hindsight pre-1.0/API behaviour changes        | Upgrade instability or unexpected memory/retrieval behaviour across certified deployments. | Pin approved versions, run memory evaluation suite on upgrades, isolate through LongTermMemoryProvider, maintain Null/alternative provider path. |

# 21. Open questions and architecture decisions

## 21.1 Open questions for discovery

- [ ] Who is the platform buyer/operator: direct-to-consumer, service provider, enterprise, health service, or a mixture?

- [ ] Will tenants normally deploy into their own cloud account/subscription/project, or into a vendor-operated regional environment?

- [ ] Is the first commercial product still Parkinson’s, or should mentorship be built in parallel as the abstraction proof?

- [ ] Who is allowed to author and certify Domain Packs: internal product team only, selected partners, or tenant administrators?

- [ ] What is the maximum allowed AI autonomy per domain and which actions always require deterministic policy or human approval?

- [ ] Can a participant intentionally link journeys across domains, and if so what granular consent model is required?

- [ ] Which second cloud must be certified after AWS?

- [ ] Which external systems are mandatory for the mentorship pack: LMS, HRIS, calendar, documents, CRM or none for v1?

- [ ] What data residency, retention and audit requirements apply to each initial buyer segment?

- [ ] What evidence is needed to declare a Domain Pack “certified” and who signs that decision?

- [ ] Must Hindsight be self-hosted for every regulated/customer deployment, or can Hindsight Cloud be certified for selected low-risk tenants?

- [ ] Which memory-derived signals, if any, may be promoted into canonical CandidateInsight records for specific Domain Packs, and what confirmation is required?

## 21.2 Architecture Decision Records

| **ADR** | **Decision**                                             | **Status** | **Rationale**                                                                                                                        |
|---------|----------------------------------------------------------|------------|--------------------------------------------------------------------------------------------------------------------------------------|
| ADR-001 | Core Platform + Domain Packs                             | Accepted   | Domain-specific semantics and policy live in immutable versioned packs.                                                              |
| ADR-002 | Deterministic policy at decision boundaries              | Accepted   | Safety, permissions, default planning and state transitions are replayable.                                                          |
| ADR-003 | Temporal for durable workflows                           | Accepted   | Months-long journeys need resumability, waits, retries and workflow versioning.                                                      |
| ADR-004 | Generic internal data model; standards via adapters      | Accepted   | FHIR/HR/LMS schemas do not become the core platform model.                                                                           |
| ADR-005 | One cloud data path per deployment                       | Accepted   | Avoid cross-cloud participant-data paths; multi-cloud is deployment portability.                                                     |
| ADR-006 | Provider-neutral AI task gateway                         | Accepted   | Agents/services call task APIs, not vendor SDKs directly.                                                                            |
| ADR-007 | Reports are evidence projections                         | Accepted   | Deterministic assembly, provenance and source links; no free-form authoritative AI report.                                           |
| ADR-008 | Certified Domain Pack + deployment configurations        | Accepted   | Quality evidence applies to a named combination of pack/platform/cloud/model bindings.                                               |
| ADR-009 | No cross-domain access by default                        | Accepted   | Journey/pack authorization prevents silent profiling across domains.                                                                 |
| ADR-010 | Logical services, modular monolith first                 | Accepted   | Preserve boundaries without unnecessary distributed-system overhead in the MVP.                                                      |
| ADR-011 | Hindsight as default pluggable long-term memory provider | Accepted   | Avoid rebuilding generic agent memory; integrate behind a Cairn-owned provider interface and certify/pin approved versions.          |
| ADR-012 | Semantic memory is a non-authoritative projection        | Accepted   | Journey/evidence/consent/pattern/decision state remains canonical in Cairn; Hindsight context cannot silently mutate governed state. |

# Appendix A — Core versus Domain Pack responsibility matrix

| **Core capability**                                          | **Owner** | **Domain-specific configuration**                                                   | **Owner** |
|--------------------------------------------------------------|-----------|-------------------------------------------------------------------------------------|-----------|
| Identity, tenant, participant, relationship mechanics        | Core      | Role semantics and permitted relationship scopes                                    | Pack      |
| Journey lifecycle and Temporal orchestration                 | Core      | Journey stages and domain milestones                                                | Pack      |
| Event/evidence/provenance storage                            | Core      | Event types, schemas and terminology                                                | Pack      |
| Pattern-rule runtime                                         | Core      | Pattern definitions, thresholds and owners                                          | Pack      |
| Planner algorithm / burden enforcement                       | Core      | Priorities, cooldowns and allowed actions                                           | Pack      |
| Activity runner                                              | Core      | Activity definitions and derived feature plug-ins                                   | Pack      |
| Report rendering / secure sharing                            | Core      | Report sections, wording policy and evidence rules                                  | Pack      |
| AI gateway / structured output validation                    | Core      | Extraction schemas, prompts and model acceptance tests                              | Pack      |
| Consent / authorization engine                               | Core      | Purpose taxonomy and domain-specific sharing policy                                 | Pack      |
| Observability / audit / deployment                           | Core      | Domain-specific review dashboards and gates                                         | Pack      |
| Long-term memory provider, bank isolation and source mapping | Core      | Observation mission, mental models, recall/retention policy and reflect permissions | Pack      |

# Appendix B — Definition of done for a new Domain Pack

- Intended purpose, target population and prohibited decisions approved.

- Terminology, extraction schemas and coverage model versioned.

- Rules, planner policy, engagement budget and safety policy have named owners.

- Activities and derived-feature algorithms have defined consent and quality requirements.

- Report templates specify evidence requirements and human approval behaviour.

- Integration mappings are optional and do not bypass core authorization/provenance.

- Synthetic timelines and labelled evaluation data cover normal, edge and adversarial cases.

- Pack can replay deterministically for all deterministic paths.

- Pack is certified against at least one named deployment configuration.

- Migration/deprecation behaviour is defined before the pack reaches Certified status.

- Memory policy defines observation mission, mental models, recall filters, retention/deletion behaviour and whether reflect is permitted.

- Cross-bank leakage, deletion propagation, provenance resolution and memory-failure degradation tests pass for the pack.

# Appendix C — Hindsight adoption decision

Cairn adopts Hindsight as the default candidate long-term memory provider because its bank model, temporal/semantic recall, evidence-backed observations, mental models, self-hosting model and PostgreSQL foundation align closely with Cairn’s journey and multi-cloud architecture. The integration remains intentionally replaceable.

| **Assessment area**  | **Position**                    | **Required Cairn control**                                                                                |
|----------------------|---------------------------------|-----------------------------------------------------------------------------------------------------------|
| Long-duration memory | Strong fit                      | Use one bank per tenant+journey and retain canonical source identifiers.                                  |
| Mentorship           | Strong fit                      | Allow observations/mental models for goals, examples and recurring blockers; preserve participant agency. |
| Healthcare           | Useful but constrained          | No Hindsight memory becomes a clinical fact merely because it was extracted or consolidated.              |
| Multi-cloud          | Strong fit                      | Self-host in EKS/AKS/GKE; pin a certified Hindsight/version/model configuration.                          |
| Security/privacy     | Supplemental controls available | Cairn remains responsible for auth, consent, purpose limitation, deletion and cross-domain isolation.     |
| Maturity             | Active but pre-1.0              | Run spike + regression suite; isolate SDK/API changes behind LongTermMemoryProvider.                      |

## C.1 Production adoption spike

- Mentorship: load approximately three months of synthetic conversations and verify recall of goals, achievements, examples, blocker evolution and changed preferences.

- Parkinson’s: load a synthetic patient timeline and verify that recall preserves source context without turning Hindsight observations into canonical clinical observations.

- Isolation: store as journey A and attempt recall as journey B across tenants and domains; any leak blocks adoption.

- Deletion: delete/revoke selected source evidence and verify raw memories, derived observations/mental models and recall no longer expose the information.

- Provenance: every memory used in a governed user experience resolves to canonical source identifiers where the Domain Pack requires evidence.

- Operations: benchmark retain/recall latency, token/model cost, background consolidation, backup/restore and blue-green migration between instances.

- Failure: prove that Hindsight outage or degraded retrieval falls back safely without blocking deterministic policy/workflow processing.

## C.2 Technology references

- Hindsight repository: https://github.com/vectorize-io/hindsight

- Hindsight documentation: https://hindsight.vectorize.io/

- Release evaluated for this design: Hindsight v0.10.1 (released 21 September 2026): https://github.com/vectorize-io/hindsight/releases/tag/v0.10.1

- Licence: MIT — https://github.com/vectorize-io/hindsight/blob/main/LICENSE

- Key capabilities considered: banks, retain/recall/reflect, observations, mental models, Kubernetes/Helm deployment, PostgreSQL/pgvector, bank transfer/export-import, provider integrations and Memory Defense.
