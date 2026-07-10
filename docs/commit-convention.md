# MathArts Commit 规范

MathArts 默认采用 Conventional Commits 风格，使提交历史便于阅读、审查和生成变更记录。项目仓库可以增加更具体的 scope、校验工具或合并策略。

## 基本格式

```text
<type>(<scope>): <subject>
```

`scope` 可以省略：

```text
<type>: <subject>
```

示例：

```text
feat(calendar): add solar-term query API
fix(temporal): correct day-boundary conversion
docs(governance): clarify decision authority
```

## 常用类型

| 类型 | 用途 |
| --- | --- |
| `feat` | 新功能或新的用户可见能力 |
| `fix` | Bug 修复 |
| `docs` | 仅文档变更 |
| `refactor` | 不改变外部行为的代码重构 |
| `test` | 新增或修改测试 |
| `data` | 术语、知识数据、映射表或参考数据 |
| `perf` | 性能优化 |
| `ci` | CI/CD 与自动化 |
| `build` | 构建系统、打包或开发工具链 |
| `chore` | 其他维护工作 |
| `style` | 不影响逻辑的格式调整 |
| `revert` | 回退已有提交 |

不得把行为变化隐藏在 `chore` 或 `refactor` 中。

## Scope

`scope` 用于标识受影响的包、模块或文档区域，例如：

```text
feat(primitives): add angle value object
fix(calendar-chinese): handle leap-month lookup
docs(governance): clarify decision authority
ci(markdown): validate internal links
```

Scope 应使用目标仓库已有的名称。组织不维护跨所有仓库的固定 scope 列表。

## Subject 与正文

Subject 应简短、明确，描述本次提交实际完成的事情。避免只写 `update`、`fix issue` 或 `changes`。

当标题无法充分解释原因、约束或影响时，应增加正文。正文可以说明：

- 为什么需要这项变更；
- 当前方案和替代方案；
- 兼容性与迁移影响；
- 数据来源或规则依据；
- 测试和验证方式；
- 与 Issue、RFC、ADR 或 Specification 的关系。

中文或英文均可，但同一仓库应尽量保持一致。

## Breaking Change

不兼容变更必须使用以下任一方式明确标记。

在 type 或 scope 后增加 `!`：

```text
feat(api)!: replace positional arguments with options object
```

或者在正文尾部增加：

```text
BREAKING CHANGE: describe affected APIs and the migration path.
```

## 引用 Issue 与决策

可以在正文或 footer 中引用相关事项：

```text
Refs: #123
Closes: #456
ADR: docs/decisions/ADR-0004-example.md
RFC: docs/rfcs/0007-example.md
```

只有确实应在合并后关闭 Issue 时才使用 `Closes`、`Fixes` 或 `Resolves`。

## 提交粒度

一个提交应表达一个可以独立理解的逻辑变化。应避免：

- 把无关重构、格式化和功能变更混在同一提交；
- 大量无意义的 `fix`、`update` 提交长期保留在历史中；
- 为了追求提交数量把一个不可分割的变化机械拆开；
- 提交无法验证且没有明确原因的中间状态。

维护者可以在合并前要求 rebase、squash 或整理提交历史。仓库采用 squash merge 时，Pull Request 标题和最终 squash commit 也应符合本规范。

## 文件维护

本文件由 MathArts 组织维护者维护。当版本发布方式、Changelog 自动化或仓库合并策略发生变化时，应当复审。
