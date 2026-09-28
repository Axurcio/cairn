# Cairn Technology Notes — Agent Memory Options Assessment

## Purpose

This note assesses open-source agent-memory technologies from the **Awesome Agent Memory** catalogue for use in **Cairn**, a configurable platform for long-duration human-development and evidence-gathering journeys.

The focus is not generic popularity. The assessment is based on Cairn's architectural needs:

- long-running participant journeys
- evolving personal context over months or years
- temporal reasoning
- evidence provenance and traceability
- explicit relationship modelling
- strong tenant and journey isolation
- healthcare and mentorship Domain Packs
- cloud portability
- replaceable infrastructure components
- preservation of a deterministic canonical system of record
- ability to rebuild derived memory from authoritative Cairn events

The leading candidates are:

1. Graphiti
2. Hindsight
3. Mem0
4. Cognee
5. MemMachine

---

# Summary Assessment

| Technology | Cairn fit | Main strength | Main concern |
|---|---:|---|---|
| **Graphiti** | **9/10** | Temporal facts, provenance, evolving relationships, custom ontology | Requires graph infrastructure; surrounding user/session management remains Cairn's responsibility |
| **Hindsight** | **8.5/10** | Strong conversational memory, observations, mental models and memory isolation | Learned observations remain probabilistic memory rather than domain truth |
| **Mem0** | **8/10** | Simple, mature, production-oriented memory layer | Less explicit evidence lineage and ontology; some strongest optimisations are managed-service specific |
| **Cognee** | **7.5/10** | Strong graph, ontology and multimodal knowledge architecture | OSS/production boundary requires clarification; more infrastructure complexity |
| **MemMachine** | **7/10** | Clean working / episodic / profile memory model | Younger ecosystem and less evidence/provenance machinery |
| OpenViking | 6.5/10 | Inspectable filesystem-style context and memory | AGPL; broader agent-context focus than Cairn requires |
| Honcho | 6.5/10 | Strong user-modelling orientation | AGPL; less suited to governed clinical evidence |
| Letta | 6/10 | Powerful stateful-agent runtime | Too opinionated and overlaps Cairn's planner/workflow architecture |
| Memobase | 5.5/10 | Profile-oriented user memory | Narrower scope and less compelling for Cairn's temporal evidence model |

---

# Graphiti

## Why Graphiti is a serious contender

Graphiti is the strongest challenger to Hindsight because its native model is unusually close to Cairn's longitudinal domain model.

Graphiti focuses on:

- entities
- relationships
- facts
- episodes
- temporal validity
- historical truth
- source provenance
- developer-defined ontologies

A Graphiti fact can represent not just what is true, but **when it became true, when it stopped being true, and which source episode produced it**.

That directly supports one of Cairn's core concerns:

> Understanding how a person's goals, observations, relationships and evidence evolve over time.

## Cairn mapping

A generic Cairn journey could map to a temporal graph such as:

```text
Participant
   |
   +-- hasGoal ----------> Goal
   |
   +-- reported ---------> Observation
   |
   +-- completed --------> Activity
   |
   +-- provided ---------> Evidence
   |
   +-- hasRelationship --> Mentor / Carer
```

Temporal evolution becomes explicit:

```text
Goal:
"Gain more leadership experience"

valid_from: 2026-02
valid_until: 2026-08

        ↓

Goal:
"Lead an architecture team"

valid_from: 2026-08
```

For a Parkinson's Domain Pack:

```text
Participant
    |
    +-- reported --> Hand shaking
    |                  |
    |                  +-- side: right
    |                  +-- context: rest
    |                  +-- source: Episode 193
    |
    +-- captured --> Guided video
```

## Why this matters

Graphiti's model makes three things first-class:

- **time**
- **relationships**
- **provenance**

Those are central to Cairn.

## Recommended Cairn boundary

Graphiti should still not become the clinical or operational system of record.

The better architecture is:

```text
PostgreSQL
    authoritative events
          |
          v
     Event stream
          |
          v
       Graphiti
          |
   temporal semantic
      projection
          |
          v
     AI context
```

The canonical Cairn event store remains authoritative. Graphiti is a **derived semantic projection**.

---

# Hindsight

## Strengths

Hindsight remains an excellent fit when the goal is a pure long-term AI memory layer.

Its useful concepts include:

- retain
- recall
- reflect
- memory banks
- observations
- mental models
- temporal retrieval
- knowledge pages
- evidence-backed consolidated observations

Hindsight is particularly strong at maintaining an **evolving understanding of a participant**.

For example:

```text
"What communication style works best for this participant?"

"What recurring blockers have they described?"

"What topics keep returning?"

"What has changed in their preferences?"
```

That is particularly valuable for mentorship.

## Where Hindsight fits best

Hindsight is strongest if Cairn preserves the boundary:

```text
Cairn PostgreSQL
        =
what actually happened

Hindsight
        =
what the AI should remember
```

Its Mental Models and consolidated Observations are a strong fit for:

- goals
- communication preferences
- recurring blockers
- strengths
- progress
- conversational themes

## Main caveat

A Hindsight observation is still probabilistic, synthesized memory.

It must not silently become authoritative participant state.

For Cairn:

```text
Hindsight memory
    !=
canonical Observation
```

This is particularly important in health-related Domain Packs.

---

# Hindsight vs Graphiti

The architectural choice is fundamentally this:

## Option A — Hindsight-centric memory plane

```text
PostgreSQL
    authoritative state
        |
        +--> Hindsight
             conversational memory
             observations
             mental models
```

Advantages:

- strong personal memory
- strong conversational continuity
- simple mental-model abstraction
- good fit for mentorship

## Option B — Graphiti semantic projection

```text
PostgreSQL
    authoritative events
        |
        +--> Graphiti
             temporal semantic graph
             provenance
             relationships
             historical facts
```

Advantages:

- stronger temporal semantics
- stronger provenance
- explicit relationships
- better ontology support
- natural fit for evidence-oriented Domain Packs

## Likely result

For the **Mentorship Domain Pack**, Hindsight may be stronger.

For the **Parkinson's Domain Pack**, Graphiti may be stronger.

Because Cairn must support both, both deserve evaluation before committing.

---

# Mem0

Mem0 is the strongest "keep it simple" alternative.

Its strengths include:

- user/session/agent memory
- temporal reasoning
- semantic retrieval
- keyword retrieval
- entity-aware retrieval
- self-hosting
- production-oriented APIs
- large community
- Apache 2.0 licensing

A Cairn integration could be very simple:

```text
Cairn Core
     |
     v
   Mem0

user_id
journey_id
agent_id

add()
search()
```

## Why it is not currently first choice

Cairn's differentiator is not just personalization.

The platform depends on:

```text
time
+
relationships
+
evidence
+
patterns
+
evolving personal state
```

Hindsight and Graphiti model these concepts more naturally.

Another consideration is that some of Mem0's strongest published benchmark improvements are associated with its managed platform and are not necessarily identical to open-source self-hosted performance.

This should be tested empirically.

---

# Cognee

Cognee is technically interesting because it supports:

- documents
- conversations
- entities
- relationships
- custom ontologies
- graph retrieval
- vector retrieval
- session memory
- `remember()`
- `recall()`
- `improve()`
- `forget()`

It maps well to Cairn's Domain Pack concept.

For example:

```text
Parkinson's ontology

Participant
Symptom
Observation
Evidence
Medication
Carer
Capture
```

and:

```text
Mentorship ontology

Mentee
Mentor
Goal
Competency
Reflection
Achievement
Feedback
```

## Concern

The current OSS/production boundary needs careful review.

Cognee can demonstrate graph, vector and relational memory in PostgreSQL, but some production-ready graph capability appears to sit behind a licensed offering.

Before using Cognee as a strategic dependency, Cairn would need clarity on:

- production licensing
- self-hosted graph deployment
- multi-cloud portability
- operational support boundaries

---

# MemMachine

MemMachine has a conceptually clean memory model:

```text
Working Memory
Episodic Memory
Profile Memory
```

That maps naturally to Cairn.

```text
Working memory
    current interaction

Episodic memory
    journey experiences

Profile memory
    durable participant facts
```

Strengths:

- self-hostable
- LLM-provider agnostic
- Apache 2.0
- graph-based episodic memory
- SQL-backed user profiles
- MCP support

## Why it remains behind Graphiti and Hindsight

The project is younger and currently appears to provide less depth around:

- provenance
- temporal truth
- observation evolution
- evidence-grounded derived knowledge
- long-lived synthesized participant models

It is worth monitoring.

---

# OpenViking

OpenViking uses a different model: a filesystem-shaped context database.

Example:

```text
viking://user/123/journeys/mentorship/

goals/
leadership.md

reflections/
2026-09-01.md

evidence/
architecture-presentation.md
```

Strengths:

- highly inspectable
- transparent memory structure
- memory + knowledge + skills in one context system
- natural browsing model

Concerns:

- broader context-database focus than Cairn needs
- AGPL-3.0 licensing
- would require legal review for commercial proprietary deployment

It is interesting, but not a preferred foundation for Cairn.

---

# Honcho

Honcho is especially interesting for mentorship because it emphasizes **user modelling**.

Potentially useful questions include:

```text
How does this participant think?

What motivates them?

How have their preferences changed?

What themes recur?

What working style suits them?
```

This aligns strongly with mentorship.

However:

- it is AGPL-licensed
- it is less appropriate as a general evidence-oriented memory layer
- Cairn also needs healthcare-grade separation between inferred memory and authoritative evidence

Therefore it is better treated as a specialist idea source than as the platform default.

---

# Letta

Letta is a broader stateful-agent platform rather than just a memory layer.

Cairn deliberately separates responsibilities:

```text
Temporal
    owns workflow

Pattern Engine
    owns rules

Planner
    owns next action

AI
    owns language

Memory
    supplies context
```

Letta risks blurring these boundaries.

That would make Cairn:

- more dependent on one agent runtime
- harder to validate
- harder to keep deterministic where required
- more difficult to swap underlying agent technologies later

Therefore Letta is not preferred for Cairn.

---

# Recommended Cairn Architecture Change

Instead of hard-coding Hindsight, Cairn should introduce a provider-neutral abstraction:

```text
ContextMemoryProvider

retain(event)

recall(query)

get_profile()

get_temporal_context()

get_evidence_sources()

forget(source)

rebuild(participant)
```

Initial implementations:

```text
ContextMemoryProvider
        |
        +-- HindsightProvider
        |
        +-- GraphitiProvider
```

Do not implement five providers initially.

Use Discovery to choose between the two strongest candidates.

---

# Design Principle: Memory Is Disposable

Cairn should always be able to do this:

```text
DELETE derived memory

then

REBUILD from canonical Cairn events
```

This is a critical architecture principle.

The memory system must remain a derived projection of authoritative Cairn data.

That means Cairn's core must continue to own:

- participant identity
- journeys
- events
- evidence
- consent
- relationships
- pattern evaluations
- next actions
- clinical or domain-specific records
- audit state

The memory provider should never become the only place an important fact exists.

---

# Proposed Evaluation Spike

Run Hindsight and Graphiti against the same synthetic six-month journey.

Example input sequence:

```text
Day 1
goal / baseline created

Day 14
reflection

Day 28
same concern repeated

Month 2
goal changes

Month 3
contradictory statement

Month 4
mentor / carer observation

Month 5
evidence item uploaded

Month 6
summary requested
```

Evaluate the following.

| Test | Why it matters |
|---|---|
| Current-state accuracy | Can the system identify what is true now? |
| Historical accuracy | Can it identify what used to be true? |
| Contradiction handling | Does it preserve change rather than overwrite incorrectly? |
| Evidence traceability | Can assertions be traced to original Cairn source records? |
| Person-level insight | Can it identify useful recurring themes? |
| Domain isolation | Can Parkinson's and mentorship memories never cross? |
| Tenant isolation | Can one participant never retrieve another's data? |
| Forget/delete | Does consent withdrawal remove derived memory correctly? |
| Portability | Can it run in AWS, Azure, GCP and private Kubernetes? |
| Cost/latency | What does realistic six-month use cost? |
| Rebuildability | Can all derived memory be recreated from Cairn events? |

---

# Recommended ADR

## ADR — Replaceable Long-Term Context and Memory

**Decision**

Cairn will treat long-term AI memory and temporal context as a replaceable, derived projection rather than an authoritative system of record.

The platform will expose a `ContextMemoryProvider` interface.

Hindsight and Graphiti will be evaluated during Discovery.

The authoritative Cairn journey, participant, consent, event and evidence stores will remain independent of either technology.

**Rationale**

This prevents:

- model/vendor lock-in
- probabilistic memory becoming domain truth
- loss of clinical or mentoring evidence lineage
- inability to honour deletion or consent changes
- coupling of Domain Packs to one memory engine

It also allows Cairn to rebuild all derived memory from canonical event history.

---

# Current Preference

Based on Cairn's current requirements:

1. **Graphiti** — strongest challenger and potentially best architectural fit
2. **Hindsight** — strongest purpose-built AI memory system
3. **Mem0** — safest simple operational alternative
4. **Cognee** — powerful but requires licensing / production-boundary investigation
5. **MemMachine** — promising and worth watching

The main recommendation is therefore:

> Do not hard-code Hindsight into Cairn yet.

Instead, Cairn should treat long-term memory as a replaceable Context & Memory Plane and evaluate Hindsight and Graphiti side by side during Discovery.

Graphiti may ultimately be the stronger match for Cairn's central concept: not simply remembering a participant, but understanding **how their goals, observations, relationships and evidence evolve through time**.
