# Tech Note: Graphiti Graph Database Backends

> **Template Origin**: Official | **ArcKit Version**: 6.1.7 | **Command**: `/arckit:research`

## Document Control

| Field | Value |
|-------|-------|
| **Document ID** | ARC-001-TECH-graphiti-graph-database-backends-v1.0 |
| **Document Type** | Tech Note |
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

## Summary

Graphiti (Apache-2.0) supports four graph backends: Neo4j, FalkorDB, Amazon Neptune and Kuzu (deprecated) [WEB-1-C2]. None is permissive, maintained, upstream-supported and self-hostable all at once. Neo4j Community is GPL v3; FalkorDB is SSPLv1; Kuzu is archived; Neptune is AWS-only and needs OpenSearch Serverless. A PostgreSQL backend is not supported upstream. For Cairn's follow-on ADR, the recommended shortlist is Neo4j (portable default, subject to a legal opinion) with Neptune as the AWS-only fallback.

**Last Updated**: 2026-10-03

## Key Findings

- Supported backends: Neo4j 5.26, FalkorDB 1.1.2, Amazon Neptune (with an "Amazon OpenSearch Serverless collection (serves as the full text search backend)"), and Kuzu 0.11.2, which "is deprecated and will be removed in a future release" [WEB-1-C2]
- Neo4j Community is GPL v3 [WEB-16-C1]. Multiple databases, role-based access control and online backup are Enterprise-only [WEB-24-C1]
- FalkorDB is SSPLv1 [WEB-18-C1], so Cairn's TC-9 excludes it unless approved
- Kuzu's repository was archived on 2025-10-10 [WEB-23-C1]
- The PostgreSQL route is closed upstream: PR #1777 closed as stale on 2026-09-29 [WEB-20-C1]; RFC #1781 "Closed as not planned" [WEB-21-C1]; the third-party driver is self-declared alpha [WEB-22-C1]. Apache AGE is not available on Amazon RDS [WEB-25-C1]
- Sydney costs for Neptune: Serverless US$0.1941 per NCU-hour [WEB-28-C1]. OpenSearch Serverless US$0.281 per OCU-hour [WEB-30-C1], with a minimum of 2 OCUs (or 1 OCU in dev-test mode) [WEB-26-C1]
- Estimated 3-year cost for Cairn's base case: Neo4j Community A$86.7k; Neptune with OpenSearch A$84.2k (high availability) or A$61.7k (dev-test); Cairn-maintained PostgreSQL driver A$128.9k (ARC-001-RSCH-v1.0, Category 7)
- Graphiti also needs structured-output-capable models [WEB-1-C4], which constrains which Bedrock models it can be bound to in Australia

## Relevance to Projects

- **001-cairn**: Direct input to the follow-on ADR required by ARC-001-ADR-001-v1.0 (section 12.2), and to risks R-13, R-022 and R-023

## External References

> This section provides traceability from generated content back to source documents.
> Follow citation instructions in the project's citation reference guide.

### Document Register

| Doc ID | Filename | Type | Source Location | Description |
|--------|----------|------|-----------------|-------------|
| WEB-1 | https://github.com/getzep/graphiti | Web URL | github.com | Graphiti README |
| WEB-16 | https://neo4j.com/licensing/ | Web URL | neo4j.com | Neo4j licensing |
| WEB-18 | https://github.com/FalkorDB/FalkorDB | Web URL | github.com | FalkorDB repository |
| WEB-20 | https://github.com/getzep/graphiti/pull/1777 | Web URL | github.com | PostGraph driver PR |
| WEB-21 | https://github.com/getzep/graphiti/issues/1781 | Web URL | github.com | PostgreSQL driver RFC |
| WEB-22 | https://github.com/uahic/graphiti-postgres | Web URL | github.com | Third-party PostgreSQL driver |
| WEB-23 | https://github.com/kuzudb/kuzu | Web URL | github.com | Kuzu repository |
| WEB-24 | https://neo4j.com/docs/operations-manual/current/introduction/ | Web URL | neo4j.com | Neo4j editions |
| WEB-25 | https://github.com/apache/age/issues/998 | Web URL | github.com | AGE on RDS request |
| WEB-26 | https://aws.amazon.com/opensearch-service/pricing/ | Web URL | aws.amazon.com | OpenSearch Serverless minimums |
| WEB-28 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonNeptune/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | Neptune Sydney prices |
| WEB-30 | https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonES/current/ap-southeast-2/index.json | Web URL | pricing.us-east-1.amazonaws.com | OpenSearch Sydney prices |

### Citations

| Citation ID | Doc ID | Page/Section | Category | Quoted Passage |
|-------------|--------|--------------|----------|----------------|
| [WEB-1-C2] | WEB-1 | Graph backends | Market Evidence | Neo4j 5.26, FalkorDB 1.1.2, Neptune with OpenSearch Serverless, Kuzu 0.11.2 deprecated (described) |
| [WEB-1-C4] | WEB-1 | Structured output | Non-Functional Requirement | "Graphiti works best with LLM services that support Structured Output" |
| [WEB-16-C1] | WEB-16 | Developer offerings | Procurement Constraint | "Neo4j Community Edition (GPL v3)" |
| [WEB-18-C1] | WEB-18 | Licence | Procurement Constraint | "Licensed under the Server Side Public License v1 (SSPLv1)" |
| [WEB-20-C1] | WEB-20 | PR status | Risk Factor | Closed 2026-09-29: "requested changes were not made within the window" |
| [WEB-21-C1] | WEB-21 | Issue status | Risk Factor | "Closed as not planned" (described) |
| [WEB-22-C1] | WEB-22 | README | Risk Factor | "THIS IS AN EXPERIMENTAL IMPLEMENTATION IN ALPHA VERSION." |
| [WEB-23-C1] | WEB-23 | Repository status | Risk Factor | Archived October 10, 2025 (described) |
| [WEB-24-C1] | WEB-24 | Edition comparison | Design Decision | Enterprise-only online backup, multiple databases and RBAC (described) |
| [WEB-25-C1] | WEB-25 | Issue #998 | Risk Factor | "Apache AGE is not directly supported on Amazon RDS" |
| [WEB-26-C1] | WEB-26 | Minimums | Market Evidence | "billed at least for a minimum of 2 OCUs" |
| [WEB-28-C1] | WEB-28 | Sydney price list | Market Evidence | "$0.1941 per NCU-hr for Neptune:ServerlessUsage" |
| [WEB-30-C1] | WEB-30 | Sydney price list | Market Evidence | "$0.281 per OCU-hours for IndexingOCU in Asia Pacific (Sydney)" |

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
