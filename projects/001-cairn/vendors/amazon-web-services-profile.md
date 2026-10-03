# Vendor Profile: Amazon Web Services

> **Template Origin**: Official | **ArcKit Version**: 6.1.7 | **Command**: `/arckit:research`

## Document Control

| Field | Value |
|-------|-------|
| **Document ID** | ARC-001-VEND-amazon-web-services-v1.0 |
| **Document Type** | Vendor Profile |
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
| **Distribution** | Architecture Review Board, Engineering and delivery team |

## Revision History

| Version | Date | Author | Changes | Approved By | Approval Date |
|---------|------|--------|---------|-------------|---------------|
| 1.0 | 2026-10-03 | ArcKit AI | Initial creation from `/arckit:research` agent (ARC-001-RSCH-v1.0) | PENDING | PENDING |

---

## Overview

Amazon Web Services is Cairn's first certified cloud (TC-6). It hosts data planes in Sydney (ap-southeast-2), with Melbourne (ap-southeast-4) as the second approved region (A-5). For Cairn it supplies the platform foundation and, through Amazon Bedrock, residency-compliant LLM inference. Bedrock's Australian geographic inference profiles keep data within Australia [WEB-8-C2], and Bedrock does not store model inputs or outputs by default [WEB-11-C1].

**Confidence**: High (more than 10 sourced data points) | **Last Researched**: 2026-10-03

## Products & Services

- **Amazon Bedrock**: Claude models through `au.` geo profiles (Haiku 4.5, Sonnet 4.6, Sonnet 5, Opus 5, Opus 5.5). Global-only models (Sonnet 5.5, Fable 5.1, Mythos 5.1) are not usable for Cairn [WEB-4-C1]. Titan Text Embeddings V2 is in-region in Sydney [WEB-4-C2]
- **Amazon Neptune and Amazon OpenSearch Serverless**: the fallback Graphiti backend (AWS-only)
- **Amazon EKS, RDS for PostgreSQL, S3, KMS, Secrets Manager, Elastic Load Balancing, CloudWatch**: the platform foundation
- **Amazon Transcribe**: the consented server speech path, including Transcribe Medical, priced in Sydney
- **Amazon SES**: email; **Amazon Cognito**: identity candidate; **Amazon Verified Permissions**, **Amazon MSK**: priced but not recommended (AWS-only; not needed at projected volumes)

## Pricing Model

Pay-as-you-go list prices in US dollars. Sydney prices used in ARC-001-RSCH-v1.0 (published 2026-09-11 to 2026-10-01):

| Service | Sydney price |
|---------|--------------|
| EKS cluster | US$0.10 per hour [WEB-29-C1] |
| EC2 m7g.xlarge / g6.xlarge | US$0.192 / US$1.0464 per hour [WEB-37-C1] |
| RDS PostgreSQL db.r7g.large Multi-AZ | US$0.574 per hour [WEB-39-C1] |
| Neptune Serverless | US$0.1941 per NCU-hour [WEB-28-C1] |
| OpenSearch Serverless | US$0.281 per OCU-hour [WEB-30-C1] |
| Transcribe streaming | US$0.0001667 per second [WEB-32-C1] |
| SES outbound (Essentials) | US$0.00016 per email [WEB-31-C1] |
| Cognito Essentials | US$0.015 per MAU, with 10,000 MAU free [WEB-45-C1] |

Claude models on Bedrock: regional and multi-region endpoints carry "a 10% premium over global endpoints" [WEB-9-C2].

## UK Government Presence

- G-Cloud listed: Not applicable (Cairn is an Australian private-sector project)
- DOS listed: Not applicable
- UK data centres: Not applicable. **Australian regions**: Sydney (ap-southeast-2) and Melbourne (ap-southeast-4). IRAP status was not researched

## Government Award History

> Sourced from UK procurement notices when a `/arckit:tenders` or `/arckit:competitors` run has supplied award data. **Awarded value is not actual spend.** No tender run exists for this project, and UK award data is not relevant to an Australian private-sector buyer.

- Total awarded value (UK gov contracts): unknown
- Award count: unknown
- Date range: unknown
- Top buyers: unknown
- Incumbency: unknown
- Sample awards: none on record

## Strengths

- Australian-only inference routing with per-model residency statements [WEB-8-C2]
- Zero operator access and zero data retention by default on Bedrock [WEB-11-C1]; model providers cannot see prompts [WEB-10-C1]
- Published, machine-readable Sydney prices across the platform

## Weaknesses

- Bedrock structured outputs are listed only for Australian-resident models nearing end of life (Haiku 4.5 no sooner than 2026-10-16 [WEB-7-C1]; Sonnet 4.6 no sooner than 2027-02-17 [WEB-13-C1])
- Claude Fable traffic is retained for up to 30 days [WEB-11-C2], so those models are excluded
- Neptune, Verified Permissions and MSK are AWS-only, which conflicts with P10 for stateful projections and policy

## Projects Referenced In

- 001-cairn (ARC-001-RSCH-v1.0)

## External References

> This section provides traceability from generated content back to source documents.
> Follow citation instructions in the project's citation reference guide.

### Document Register

| Doc ID | Filename | Type | Source Location | Description |
|--------|----------|------|-----------------|-------------|
| WEB-4 | https://docs.aws.amazon.com/bedrock/latest/userguide/models-region-compatibility.html | Web URL | docs.aws.amazon.com | Bedrock regional availability by model |
| WEB-7 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-haiku-4-5.html | Web URL | docs.aws.amazon.com | Claude Haiku 4.5 model card |
| WEB-8 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-opus-5-5.html | Web URL | docs.aws.amazon.com | Claude Opus 5.5 model card |
| WEB-9 | https://platform.claude.com/docs/en/about-claude/pricing | Web URL | platform.claude.com | Anthropic pricing |
| WEB-10 | https://docs.aws.amazon.com/bedrock/latest/userguide/data-protection.html | Web URL | docs.aws.amazon.com | Bedrock data protection |
| WEB-11 | https://docs.aws.amazon.com/bedrock/latest/userguide/abuse-detection.html | Web URL | docs.aws.amazon.com | Bedrock abuse detection |
| WEB-13 | https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-anthropic-claude-sonnet-4-6.html | Web URL | docs.aws.amazon.com | Claude Sonnet 4.6 model card |
| WEB-28 to WEB-45 | AWS Price List and pricing feeds, Sydney (see ARC-001-RSCH-v1.0 Document Register) | Web URL | pricing.us-east-1.amazonaws.com; b0.p.awsstatic.com | Sydney unit prices |

### Citations

| Citation ID | Doc ID | Page/Section | Category | Quoted Passage |
|-------------|--------|--------------|----------|----------------|
| [WEB-4-C1] | WEB-4 | Anthropic table | Market Evidence | Sonnet 5.5, Fable 5.1 and Mythos 5.1 Global only from Sydney and Melbourne (described) |
| [WEB-4-C2] | WEB-4 | Amazon table | Market Evidence | Titan Text Embeddings V2 In-Region in Sydney (described) |
| [WEB-7-C1] | WEB-7 | Model details | Risk Factor | "EOL no sooner than: Oct 16, 2026" |
| [WEB-8-C2] | WEB-8 | Data residency | Compliance Constraint | "AU geo (`au.anthropic.claude-opus-5-5`): Keeps data within Australia regions." |
| [WEB-9-C2] | WEB-9 | Cloud platform pricing | Market Evidence | "Regional and multi-region endpoints include a 10% premium over global endpoints." |
| [WEB-10-C1] | WEB-10 | Model Deployment Account | Security Requirement | "they don't have access to Amazon Bedrock logs or to customer prompts and completions." |
| [WEB-11-C1] | WEB-11 | Data security model | Security Requirement | "by default, Amazon Bedrock does not store model inputs or outputs." |
| [WEB-11-C2] | WEB-11 | Model exceptions | Compliance Constraint | "For Anthropic Claude Fable 5 and Claude Fable 5.1, all traffic will be retained for up to 30 days for automated offline abuse detection." |
| [WEB-13-C1] | WEB-13 | Model details | Risk Factor | EOL no sooner than Feb 17, 2027; structured outputs supported (described) |
| [WEB-28-C1] to [WEB-45-C1] | WEB-28 to WEB-45 | Sydney price lists | Market Evidence | Unit prices as tabulated above (described) |

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
