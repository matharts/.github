# MathArts GitHub 组织公共配置

本仓库维护 [MathArts](https://github.com/matharts) GitHub 组织的公共配置、默认社区健康文件和组织主页。

对于没有在自身仓库中提供同类文件的 MathArts 项目，本仓库提供统一的贡献、支持、治理、安全和社区协作入口。

> 本仓库只维护组织级 GitHub 协作基础设施，不集中存放具体项目的架构、规范、API、开发或用户文档。

## 主要入口

| 内容 | 文件 |
| --- | --- |
| MathArts 组织主页 | [`profile/README.md`](profile/README.md) |
| 贡献流程 | [`CONTRIBUTING.md`](CONTRIBUTING.md) |
| 支持渠道 | [`SUPPORT.md`](SUPPORT.md) |
| 组织治理入口 | [`GOVERNANCE.md`](GOVERNANCE.md) |
| 社区行为准则 | [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) |
| 安全漏洞报告 | [`SECURITY.md`](SECURITY.md) |
| 标签治理规则 | [`docs/label-governance.md`](docs/label-governance.md) |
| 组织级标签定义 | [`.github/labels.yml`](.github/labels.yml) |

## 仓库职责

本仓库维护：

- 组织级默认社区健康文件；
- 默认 Issue Forms 和 Pull Request 模板；
- MathArts GitHub 组织主页；
- 跨仓库统一标签的定义、治理和同步机制；
- 社区文档和仓库配置的自动化验证。

具体项目仓库负责维护：

- 项目介绍、安装方式和快速开始；
- 架构文档、Specification、RFC 和 ADR；
- API Reference、配置参考和使用指南；
- 项目特定的构建、测试、发布和维护流程；
- Changelog、Release Notes 和迁移说明。

同一政策或项目事实应只有一个权威来源。项目特定内容不得复制到本仓库中形成第二份正式版本。

## 默认文件与项目级覆盖

本仓库中的社区健康文件是组织级默认文件。

当项目仓库提供同名文件时，GitHub 会优先使用项目仓库中的文件。项目只有在确实需要不同规则时才应建立本地版本，并应明确其适用范围。

MathArts 的组织治理、仓库边界、决策流程和项目生命周期，以 [`matharts/ecosystem`](https://github.com/matharts/ecosystem) 中的组织规范为唯一权威来源。本仓库的 [`GOVERNANCE.md`](GOVERNANCE.md) 只提供统一的 GitHub 治理入口。

## 标签治理

MathArts 的组织级标签体系由两个权威文件共同维护：

- [`.github/labels.yml`](.github/labels.yml) 定义标签名称、颜色、描述和旧标签别名；
- [`docs/label-governance.md`](docs/label-governance.md) 定义标签的使用规则、维护责任、扩展边界和生命周期。

具体仓库可以增加项目特定标签，但不得修改组织级标签的名称、含义或使用边界。

组织级标签通过 [`sync-labels.yml`](.github/workflows/sync-labels.yml) 和仓库内的 [`sync-labels`](.github/actions/sync-labels) Action 同步到适用仓库。

## GitHub 协作配置

| 配置 | 路径 |
| --- | --- |
| Issue Forms | [`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE) |
| Pull Request 模板 | [`.github/pull_request_template.md`](.github/pull_request_template.md) |
| 组织级标签 | [`.github/labels.yml`](.github/labels.yml) |
| 标签同步 Action | [`.github/actions/sync-labels/`](.github/actions/sync-labels) |
| 标签同步工作流 | [`.github/workflows/sync-labels.yml`](.github/workflows/sync-labels.yml) |
| 文档验证工作流 | [`.github/workflows/validate-documentation.yml`](.github/workflows/validate-documentation.yml) |

## 自动化

[`validate-documentation.yml`](.github/workflows/validate-documentation.yml) 检查必需社区文件、Markdown 格式、仓库内文档引用和文档链接。

[`sync-labels.yml`](.github/workflows/sync-labels.yml) 负责预览和执行组织级标签同步，并定期检查标签漂移。

## 参与维护

修改本仓库前，请阅读 [`CONTRIBUTING.md`](CONTRIBUTING.md)。

由于本仓库的变更可能影响多个 MathArts 项目，Pull Request 应说明：

- 修改解决的问题；
- 为什么该内容属于组织级公共配置；
- 哪些仓库或贡献流程可能受到影响；
- 是否需要同步修改模板、标签、文档或自动化；
- 如何验证修改结果。

具体项目的 Bug、功能建议和使用问题，应提交到对应项目仓库。尚未明确归属或需要跨仓库讨论的问题，应使用 [MathArts Discussions](https://github.com/orgs/matharts/discussions)。

安全漏洞不得通过公开 Issue、Pull Request 或 Discussion 报告，请按照 [`SECURITY.md`](SECURITY.md) 私密提交。
