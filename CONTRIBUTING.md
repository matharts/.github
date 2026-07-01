# 贡献指南

感谢你对 MathArts 的关注。无论是修复一个错字、提出一个想法，还是贡献一段算法实现，每一份参与都有价值。

本指南适用于 MathArts 组织下的所有仓库。个别仓库如有特殊约定，以仓库自身的 `CONTRIBUTING.md` 为准。

## 开始之前

1. 阅读项目的 README，了解它在做什么、当前处于什么阶段。
2. 浏览目标仓库已有的 Issues，看看是否有人已经在讨论相似的话题。
3. 如果不确定从哪里入手，带有 `good first issue` 标签的 Issue 是好的起点。

## 参与方式

### 提出想法或问题

- **理论探讨、方向建议、开放式讨论** → 请到 [Discussions](https://github.com/orgs/matharts/discussions) 发起话题。
- **具体的 Bug、功能请求、文档问题** → 请在对应仓库提交 Issue，并选择合适的模板。

### 提交代码或文档

1. **Fork** 目标仓库到你的账号下。
2. 基于 `main` 分支创建你的工作分支：

   ```bash
   git checkout -b feat/你的功能描述
   ```

3. 进行修改，并遵守项目的代码风格指南（见 [代码风格指南](https://github.com/matharts/.github/blob/main/docs/code-style-guide.md)）。
4. 用规范的格式书写 Commit 信息（见 [Commit 规范](https://github.com/matharts/.github/blob/main/docs/commit-convention.md)）。
5. 确保你的改动能通过现有测试（如果有），并为新功能补充测试。
6. 推送分支并发起 **Pull Request**，说明你做了什么以及为什么。

### 分支命名约定

| 类型   | 格式                | 示例                       |
| ------ | ------------------- | -------------------------- |
| 新功能 | `feat/简要描述`     | `feat/bagua-sequence`      |
| 修复   | `fix/简要描述`      | `fix/tiangan-mapping`      |
| 文档   | `docs/简要描述`     | `docs/glossary-update`     |
| 重构   | `refactor/简要描述` | `refactor/calendar-engine` |

## 代码审查

所有合入 `main` 的改动都需要至少一位维护者审查。审查关注：

- 逻辑正确性与边界情况
- 是否符合项目的数据模型与术语规范
- 代码可读性与测试覆盖
- Commit 信息是否清晰

审查中的讨论对事不对人。我们鼓励提问、建议替代方案，也欢迎被审查者解释自己的思路。

## 术语与数据模型

数术领域的术语在不同流派间可能有不同含义。如果你的改动涉及新术语的引入或已有术语的重新定义，请：

1. 在 PR 描述中说明术语来源（典籍、流派、现代定义）。
2. 如果存在歧义，在 Discussions 中先发起讨论达成共识，再提交代码。
3. 所有术语应同时保留中文原名与英文标识符（用于代码），映射关系记录在各项目的术语表中。

## 行为准则

参与 MathArts 即表示你同意遵守我们的 [行为准则](https://github.com/matharts/.github/blob/main/CODE_OF_CONDUCT.md)。核心原则很简单：尊重他人，就事论事，保持善意。

## 许可

除非仓库另有说明，你提交的贡献将采用与该仓库相同的开源许可协议发布。
