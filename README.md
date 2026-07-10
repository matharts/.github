# MathArts `.github`

本仓库维护 MathArts GitHub 组织的公共配置、组织主页和默认社区健康文件。

组织内仓库没有提供同名本地文件时，GitHub 可以使用本仓库中的默认 Issue 模板、Pull Request 模板、贡献指南、支持指南、治理入口、安全策略与行为准则。项目仓库一旦提供本地文件，应由该仓库明确维护自己的差异，不应复制组织级文件后长期形成冲突版本。

## 文档入口

- [组织主页](profile/README.md)
- [贡献指南](CONTRIBUTING.md)
- [支持指南](SUPPORT.md)
- [治理入口](GOVERNANCE.md)
- [行为准则](CODE_OF_CONDUCT.md)
- [安全策略](SECURITY.md)
- [通用代码风格指南](docs/code-style-guide.md)
- [Commit 规范](docs/commit-convention.md)

MathArts 的组织愿景、仓库边界、项目生命周期和决策流程，以 [`matharts/ecosystem`](https://github.com/matharts/ecosystem) 中的组织规范为权威来源。本仓库只维护 GitHub 协作入口和默认社区文件，不复制完整组织规范。

## 维护原则

- 同一项组织政策只保留一个权威来源，其他位置只做摘要或链接。
- 项目特定的架构、实现、测试和发布规则留在项目仓库。
- 默认模板保持最小且可用，不要求小型贡献填写无关信息。
- 社区文件变更必须说明影响范围，并经过 CODEOWNERS 审查。
- 与仓库行为相关的文档变更应和实现、模板或自动化在同一个 Pull Request 中更新。

## 自动化

[文档自动化验证](.github/workflows/validate-documentation.yml)会在相关 Pull Request 和 `main` 分支变更中检查：

- 必需社区文件是否存在且非空；
- GitHub 配置文件的 YAML 语法；
- Markdown 结构与格式；
- 仓库内相对链接；
- 指向本仓库 `main` 分支的绝对 GitHub 文件链接；
- 工作流中的本地 Action 引用。

外部链接每周自动检查一次，也可以通过 GitHub Actions 手动执行。

## 维护责任

本仓库的默认责任人由 [`.github/CODEOWNERS`](.github/CODEOWNERS) 定义。安全报告接收人、行为准则处理人或组织治理权发生变化时，必须同步复审相关社区文件。
