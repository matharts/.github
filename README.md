# MathArts 组织公共配置

本仓库维护 MathArts GitHub 组织的默认社区健康文件和跨仓库协作配置。

当组织内的项目仓库没有提供同类文件时，GitHub 会使用本仓库中的默认版本。项目特定的规则、架构和文档仍应在对应项目仓库中维护。

## 快速入口

| 事项          | 入口                                                     |
| ----------- | ------------------------------------------------------ |
| 了解 MathArts | [`profile/README.md`](profile/README.md)               |
| 参与贡献        | [`CONTRIBUTING.md`](CONTRIBUTING.md)                   |
| 社区行为规范      | [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md)             |
| 报告安全漏洞      | [`SECURITY.md`](SECURITY.md)                           |
| 使用和维护标签     | [`docs/label-governance.md`](docs/label-governance.md) |
| 核查 GitHub 设置 | [`docs/github-settings-baseline.md`](docs/github-settings-baseline.md) |

## 本仓库维护什么

本仓库负责维护：

* 组织级默认社区健康文件；
* 默认 Issue Forms 和 Pull Request 模板；
* MathArts GitHub 组织主页；
* 组织级标签定义和标签治理规则；
* 标签同步与文档验证等组织级自动化。

项目介绍、架构文档、Specification、RFC、ADR、API Reference、用户指南和发布文档不属于本仓库，应保留在对应项目仓库中。

## 默认文件如何生效

本仓库中的文件是组织级默认值，不会强制覆盖项目仓库中的本地文件。

项目仓库存在同类文件时，以项目仓库中的版本为准。项目只有在确实存在不同的读者、流程或维护要求时，才应创建本地版本，避免复制组织级文件后分别维护。

> 项目仓库一旦创建自己的 `.github/ISSUE_TEMPLATE/` 目录，组织级默认 Issue 模板将不再应用。项目维护者应确保本地目录提供完整的问题提交入口。

## 标签治理

MathArts 的组织级标签由三个职责不同的权威来源共同维护：

| 文件                                                     | 职责                                         |
| ------------------------------------------------------ | ------------------------------------------ |
| [`.github/labels.yml`](.github/labels.yml)             | 定义目标标签名称、颜色、描述，以及当前仍需执行的一对一迁移别名          |
| [`.github/label-policy.yml`](.github/label-policy.yml) | 定义组织拥有的标签命名空间、历史受管名称和参与同步的仓库 Allowlist |
| [`docs/label-governance.md`](docs/label-governance.md) | 定义标签的使用规则、维护责任、扩展边界和生命周期               |

完整目标标签清单只在 `.github/labels.yml` 中维护。同步器只会删除 `label-policy.yml` 声明为组织所有的标签，并保留仓库自行维护的扩展标签。

`label-policy.yml` 采用显式仓库 Allowlist。新增仓库不会自动进入标签同步范围；加入或移除仓库必须经过本仓库的 Pull Request。手动指定仓库时，也只能选择 Allowlist 中的仓库。

历史标签的职责分为两层：

* `labels.yml` 的 `aliases` 表示当前需要执行的一对一重命名；
* `label-policy.yml` 的 `legacy_names` 表示组织仍然拥有并允许同步器清理的旧名称。

从 `aliases` 移除迁移映射时，不应立即移除对应的 `legacy_names`；应先确认所有 Allowlist 仓库已完成清理，避免旧标签成为无人管理的残留。

标签自动化分为两个权限边界：

* [`preview-labels.yml`](.github/workflows/preview-labels.yml) 在 Pull Request、推送、定时任务或手动触发时使用只读 `github.token` 预览 Allowlist 仓库的标签漂移，不读取 GitHub App 私钥；
* [`sync-labels.yml`](.github/workflows/sync-labels.yml) 只允许从 `main` 手动触发真实变更，并绑定 `label-governance-production` Environment。

真实同步通过 GitHub App 生成短时效 Installation Access Token。`label-governance-production` Environment 必须配置：

* Environment Variable `APP_CLIENT_ID`；
* Environment Secret `APP_PRIVATE_KEY`；
* Required reviewers，并在账户方案支持时禁止发起者自行批准。

GitHub App 应只安装到参与组织级标签治理的仓库，并采用最小仓库权限；当前标签同步至少需要 `Issues: Read and write`，`Metadata: Read` 由 GitHub 自动授予。轮换 GitHub App 私钥时，应同步更新 `APP_PRIVATE_KEY`。

所有外部 GitHub Action 和可复用工作流引用必须固定到完整的 40 位 Commit SHA，并在行尾注释人类可读版本。`.github/scripts/validate-action-pins.rb` 负责强制检查，Dependabot 负责提出后续版本更新。

## 维护原则

维护本仓库时应遵循以下原则：

1. 同一规则只保留一个权威来源；
2. 组织级文件只包含具有跨仓库价值的内容；
3. 项目特定规则留在项目仓库；
4. 模板应降低贡献成本，不应增加无必要的流程；
5. 变更组织级配置时，应检查对现有仓库、模板和自动化的影响。

## 参与维护

修改本仓库前，请阅读 [`CONTRIBUTING.md`](CONTRIBUTING.md)。

Pull Request 应说明修改目的、影响范围、验证方式，以及是否需要同步调整其他模板、标签或自动化。

具体项目的 Bug、功能请求和使用问题，应提交到对应项目仓库。安全漏洞不得通过公开 Issue 或 Pull Request 报告，请遵循 [`SECURITY.md`](SECURITY.md)。
