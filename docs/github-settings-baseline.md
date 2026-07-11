# MathArts GitHub 平台设置基线

> 状态：Draft  
> 维护范围：`matharts/.github`  
> 维护者：`.github` 仓库 Maintainers  
> 最后核查：尚未完成首次人工核查

## 1. 目的

本文件定义 MathArts 在 GitHub 平台上的**期望配置状态、核查方法和偏差处理方式**。

它用于管理无法完全由 Git 仓库内容表达的配置，例如：

- 组织与仓库权限；
- Ruleset 与默认分支保护；
- GitHub Actions 权限；
- Environment 保护；
- GitHub App 权限和安装范围；
- 安全功能开关。

本文件不是组织治理规范。组织使命、仓库边界、角色、决策和项目生命周期仍以 [`GOVERNANCE.md`](../GOVERNANCE.md) 指向的权威来源为准。

## 2. 非目标

本文件不负责：

- 记录 Secret、Token、私钥或 Client Secret 的值；
- 定义领域仓库的 CI、发布或部署策略；
- 代替 GitHub 中的实际 Settings；
- 复制组织治理规范；
- 把尚未核查的配置描述为已启用；
- 要求当前 GitHub 计划不支持的功能。

## 3. 状态与证据规则

每项设置必须区分：

| 状态 | 含义 |
| --- | --- |
| `Verified` | 已在 GitHub Settings 中人工核对，并保存了不含敏感信息的证据 |
| `Partial` | 部分满足，仍存在明确偏差 |
| `Unknown` | 尚未核查，不能视为符合 |
| `Not Applicable` | 当前计划、仓库类型或组织阶段不适用，并记录原因 |

证据可以是：

- GitHub Settings 页面路径；
- Ruleset、Environment 或 GitHub App 的名称；
- 不含 Secret 的截图；
- GitHub API 返回的非敏感配置摘要；
- 对应 Issue、Pull Request 或审计记录。

不得把聊天记录、维护者记忆或工作流注释作为唯一证据。

## 4. 组织级设置

### 4.1 身份与访问

期望状态：

- [ ] 组织成员启用双因素认证；若当前计划或组织状态无法强制，应记录替代措施。
- [ ] 组织默认仓库权限采用最小权限，不默认授予写权限。
- [ ] Owner 权限仅授予承担组织管理责任的人员。
- [ ] 离任、角色变化或长期不活跃时，及时复核 Owner、Member、Team 和 GitHub App 权限。
- [ ] 第三方 OAuth App、GitHub App 和 Personal Access Token 定期复核。

首次核查记录：

| 项目 | 状态 | 证据或偏差 |
| --- | --- | --- |
| 双因素认证策略 | Unknown | |
| 默认仓库权限 | Unknown | |
| Owner 清单 | Unknown | |
| 第三方应用清单 | Unknown | |

### 4.2 GitHub Actions 组织策略

期望状态：

- [ ] 默认 `GITHUB_TOKEN` 权限采用只读。
- [ ] 只有明确需要写权限的 Job 才声明写权限。
- [ ] 外部 Action 使用完整 Commit SHA，仓库 CI 负责阻止可移动版本引用。
- [ ] 允许的 Action 来源限制为 MathArts 自有 Action、GitHub 官方 Action 和经过明确审查的例外。
- [ ] Fork Pull Request 不自动获得 Secret 或高权限令牌。
- [ ] 外部贡献者工作流审批策略已明确并记录。
- [ ] 可复用工作流只在产生真实跨仓库复用需求后启用。

首次核查记录：

| 项目 | 状态 | 证据或偏差 |
| --- | --- | --- |
| 默认 Workflow 权限 | Unknown | |
| Action 使用策略 | Unknown | |
| Fork PR 策略 | Unknown | |
| 外部贡献者审批策略 | Unknown | |

## 5. `matharts/.github` 仓库设置

### 5.1 仓库基本状态

期望状态：

- [ ] 仓库保持 Public，使默认社区文件和组织主页能够生效。
- [ ] 默认分支为 `main`。
- [ ] 禁止删除 `main`。
- [ ] 禁止对 `main` 强制推送。
- [ ] 影响社区文件、治理入口、工作流和标签策略的修改通过 Pull Request 进入。
- [ ] 仓库未被归档、禁用或转换为 Fork。

### 5.2 `main` Ruleset

当前创始阶段的推荐目标：

- [ ] 要求通过 Pull Request 修改 `main`。
- [ ] 要求相关验证工作流成功。
- [ ] 要求分支在合并前解决冲突。
- [ ] 阻止强制推送和分支删除。
- [ ] 不强制要求固定数量的人工 Approval，避免单维护者阶段形成不可操作锁定。
- [ ] 当第二名稳定 Maintainer 到位后，重新评估 CODEOWNER Review 和最少 Approval 数量。
- [ ] 管理员或指定角色的紧急绕过能力有明确用途，并在使用后留下记录。

Required checks 不在本文件中复制展示名称。应以 `.github/workflows/` 中实际工作流和 Ruleset 当前配置为准。

首次核查记录：

| 项目 | 状态 | 证据或偏差 |
| --- | --- | --- |
| `main` Ruleset | Unknown | |
| 必需检查 | Unknown | |
| 绕过角色 | Unknown | |
| 合并策略 | Unknown | |

### 5.3 仓库级 Actions

期望状态：

- [ ] 仓库默认 Workflow 权限为只读。
- [ ] 不允许 GitHub Actions 自动创建或批准 Pull Request，除非未来通过独立安全评审。
- [ ] Workflow 使用最小 `permissions`。
- [ ] 高权限写入流程与只读 Preview 分离。
- [ ] 外部 Action 的完整 SHA 固定由现有校验脚本持续验证。
- [ ] Dependabot 只通过 Pull Request 更新 Action 引用，不自动合并高权限工作流变更。

## 6. 标签同步控制面

### 6.1 权威来源

标签同步继续使用以下职责划分：

- `.github/labels.yml`：目标标签及当前迁移别名；
- `.github/label-policy.yml`：组织拥有的标签范围、历史名称和仓库 Allowlist；
- `docs/label-governance.md`：标签语义和维护流程；
- Apply 工作流中的 `environment:`：写入 Environment 的机器事实。

本文件不复制标签定义、仓库 Allowlist 或 Environment 名称。

### 6.2 Preview

期望状态：

- [ ] Preview 使用只读 `github.token`。
- [ ] Preview 不读取 GitHub App 私钥或其他跨仓库写入凭证。
- [ ] 标签配置、策略或同步器变更会触发 Preview。
- [ ] Preview 只访问 `label-policy.yml` 中的 Allowlist 仓库。
- [ ] Preview 失败时不得继续执行 Apply。

### 6.3 Apply Environment

期望状态：

- [ ] Apply 只能手动触发。
- [ ] Apply 使用受保护 Environment。
- [ ] Environment 限制可部署分支或 Tag，至少只允许默认分支。
- [ ] Environment 配置 Required reviewer；单维护者阶段若平台限制导致无法自审，应记录替代审批措施。
- [ ] GitHub App 凭证只保存在该 Environment 范围内。
- [ ] Environment 不向 Preview、Push 或 Schedule Job 暴露 Secret。
- [ ] 每次 Apply 都保留 Workflow Run、输入参数和执行结果。

首次核查记录：

| 项目 | 状态 | 证据或偏差 |
| --- | --- | --- |
| Apply Environment | Unknown | 以 Apply 工作流的 `environment:` 为入口 |
| Required reviewer | Unknown | |
| 部署分支限制 | Unknown | |
| Environment Secret/Variable 范围 | Unknown | |

### 6.4 标签同步 GitHub App

期望状态：

- [ ] GitHub App 只安装到 `label-policy.yml` Allowlist 中的仓库。
- [ ] 最小权限为读取 Metadata 和管理 Issues/Labels 所需权限。
- [ ] 不授予 Contents 写入、Administration、Actions、Secrets、Members 或其他无关权限。
- [ ] `APP_CLIENT_ID` 与 `APP_PRIVATE_KEY` 的存储范围与 Apply Environment 一致。
- [ ] 私钥轮换后立即删除旧私钥。
- [ ] 仓库新增、归档、转移或移出 Allowlist 时同步复核 App 安装范围。
- [ ] 至少每季度复核一次权限、安装仓库和私钥状态。

首次核查记录：

| 项目 | 状态 | 证据或偏差 |
| --- | --- | --- |
| App 权限 | Unknown | |
| 安装仓库范围 | Unknown | |
| 私钥数量与轮换日期 | Unknown | 不记录私钥内容 |
| Environment 变量与 Secret | Unknown | 不记录值 |

## 7. 安全设置

期望状态：

- [ ] `SECURITY.md` 保持有效，并提供私密报告入口或明确的私密替代渠道。
- [ ] 启用 Dependabot alerts。
- [ ] 启用 Dependabot security updates。
- [ ] 在当前计划支持时启用 Secret scanning。
- [ ] 在当前计划支持时启用 Push protection。
- [ ] 不在 Issue、Pull Request、Workflow Log、Artifact 或本文中记录敏感凭证。
- [ ] 安全设置关闭或不可用时，记录原因和替代控制。

首次核查记录：

| 项目 | 状态 | 证据或偏差 |
| --- | --- | --- |
| Private vulnerability reporting | Unknown | |
| Dependabot alerts | Unknown | |
| Dependabot security updates | Unknown | |
| Secret scanning | Unknown | |
| Push protection | Unknown | |

## 8. CODEOWNERS 与敏感资产

期望状态：

- [ ] 以下资产具有明确审查责任：
  - `SECURITY.md`
  - `CODE_OF_CONDUCT.md`
  - `GOVERNANCE.md`
  - `SUPPORT.md`
  - `.github/workflows/**`
  - `.github/actions/**`
  - `.github/labels.yml`
  - `.github/label-policy.yml`
  - `.github/ISSUE_TEMPLATE/**`
- [ ] 当前只有一名 Maintainer 时，不通过不可满足的 CODEOWNER 规则阻塞仓库。
- [ ] 增加稳定 Maintainer 后，再启用强制 CODEOWNER Review。

## 9. 核查周期

执行完整核查的触发条件：

- 每季度一次；
- GitHub App 权限或私钥变更；
- Ruleset 或 Environment 变更；
- 组织 Owner 或 Maintainer 变化；
- 新增或归档仓库；
- GitHub Actions 安全模型发生重大变化；
- 发生凭证泄漏、越权写入或保护规则绕过；
- 标签同步 Allowlist 变化。

## 10. 偏差处理

发现偏差时：

1. 不直接把未知状态标记为符合；
2. 评估是否存在即时安全风险；
3. 高风险偏差优先停止相关写入自动化；
4. 在 `matharts/.github` 创建 Issue，记录期望状态、实际状态、影响和修复方案；
5. Settings 修复与仓库文件修改分别记录；
6. 修改本基线时通过 Pull Request 审查；
7. 不在 Issue 或 PR 中粘贴 Secret。

## 11. 核查记录模板

```markdown
## GitHub Settings Audit — YYYY-MM-DD

- 核查人：
- 范围：
- 基于提交：
- 结论：Verified / Partial
- 下次核查日期：

### 已验证

| 设置 | 状态 | 证据 |
| --- | --- | --- |
| | | |

### 偏差

| 设置 | 风险 | 实际状态 | 推荐修复 | 跟踪 Issue |
| --- | --- | --- | --- | --- |
| | | | | |

### 未核查

| 设置 | 原因 | 后续动作 |
| --- | --- | --- |
| | | |
```
