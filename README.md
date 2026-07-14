# MathArts 组织公共配置

本仓库是 MathArts 在 GitHub 上的组织控制面，维护组织主页、组织治理、默认社区健康文件、贡献入口和必要的跨仓库自动化。

项目的代码、架构、领域规则、发布说明和项目级决策必须保留在对应项目仓库中。

## 从这里开始

| 目标 | 权威入口 |
| --- | --- |
| 了解 MathArts 与项目布局 | [组织主页](profile/README.md) |
| 了解角色、决策与仓库生命周期 | [组织治理](GOVERNANCE.md) |
| 参与贡献 | [贡献指南](CONTRIBUTING.md) |
| 获取帮助 | [支持指南](SUPPORT.md) |
| 了解社区行为边界 | [社区行为准则](CODE_OF_CONDUCT.md) |
| 私密报告安全漏洞 | [安全策略](SECURITY.md) |
| 使用组织级标签 | [标签治理](https://github.com/matharts/sync-labels-action/blob/main/docs/label-governance.md) |

## 职责边界

本仓库负责：

- `profile/README.md`：MathArts 的公开组织主页
- `GOVERNANCE.md`：组织角色、决策规则和仓库生命周期
- 默认 `CONTRIBUTING.md`、`CODE_OF_CONDUCT.md`、`SECURITY.md` 与 `SUPPORT.md`
- 默认 Issue、Pull Request 与 Discussion 模板
- 指向组织级标签治理仓库的入口
- 对上述文件进行验证的 GitHub Actions

本仓库不负责：

- 项目介绍、路线图和发布说明
- 项目架构、API Reference、Specification、RFC 与 ADR
- 项目构建命令、测试矩阵和开发环境
- 只适用于单个项目的术语、领域规则或标签

组织策略与项目规则发生交叉时，按[组织治理](GOVERNANCE.md)中的权威边界处理。

## GitHub 默认文件如何生效

当组织内的仓库没有同类社区健康文件时，GitHub 会使用本仓库中的默认版本。项目仓库可以用本地文件补充项目特定信息，但不应复制一份组织级政策后独立演化。

> [!IMPORTANT]
> 项目仓库一旦创建自己的 `.github/ISSUE_TEMPLATE/` 目录，组织级默认 Issue 模板将不再应用。项目维护者应提供完整的本地问题入口。

## 仓库结构

```text
.
├── profile/README.md
├── README.md
├── GOVERNANCE.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── SUPPORT.md
└── .github/
    ├── CODEOWNERS
    ├── ISSUE_TEMPLATE/
    ├── DISCUSSION_TEMPLATE/
    ├── pull_request_template.md
    └── workflows/
```

## 标签与自动化

组织级标签由独立的 [`matharts/sync-labels-action`](https://github.com/matharts/sync-labels-action) 仓库统一维护：

| 文件 | 职责 |
| --- | --- |
| [`labels.yml`](https://github.com/matharts/sync-labels-action/blob/main/.github/labels.yml) | 标签名称、颜色、描述和迁移别名 |
| [`label-policy.yml`](https://github.com/matharts/sync-labels-action/blob/main/.github/label-policy.yml) | 受管命名空间、历史名称和仓库 Allowlist |
| [`label-governance.md`](https://github.com/matharts/sync-labels-action/blob/main/docs/label-governance.md) | 使用规则、扩展边界和变更流程 |

[`preview-labels.yml`](https://github.com/matharts/sync-labels-action/blob/main/.github/workflows/preview-labels.yml) 只读预览标签漂移；[`sync-labels.yml`](https://github.com/matharts/sync-labels-action/blob/main/.github/workflows/sync-labels.yml) 只能从 `main` 手动执行真实同步，并受 `label-governance-production` Environment 保护。

真实同步使用 GitHub App 的短时效令牌。`sync-labels-action` 仓库的 Environment 中只应保存必要的 `APP_CLIENT_ID` 和 `APP_PRIVATE_KEY`，并配置 Required reviewers。

## 维护原则

1. 一个问题只保留一个权威来源
2. 默认文件只包含真正跨仓库的规则
3. 模板收集决策所需信息，不制造仪式感
4. 自动化使用最小权限，并提供只读预览
5. 组织级变更必须说明影响、验证方式和恢复路径

修改本仓库前，请阅读[贡献指南](CONTRIBUTING.md)。
