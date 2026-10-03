# Tech Note: Amazon Bedrock Australian Data Residency

> **Template Origin**: Official | **ArcKit Version**: 6.1.7 | **Command**: `/arckit:research`

## Document Control

| Field | Value |
|-------|-------|
| **Document ID** | ARC-001-TECH-amazon-bedrock-australian-data-residency-v1.0 |
| **Document Type** | Tech Note |
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
| **Distribution** | Architecture Review Board, Engineering and delivery team, Privacy Officer |

## Revision History

| Version | Date | Author | Changes | Approved By | Approval Date |
|---------|------|--------|---------|-------------|---------------|
| 1.0 | 2026-10-03 | ArcKit AI | Initial creation from `/arckit:research` agent (ARC-001-RSCH-v1.0) | PENDING | PENDING |

---

## Summary

Amazon Bedrock's Australian geographic inference profiles (`au.` prefix) route only between Sydney and Melbourne and keep data within Australia. That makes Claude models usable under Cairn's residency principle (P11). Residency still depends on which model is bound: some models are global-only from Australia, and one family retains traffic. Model lifecycles are short, which matters for evaluation-gated rebinding.

**Last Updated**: 2026-10-03

## Key Findings

- The AU profile routes requests "from the Sydney Region ... to either Sydney or Melbourne Regions" [WEB-3-C1], and a geography-tied profile's "destination Region list will never change" [WEB-5-C1]
- Per-model residency statement, for example: "AU geo (`au.anthropic.claude-opus-5-5`): Keeps data within Australia regions." [WEB-8-C2]
- Global-only from Australia (therefore not compliant): Claude Sonnet 5.5, Fable 5.1 and Mythos 5.1 [WEB-4-C1]
- Bedrock is zero data retention by default [WEB-11-C1], but Claude Fable traffic is retained for up to 30 days with possible human review [WEB-11-C2]. Exclude Fable
- SCPs must allow both Australian regions: "If any destination Region in a cross-Region inference profile is blocked in your SCPs, the request will fail" [WEB-5-C3]
- Melbourne is an opt-in region, and prompts "may be stored in the opt-in Regions for abuse detection purposes" [WEB-5-C2]. This is still Australian, but record it in the DPIA data inventory
- Structured outputs on `bedrock-runtime` are listed for Haiku 4.5 [WEB-7-C3] and Sonnet 4.6 [WEB-13-C1], but not for Sonnet 5 [WEB-12-C1] or Opus 5.5 [WEB-8-C3]
- End of life "no sooner than": Haiku 4.5 2026-10-16 [WEB-7-C1]; Sonnet 4.6 2027-02-17 [WEB-13-C1]; Opus 5.5 2027-09-22 [WEB-8-C1]
- Claude on Bedrock: regional endpoints "include a 10% premium over global endpoints" [WEB-9-C2]
- Claude models on `bedrock-runtime` do not offer Chat Completions [WEB-8-C4]. An OpenAI-compatible client such as Graphiti's needs a translating gateway

## Relevance to Projects

- **001-cairn**: FR-046 (model gateway binding rules), NFR-C-004 (residency), INT-001 and INT-003, DPIA condition 5, R-009 and R-017

## External References

> This section provides traceability from generated content back to source documents.
> Follow citation instructions in the project's citation reference guide.

### Document Register

| Doc ID | Filename | Type | Source Location | Description |
|--------|----------|------|-----------------|-------------|
| WEB-3 | https://aws.amazon.com/blogs/machine-learning/introducing-amazon-bedrock-cross-region-inference-for-claude-sonnet-4-5-and-haiku-4-5-in-japan-and-australia/ | Web URL | aws.amazon.com | AU CRIS announcement |
| WEB-4 | https://docs.aws.amazon.com/bedrock/latest/userguide/models-region-compatibility.html | Web URL | docs.aws.amazon.com | Regional availability |
| WEB-5 | https://docs.aws.amazon.com/bedrock/latest/userguide/inference-profiles-support.html | Web URL | docs.aws.amazon.com | Inference profiles |
| WEB-7 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-haiku-4-5.html | Web URL | docs.aws.amazon.com | Haiku 4.5 card |
| WEB-8 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-opus-5-5.html | Web URL | docs.aws.amazon.com | Opus 5.5 card |
| WEB-9 | https://platform.claude.com/docs/en/about-claude/pricing | Web URL | platform.claude.com | Anthropic pricing |
| WEB-11 | https://docs.aws.amazon.com/bedrock/latest/userguide/abuse-detection.html | Web URL | docs.aws.amazon.com | Abuse detection |
| WEB-12 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-sonnet-5.html | Web URL | docs.aws.amazon.com | Sonnet 5 card |
| WEB-13 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-sonnet-4-6.html | Web URL | docs.aws.amazon.com | Sonnet 4.6 card |

### Citations

| Citation ID | Doc ID | Page/Section | Category | Quoted Passage |
|-------------|--------|--------------|----------|----------------|
| [WEB-3-C1] | WEB-3 | Australia CRIS | Compliance Constraint | "Requests from the Sydney Region can be automatically routed to either Sydney or Melbourne Regions" |
| [WEB-4-C1] | WEB-4 | Anthropic table | Market Evidence | Sonnet 5.5, Fable 5.1, Mythos 5.1 Global only (described) |
| [WEB-5-C1] | WEB-5 | Profiles note | Compliance Constraint | "its destination Region list will never change." |
| [WEB-5-C2] | WEB-5 | Opt-in note | Compliance Constraint | "Your input prompts and output results may be stored in the opt-in Regions for abuse detection purposes." |
| [WEB-5-C3] | WEB-5 | SCP note | Compliance Constraint | "If any destination Region in a cross-Region inference profile is blocked in your SCPs, the request will fail even if other Regions remain allowed." |
| [WEB-7-C1] | WEB-7 | Model details | Risk Factor | "EOL no sooner than: Oct 16, 2026" |
| [WEB-7-C3] | WEB-7 | Features | Market Evidence | Structured outputs supported (described) |
| [WEB-8-C1] | WEB-8 | Model details | Risk Factor | "EOL no sooner than: September 22, 2027" |
| [WEB-8-C2] | WEB-8 | Data residency | Compliance Constraint | "AU geo (`au.anthropic.claude-opus-5-5`): Keeps data within Australia regions." |
| [WEB-8-C3] | WEB-8 | Features | Market Evidence | Structured outputs Not Supported (described) |
| [WEB-8-C4] | WEB-8 | APIs | Integration Requirement | Chat Completions not supported on bedrock-runtime (described) |
| [WEB-9-C2] | WEB-9 | Cloud pricing | Market Evidence | "Regional and multi-region endpoints include a 10% premium over global endpoints." |
| [WEB-11-C1] | WEB-11 | Security model | Security Requirement | "by default, Amazon Bedrock does not store model inputs or outputs." |
| [WEB-11-C2] | WEB-11 | Exceptions | Compliance Constraint | "all traffic will be retained for up to 30 days for automated offline abuse detection." |
| [WEB-12-C1] | WEB-12 | Features | Market Evidence | Structured outputs Not Supported (described) |
| [WEB-13-C1] | WEB-13 | Details and features | Market Evidence | EOL no sooner than Feb 17, 2027; structured outputs supported (described) |

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
