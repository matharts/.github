# MathArts Governance

本文件是 MathArts 在 GitHub 上的组织级治理入口，用于帮助贡献者找到正确的权威来源。它不单独定义一套与组织规范并行的治理制度。

## 权威来源与状态

MathArts 的组织愿景、仓库分层、职责边界、项目生命周期、质量门槛和决策流程，以 [`matharts/ecosystem` 的 `SPECIFICATION.md`](https://github.com/matharts/ecosystem/blob/main/SPECIFICATION.md) 为单一事实来源。

该规范当前标记为 **Draft · 持续演化**。这表示它是 MathArts 当前使用的组织规范，但仍可通过审查和版本化变更继续完善；不得将其对外描述为已经获得行业认可的正式标准。

重点章节：

- [组织架构与仓库边界](https://github.com/matharts/ecosystem/blob/main/SPECIFICATION.md#2-组织架构)
- [Repository 与任务工作流](https://github.com/matharts/ecosystem/blob/main/SPECIFICATION.md#5-工作流)
- [治理、Ownership 与单一事实来源](https://github.com/matharts/ecosystem/blob/main/SPECIFICATION.md#6-治理与演化)
- [决策流程](https://github.com/matharts/ecosystem/blob/main/SPECIFICATION.md#64-决策流程)

## 文档职责边界

| 内容 | 权威载体 |
| --- | --- |
| 组织愿景、分层、仓库生命周期和组织级治理 | `matharts/ecosystem/SPECIFICATION.md` |
| 单个仓库的存在理由、职责与非职责 | 该仓库的 `CHARTER.md` |
| 尚未决定的重要变更 | Issue、Discussion，或仓库已经建立的 RFC 流程 |
| 已经作出的重要架构决定 | 该仓库的 ADR |
| 当前架构和实现事实 | 该仓库的 Architecture、Specification、Reference、测试与代码 |
| 贡献和评审流程 | 组织或仓库的 `CONTRIBUTING.md` |
| 社区行为 | `CODE_OF_CONDUCT.md` |
| 安全漏洞报告与处理 | `SECURITY.md` |

不得在多个仓库复制并分别维护同一项组织政策。其他位置可以摘要或链接，但必须指回权威来源。

## 默认决策路径

在目标仓库没有更具体流程时，采用以下最小路径：

1. 小型文档修复、明确 Bug 修复和局部维护可以直接提交 Pull Request。
2. 新功能、公共 API、数据格式、核心模型或跨仓库变更应先创建 Issue 或 Discussion。
3. 影响架构、边界、长期兼容性或组织级协作方式的决定，应遵循：

   ```text
   Proposal → Discussion → Decision → ADR → Implementation
   ```

4. RFC 不是所有变更的强制步骤。只有目标仓库已经建立 RFC 流程、维护者明确要求，或普通 Issue 无法充分承载重大提案时才使用 RFC。
5. ADR 记录已经作出的决定，不得用来绕过提案和讨论过程。

## 规则优先级

- 组织级边界和治理规则以 `matharts/ecosystem` 为准。
- 仓库可以为本地开发、测试、发布和评审制定更具体或更严格的规则，但不得与组织级边界冲突。
- 安全问题和社区行为问题分别按照 `SECURITY.md` 与 `CODE_OF_CONDUCT.md` 处理，不应由普通技术讨论替代。
- 当文档与代码行为不一致时，应先确认哪一方代表已经接受的决定，再在同一个变更中修正实现或文档；不得通过文字包装掩盖尚未解决的技术争议。

## 维护责任

本文件由 MathArts 组织维护者维护。出现以下情况时必须复审：

- `matharts/ecosystem` 的权威规范路径、状态或章节发生变化；
- 建立或修改统一的 RFC、ADR、维护者或项目生命周期流程；
- 组织级安全、行为或贡献政策发生变化；
- 实际协作中出现重复事实来源、权限不清或决策路径冲突。
