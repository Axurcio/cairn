# Vendor Profile: Neo4j

> **Template Origin**: Official | **ArcKit Version**: 6.1.7 | **Command**: `/arckit:research`

## Document Control

| Field | Value |
|-------|-------|
| **Document ID** | ARC-001-VEND-neo4j-v1.0 |
| **Document Type** | Vendor Profile |
| **Project** | Cairn — Longitudinal Guidance and Evidence Platform (Project 001) |
| **Classification** | OFFICIAL |
| **Status** | DRAFT |
| **Version** | 1.0 |
| **Created Date** | 2026-10-03 |
| **Last Modified** | 2026-10-03 |
| **Review Cycle** | Quarterly |
| **Next Review Date** | 2027-01-03 |
| **Owner** | Chris McKelt (Architecture Owner, S-10) |
| **Reviewed By** | [PENDING] |
| **Approved By** | [PENDING] |
| **Distribution** | Architecture Review Board, Engineering and delivery team |

## Revision History

| Version | Date | Author | Changes | Approved By | Approval Date |
|---------|------|--------|---------|-------------|---------------|
| 1.0 | 2026-10-03 | ArcKit AI | Initial creation from `/arckit:research` agent (ARC-001-RSCH-v1.0) | PENDING | PENDING |

---

## Overview

Neo4j supplies the graph database that Graphiti treats as its primary backend [WEB-1-C2]. ADR-001 selected Graphiti and deferred the backend to a follow-on ADR. ARC-001-RSCH-v1.0 recommends Neo4j as the portable default for that ADR: Community Edition if a GPL v3 legal opinion is favourable, with an Enterprise quote requested in parallel.

**Confidence**: Medium (4 sourced data points) | **Last Researched**: 2026-10-03

## Products & Services

- **Neo4j Community Edition**: self-managed, GPL v3 [WEB-16-C1]. A single standard database; offline backup; full-text and vector indexes [WEB-24-C1]
- **Neo4j Enterprise Edition**: self-managed, commercial. Adds autonomous clustering, online backup and restore, multiple databases, and role-based, property-based and sub-graph access control [WEB-24-C1]
- **Neo4j AuraDB**: managed SaaS on AWS, Azure and Google Cloud; Australian regions not stated on the pricing page [WEB-17-C2]

## Pricing Model

- Community: no licence fee (GPL v3)
- Enterprise (self-managed): contact sales [UNSOURCED]
- AuraDB Professional "$0.09/GB/hour" (minimum 1 GB); Business Critical "$0.20/GB/hour" (minimum 2 GB) with a 99.95% uptime SLA; Virtual Dedicated Cloud by quote [WEB-17-C1]

## UK Government Presence

- G-Cloud listed: Not applicable (Australian private-sector project)
- DOS listed: Not applicable
- UK data centres: Not applicable. Australian AuraDB regions: unknown (open question OQ-9 in ARC-001-RSCH-v1.0)

## Government Award History

> **Awarded value is not actual spend.** No tender run exists for this project.

- Total awarded value (UK gov contracts): unknown
- Award count: unknown
- Date range: unknown
- Top buyers: unknown
- Incumbency: unknown
- Sample awards: none on record

## Strengths

- Graphiti's primary, best-exercised backend [WEB-1-C2]
- Runs inside any data plane on any certified cloud (P10, P11)
- Lowest growth-case cost of the compliant backend options in ARC-001-RSCH-v1.0 (A$115.5k over 3 years)

## Weaknesses

- Community Edition is GPL v3 [WEB-16-C1], so a TC-9 legal review is needed
- Community lacks multiple databases, role-based access control and online backup [WEB-24-C1]
- Enterprise pricing is not published
- AuraDB fails Cairn's pilot-plane gate (vendor-hosted; Australian region not confirmed)

## Projects Referenced In

- 001-cairn (ARC-001-RSCH-v1.0; follow-on to ARC-001-ADR-001-v1.0)

## External References

> This section provides traceability from generated content back to source documents.
> Follow citation instructions in the project's citation reference guide.

### Document Register

| Doc ID | Filename | Type | Source Location | Description |
|--------|----------|------|-----------------|-------------|
| WEB-1 | https://github.com/getzep/graphiti | Web URL | github.com | Graphiti README (backends) |
| WEB-16 | https://neo4j.com/licensing/ | Web URL | neo4j.com | Neo4j licensing index |
| WEB-17 | https://neo4j.com/pricing/ | Web URL | neo4j.com | AuraDB pricing |
| WEB-24 | https://neo4j.com/docs/operations-manual/current/introduction/ | Web URL | neo4j.com | Edition comparison |

### Citations

| Citation ID | Doc ID | Page/Section | Category | Quoted Passage |
|-------------|--------|--------------|----------|----------------|
| [WEB-1-C2] | WEB-1 | Graph backends | Market Evidence | Neo4j 5.26 listed first among supported backends (described) |
| [WEB-16-C1] | WEB-16 | Developer offerings | Procurement Constraint | "Neo4j Community Edition (GPL v3)" |
| [WEB-17-C1] | WEB-17 | AuraDB tiers | Market Evidence | Professional "$0.09/GB/hour"; Business Critical "$0.20/GB/hour"; "99.95% uptime SLA" |
| [WEB-17-C2] | WEB-17 | Cloud availability | Compliance Constraint | "AWS, Azure, and Google Cloud"; Australian regions not stated (described) |
| [WEB-24-C1] | WEB-24 | Edition comparison | Design Decision | Enterprise-only: "Online backup and restore", "Multiple databases (beyond the system and default databases)", "Role-based access control" (described) |

### Unreferenced Documents

| Filename | Source Location | Reason |
|----------|-----------------|--------|
| — | — | — |

---

**Generated by**: ArcKit `/arckit:research` agent
**Generated on**: 2026-10-03
**ArcKit Version**: 6.1.7
**Project**: Cairn — Longitudinal Guidance and Evidence Platform (Project 001)
**Model**: Claude Opus 5.5 (claude-opus-5-5[1m])
