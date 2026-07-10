# MathArts 标签治理

## 1. 目的

本文件定义 MathArts GitHub 标签的使用规则、维护责任、扩展边界和生命周期。

标签用于帮助贡献者和维护者：

* 识别 Issue 或 Pull Request 的主要类型；
* 判断事项当前是否可以推进；
* 标记兼容性、安全、性能和数据正确性等影响；
* 识别正式的 RFC、ADR、Specification、发布或治理流程；
* 发现适合外部贡献者参与的工作；
* 记录事项未按普通完成方式关闭的原因；
* 在多个 MathArts 仓库之间进行一致的搜索、筛选和自动化。

标签不得替代 Issue 描述、评审意见、负责人、Milestone、Project、RFC、ADR、Specification 或发布计划。

## 2. 适用范围

本文件适用于 MathArts 组织内采用组织级标签体系的仓库。

组织级标签应尽可能在以下仓库中保持一致：

* 活跃维护的代码仓库；
* 文档和规范仓库；
* 组织级治理仓库；
* 接受公开 Issues 或 Pull Requests 的其他仓库。

归档仓库、镜像仓库、只读生成仓库或不接受公开贡献的仓库，可以不启用完整标签体系。

具体仓库可以增加项目特定标签，但不得修改组织级标签的名称、含义或使用边界。

## 3. 权威来源

`.github/labels.yml` 是 MathArts 组织级标签以下内容的唯一权威来源：

* 标签名称；
* 标签颜色；
* 标签描述；
* 旧标签别名。

本文件只定义标签的使用方式、维护权限、扩展边界和生命周期，不重复维护完整标签清单。

如果本文件中的示例与 `.github/labels.yml` 不一致，以 `.github/labels.yml` 为准，并应及时修正文档。

具体仓库自行维护的扩展标签，以该仓库明确指定的标签配置文件或维护文档为准。

## 4. 核心原则

### 4.1 标签必须具有操作价值

每个标签至少应支持以下一种用途：

* 跨仓库搜索；
* Issue 分流；
* Pull Request 评审；
* 路线图或发布管理；
* 自动化；
* 贡献者任务发现；
* 关闭原因统计；
* 维护责任划分。

不得仅为了分类完整、视觉美观或临时讨论而创建标签。

### 4.2 标签含义必须明确

标签名称和描述必须足以说明其用途。

不得依赖颜色表达标签含义。颜色只用于辅助识别，不是权威信息。

语义重叠的标签应当合并，不得长期并存。

### 4.3 优先使用 GitHub 原生能力

以下信息已有更合适的表达方式时，不应重复建立标签：

| 信息      | 推荐方式                        |
| ------- | --------------------------- |
| 负责人     | Assignee                    |
| 开发是否进行中 | Assignee、分支或关联 Pull Request |
| 计划版本    | Milestone                   |
| 项目工作流状态 | GitHub Projects             |
| 完成与未完成  | Issue 或 Pull Request 状态     |
| 正式架构决定  | ADR 文档                      |
| 正式变更提案  | RFC 文档                      |
| 规范性要求   | Specification               |
| 安全漏洞细节  | 私密安全报告                      |

### 4.4 标签应当跨仓库一致

组织级标签在不同仓库中必须保持：

* 相同名称；
* 相同含义；
* 相同颜色；
* 相同描述；
* 相同基本使用规则。

仓库不得把同名组织级标签用于不同含义。

### 4.5 标签数量应当受控

组织级标签只保留具有跨仓库价值的维度。

仓库级扩展标签应对应稳定的模块、包、平台或维护边界，不得为每个目录、文件、功能点或临时任务建立标签。

## 5. 标签系列

组织级标签按以下系列管理：

* `type:*`：主要工作类型；
* `status:*`：当前主要处理状态；
* `priority:*`：维护者确认的处理优先级；
* 贡献入口标签；
* `impact:*`：可能受到影响的质量属性；
* `process:*`：与正式流程的关系；
* `resolution:*`：非普通完成方式的关闭原因。

具体可用标签以 `.github/labels.yml` 为准。

## 6. `type:*`：工作类型

`type:*` 表示 Issue 或 Pull Request 的主要工作类型。

每个 Issue 或 Pull Request 原则上必须有且只有一个 `type:*` 标签。

示例：

```text
type: bug
type: feature
type: docs
type: data
type: research
type: refactor
type: test
type: maintenance
type: dependencies
```

### 6.1 类型选择规则

#### `type: bug`

用于：

* 已有行为错误；
* 与文档或规范不一致；
* 回归；
* 明确的实现缺陷。

不用于尚未实现的新能力。

#### `type: feature`

用于：

* 新增用户能力；
* 改进现有功能；
* 扩展公共接口；
* 改善用户工作流。

#### `type: docs`

用于：

* 文档新增或修订；
* 示例；
* 翻译；
* 注释和说明；
* 不改变知识数据本身的术语说明。

#### `type: data`

用于：

* 术语数据；
* 映射表；
* 常量；
* 规则表；
* 典籍元数据；
* 其他会影响计算或查询结果的知识数据。

仅修改知识数据的说明文字时，应使用 `type: docs`。

#### `type: research`

用于：

* 尚需查证资料的问题；
* 需要比较不同实现或流派的问题；
* 无法立即判断是 Bug、Feature 还是 Specification 变更的问题；
* 需要建立证据后才能进入实现的事项。

开放式交流、普通提问和没有明确交付目标的讨论应进入 Discussions。

#### `type: refactor`

用于不应改变外部可观察行为的内部结构调整。

如果重构同时修复错误或增加功能，应根据主要目标选择 `type: bug` 或 `type: feature`，并在描述中说明重构范围。

#### `type: test`

用于主要交付物是测试、测试数据或验证基础设施的事项。

功能或 Bug 修复附带测试时，不需要额外使用 `type: test`。

#### `type: maintenance`

用于：

* CI；
* 仓库配置；
* 构建工具；
* 自动化；
* 常规维护；
* 不属于依赖更新的开发基础设施调整。

#### `type: dependencies`

用于依赖的新增、升级、降级、替换或删除。

如果依赖变更只是完成某个 Bug 修复或功能的内部步骤，应使用主要工作类型。

### 6.2 类型冲突

当一个事项似乎符合多个类型时，应选择最能表达主要交付结果的类型。

不得同时添加多个 `type:*` 来回避判断。确实包含多个独立目标时，应考虑拆分 Issue 或 Pull Request。

## 7. `status:*`：处理状态

`status:*` 表示事项当前主要需要什么，或者为什么暂时不能推进。

一个 Issue 原则上最多保留一个 `status:*` 标签。

示例：

```text
status: needs triage
status: needs information
status: needs reproduction
status: needs decision
status: ready
status: blocked
status: waiting upstream
```

### 7.1 推荐流转

新建 Issue 通常从以下状态开始：

```text
status: needs triage
```

完成初步分流后，应将其替换为最符合当前情况的状态：

```text
status: needs information
status: needs reproduction
status: needs decision
status: ready
status: blocked
status: waiting upstream
```

状态变化时应移除旧状态，不应长期叠加多个互相冲突的 `status:*`。

### 7.2 状态使用要求

#### `status: needs triage`

表示尚未确认：

* Issue 是否有效；
* 主要类型；
* 所属仓库；
* 处理范围；
* 是否接受；
* 后续处理方式。

完成首次分流后应移除此标签。

#### `status: needs information`

表示缺少继续判断或处理所必需的信息。

维护者应在评论中明确说明需要补充什么，不得只添加标签而不提供说明。

#### `status: needs reproduction`

表示需要：

* 最小复现；
* 独立复现；
* 更完整的输入；
* 环境信息；
* 可验证的失败结果。

#### `status: needs decision`

表示问题已经足够明确，但必须先作出架构、规范、范围或治理决定。

涉及重大变更时，应在评论中说明是否需要 Issue、Discussion、RFC 或其他决策载体。

#### `status: ready`

表示：

* 问题已经确认；
* 范围已经明确；
* 验收条件基本清楚；
* 没有已知阻塞；
* 可以开始实现。

`status: ready` 不代表任何人已经认领，也不保证改动一定会被合并。

#### `status: blocked`

必须存在明确的阻塞事项，例如：

* 依赖另一个 Issue；
* 等待 RFC 决定；
* 等待必要权限；
* 等待基础设施变更；
* 依赖尚未完成的迁移。

添加时必须在评论或 Issue 描述中链接阻塞事项。

#### `status: waiting upstream`

用于等待外部项目、平台或依赖处理。

应当链接上游 Issue、Pull Request、安全公告或其他可追踪来源。

### 7.3 不使用 `status: in progress`

正在开发由以下信息表达：

* Assignee；
* 关联分支；
* 关联 Pull Request；
* GitHub Project 状态。

不得为了表达“正在处理”新增组织级 `status: in progress` 标签。

## 8. `priority:*`：优先级

`priority:*` 表示维护者确认后的组织或仓库处理优先级。

示例：

```text
priority: critical
priority: high
priority: medium
priority: low
```

### 8.1 权限

优先级只能由以下人员设置或修改：

* 仓库维护者；
* Repository Lead；
* 负责分流或路线图管理的指定人员；
* 组织治理明确授权的其他角色。

Issue 提交者可以说明业务或技术影响，但不得自行决定最终优先级。

### 8.2 使用规则

一个事项最多只能有一个 `priority:*` 标签。

不是所有 Issue 都必须设置优先级。没有优先级表示尚未排序，不等于默认中优先级。

优先级应基于：

* 用户影响；
* 安全或数据风险；
* 影响范围；
* 回归严重程度；
* 项目目标；
* 时间敏感性；
* 是否阻塞其他工作；
* 可用维护资源。

不得仅根据评论数量、提交者身份或主观紧迫措辞设置优先级。

### 8.3 `priority: critical`

只应用于需要立即协调的严重情况，例如：

* 正在造成广泛不可用；
* 严重破坏数据正确性；
* 阻塞关键发布；
* 已公开并需要紧急处理的严重安全问题；
* 对多个仓库造成重大影响的回归。

普通重要功能不得标记为 `priority: critical`。

## 9. 贡献入口标签

MathArts 保留 GitHub 约定的以下标签名称：

```text
good first issue
help wanted
```

不得为它们增加组织前缀，以保持 GitHub 贡献入口兼容性。

### 9.1 `good first issue`

只能由维护者添加。

使用前应确认：

* 已完成分流；
* 工作范围较小；
* 验收条件明确；
* 不依赖尚未决定的架构或规范；
* 已提供必要上下文；
* 维护者能够提供评审；
* 对首次贡献者不要求掌握过多隐性知识。

通常应同时具有：

```text
status: ready
```

仅仅“实现简单”不足以成为 `good first issue`。缺少说明、边界不清或无人评审的任务不适合作为首次贡献入口。

### 9.2 `help wanted`

表示维护者明确欢迎外部贡献，并有能力处理后续评审。

使用前应确认：

* 项目愿意接受该方向的改动；
* 事项没有隐藏的重大决策；
* 维护者能够回答必要问题；
* 贡献者不会在完成后才得知方案不被接受。

`help wanted` 不等于低难度，也不要求同时使用 `good first issue`。

## 10. `impact:*`：影响维度

`impact:*` 表示问题或变更可能影响的质量属性。

多个 `impact:*` 可以同时存在。

示例：

```text
impact: breaking
impact: security
impact: performance
impact: data integrity
impact: compatibility
impact: deprecation
```

### 10.1 使用要求

#### `impact: breaking`

表示可能破坏：

* 公共 API；
* 配置格式；
* 数据格式；
* 用户可见行为；
* 已有计算结果；
* 下游实现兼容性。

该标签表示需要兼容性审查，不表示 Breaking Change 已经获得批准。

#### `impact: security`

只能用于公开事项，例如：

* 已披露漏洞的修复或后续工作；
* 普通安全加固；
* 权限边界改进；
* 不包含未公开漏洞细节的任务。

尚未修复或尚未披露的漏洞必须按照 `SECURITY.md` 私密报告，不得进入公开标签流程。

#### `impact: performance`

用于对以下方面存在明显影响的事项：

* 响应时间；
* 吞吐量；
* 内存；
* CPU；
* 存储；
* 网络；
* 构建时间；
* 包体积。

微小或未经测量的差异不应自动使用该标签。

#### `impact: data integrity`

用于可能影响以下内容正确性的事项：

* 知识数据；
* 映射关系；
* 规则表；
* 计算结果；
* 序列化数据；
* 持久化数据；
* 数据迁移。

#### `impact: compatibility`

用于涉及以下兼容性的事项：

* 运行时版本；
* 操作系统；
* 浏览器；
* 数据格式；
* 上下游实现；
* 历史版本；
* 第三方依赖。

#### `impact: deprecation`

用于：

* 新增弃用通知；
* 调整弃用周期；
* 移除已弃用能力；
* 修改替代方案；
* 影响迁移计划。

## 11. `process:*`：正式流程

`process:*` 表示事项与正式决策、规范、发布或治理流程存在直接关系。

多个 `process:*` 可以组合，但只应添加与当前事项真正有关的标签。

示例：

```text
process: rfc
process: adr
process: specification
process: release
process: governance
```

### 11.1 使用边界

#### `process: rfc`

用于已确认进入 RFC 流程的事项。

普通功能建议、开放讨论或设计草案不得仅因为“比较重要”就自动标记为 RFC。

#### `process: adr`

用于：

* 创建 ADR；
* 更新 ADR 状态；
* 落实已接受的架构决定；
* 修正已有 ADR 的记录问题。

ADR 用于记录已经作出的决定，不得通过添加此标签把未决定方案描述为既定架构。

#### `process: specification`

用于涉及以下内容的事项：

* 规范性术语；
* 必须遵守的行为；
* 数据格式；
* 兼容性要求；
* 外部实现约束；
* 规范版本演进。

实现与现有 Specification 保持一致的普通 Bug 修复，不一定需要此标签。

#### `process: release`

用于：

* 版本准备；
* 发布检查；
* Changelog；
* Release Notes；
* Migration Guide；
* 发布阻塞问题；
* 发布后验证；
* 回滚或补丁发布。

#### `process: governance`

用于：

* 组织级政策；
* 维护者角色；
* 权限；
* 仓库生命周期；
* 贡献流程；
* 社区健康文件；
* 跨仓库治理规则。

项目内部普通配置变更不应使用此标签。

## 12. `resolution:*`：关闭原因

`resolution:*` 表示事项关闭，但未按普通完成方式处理。

示例：

```text
resolution: duplicate
resolution: not planned
resolution: cannot reproduce
resolution: superseded
```

一个关闭事项原则上最多使用一个 `resolution:*`。

已经通过代码、文档或其他交付物正常完成的事项，不需要添加 `resolution:*`。

### 12.1 使用要求

#### `resolution: duplicate`

必须：

* 链接继续承载该问题的权威 Issue 或 Pull Request；
* 确认两个事项的核心问题确实相同；
* 在必要时把新增信息迁移到权威事项。

#### `resolution: not planned`

必须说明不继续处理的理由，例如：

* 超出仓库范围；
* 与项目方向不符；
* 维护成本不可接受；
* 已有足够替代方案；
* 当前阶段不具备必要资源；
* 兼容性风险大于收益。

不得只添加标签而不说明原因。

#### `resolution: cannot reproduce`

关闭前应尽可能说明：

* 测试环境；
* 尝试过的步骤；
* 缺少的信息；
* 重新开启所需的材料。

如果只是暂时缺少信息，应优先使用 `status: needs information`，而不是立即关闭。

#### `resolution: superseded`

必须链接替代该事项的新设计、RFC、Specification、Issue、Pull Request 或实现。

## 13. Issue 与 Pull Request 的差异

### 13.1 Issue

Issue 标签主要用于表达：

* 工作类型；
* 当前是否可以推进；
* 优先级；
* 对外贡献机会；
* 影响范围；
* 正式流程；
* 关闭原因。

### 13.2 Pull Request

Pull Request 通常需要：

* 一个 `type:*`；
* 必要的 `impact:*`；
* 必要的 `process:*`；
* 在需要补充测试或文档时使用对应状态或评审要求。

Pull Request 一般不使用：

* `status: needs triage`；
* `status: needs reproduction`；
* `resolution:*`；
* `good first issue`；
* `help wanted`。

Pull Request 是否准备好合并，应由 Draft 状态、Review、Required Checks 和分支保护规则表达，不应创建重复标签。

## 14. 自动标签

Issue Forms 可以自动添加：

* 一个明确的 `type:*`；
* `status: needs triage`。

例如，Bug 表单可以自动添加：

```yaml
labels:
  - "type: bug"
  - "status: needs triage"
```

功能建议表单可以自动添加：

```yaml
labels:
  - "type: feature"
  - "status: needs triage"
```

当一个表单同时覆盖多个类型时，不应自动添加可能错误的 `type:*`。例如，文档和知识数据共用表单时，可以只添加：

```yaml
labels:
  - "status: needs triage"
```

维护者完成分流后再补充 `type: docs` 或 `type: data`。

Issue Forms 不应允许提交者自行设置：

* `priority:*`；
* `good first issue`；
* `help wanted`；
* `resolution:*`；
* 需要维护者确认的正式流程标签。

## 15. 仓库级扩展

具体仓库可以根据真实需要增加以下前缀：

```text
area:*
package:*
platform:*
upstream:*
```

### 15.1 `area:*`

用于稳定的功能或维护边界，例如：

```text
area: calendar
area: parser
area: api
area: documentation
```

规则：

* 应对应稳定的代码、文档或责任边界；
* 建议每个仓库不超过 8–12 个；
* 不得为每个目录或文件建立标签；
* 不得与 `type:*` 重复。

### 15.2 `package:*`

仅适用于 Monorepo 或多包仓库，例如：

```text
package: core
package: cli
package: web
```

包数量很多时，应只为需要独立筛选和维护的包建立标签。

### 15.3 `platform:*`

只在问题已经确认与特定平台有关时使用，例如：

```text
platform: browser
platform: node
platform: windows
platform: linux
```

不得仅因为报告者使用某个平台就自动添加标签。

### 15.4 `upstream:*`

仅在某个上游依赖长期存在大量关联事项时使用。

普通依赖问题应通过链接上游 Issue 表达，不应为每个依赖建立标签。

## 16. 不得创建的标签

原则上不得新增以下标签：

* 与现有标签同义的标签；
* 只用于一次性活动的标签；
* 只表达人员或团队名称的标签；
* 只表达当前负责人或开发进度的标签；
* 没有明确筛选、自动化或治理用途的标签；
* 将未公开安全漏洞暴露到公开仓库的标签；
* 与 Milestone、Assignee、Project 或原生状态重复的标签。

以下标签不作为组织级标签使用：

```text
in progress
assigned
question
invalid
wontfix
stale
urgent
version:*
```

其中：

* 使用 Assignee、分支和 Pull Request 表达进行状态；
* 普通问题和开放讨论优先进入 Discussions；
* 使用具体的 `resolution:*` 替代 `invalid` 和 `wontfix`；
* 版本计划使用 Milestone；
* 优先级使用 `priority:*`；
* `stale` 只能由明确、经过审查的自动化策略管理，不得作为问题价值判断。

## 17. 标签权限

### 17.1 所有贡献者

贡献者可以：

* 在 Issue 或 Pull Request 中建议适合的标签；
* 提醒维护者标签可能不准确；
* 提议新增或调整标签体系。

贡献者不得通过标签宣告：

* 提案已经接受；
* RFC 已经通过；
* Breaking Change 已经批准；
* Issue 已经达到最高优先级；
* 自己拥有某项维护权限。

### 17.2 分流人员和维护者

获得仓库分流权限的人员可以：

* 添加和移除类型、状态和影响标签；
* 设置优先级；
* 标记贡献入口；
* 标记正式流程；
* 设置关闭原因；
* 修正错误标签。

### 17.3 组织级标签维护者

只有 MathArts 组织明确授权的维护者可以：

* 修改 `.github/labels.yml`；
* 新增或删除组织级标签；
* 修改标签名称、颜色、描述和别名；
* 调整跨仓库同步机制；
* 批准标签迁移方案。

## 18. 新增组织级标签

新增组织级标签必须满足：

1. 至少适用于多个活跃仓库；
2. 具有明确且不重叠的含义；
3. 支持实际筛选、自动化或治理需求；
4. 无法由现有标签或 GitHub 原生能力合理表达；
5. 有明确维护者；
6. 不会暴露敏感信息；
7. 已说明与现有标签的组合和互斥关系。

新增提案应说明：

* 标签名称；
* 标签系列；
* 使用场景；
* 不适用场景；
* 与现有标签的差异；
* 预计使用的仓库；
* 是否需要迁移旧标签；
* 是否需要修改 Issue Forms 或自动化；
* 谁负责后续维护。

只在单个仓库使用的标签，应优先作为仓库级扩展，不应进入组织级清单。

## 19. 修改、重命名和删除

### 19.1 修改描述或颜色

不改变标签含义时，可以直接修改描述或颜色，但应检查：

* Issue Forms；
* 自动化工作流；
* 项目过滤条件；
* 文档；
* 跨仓库同步配置。

### 19.2 重命名

重命名标签前必须确认：

* 新名称更准确；
* 不会与其他标签冲突；
* 自动化和筛选条件已经更新；
* 是否需要使用别名迁移；
* 是否会影响已有 Issue 和 Pull Request。

别名只用于明确的一对一迁移，不得把多个语义不同的旧标签自动合并为一个新标签。

### 19.3 废弃

标签不再推荐使用但暂时不能删除时，应：

1. 停止在 Issue Forms 和自动化中新增；
2. 在治理记录中标明替代标签；
3. 迁移已有事项；
4. 检查跨仓库使用情况；
5. 在迁移完成后删除。

不得通过在标签名称中加入 `deprecated` 长期保留废弃标签。

### 19.4 删除

删除前必须确认：

* 已有事项已经迁移；
* Issue Forms 不再引用；
* 自动化不再引用；
* 文档不再引用；
* Project 和搜索条件不再依赖；
* 不会丢失仍有价值的关闭原因或历史分类。

不能确定标签实际含义时，不得批量自动迁移，应逐项判断。

## 20. 旧标签迁移

默认 GitHub 标签应按实际语义迁移。

推荐关系：

| 旧标签                | 目标                        |
| ------------------ | ------------------------- |
| `bug`              | `type: bug`               |
| `enhancement`      | `type: feature`           |
| `documentation`    | `type: docs`              |
| `duplicate`        | `resolution: duplicate`   |
| `wontfix`          | `resolution: not planned` |
| `good first issue` | 保留                        |
| `help wanted`      | 保留                        |

以下标签不得统一自动映射：

### `invalid`

它可能表示：

* 重复问题；
* 无法复现；
* 超出范围；
* 信息不足；
* 当前不计划处理；
* 误解项目用途。

必须逐项判断并选择具体状态或关闭原因。

### `question`

它可能表示：

* 使用求助；
* 开放讨论；
* 缺少信息；
* 文档不足；
* 研究问题。

应根据内容转移到 Discussions、改为 `status: needs information`，或选择适当工作类型。

## 21. 跨仓库同步

`.github/labels.yml` 定义组织级标签，但标签仍需应用到各个仓库。

同步机制必须满足：

* 以 `.github/labels.yml` 为输入；
* 不在各仓库复制独立组织级清单；
* 对删除和重命名采取审慎策略；
* 能够识别同步失败；
* 不覆盖仓库允许保留的扩展标签；
* 不因单次配置错误批量破坏所有仓库标签。

同步范围应明确区分：

* 活跃仓库；
* 归档仓库；
* 镜像仓库；
* 实验仓库；
* 不接受公开贡献的仓库。

更换同步工具时，不得改变 `.github/labels.yml` 的权威地位，除非先完成正式治理变更。

## 22. 定期审查

组织级标签至少每六个月审查一次，也可以在以下情况发生时提前审查：

* 多个仓库出现同义标签；
* 维护者经常无法判断标签边界；
* Issue Forms 与标签体系不一致；
* 标签长期没有使用；
* 自动化频繁使用错误标签；
* 引入新的 Issue Types、Issue Fields 或 Projects 工作流；
* 新增重要仓库类型；
* 发布或治理流程发生变化；
* 安全事件暴露出公开标签风险。

审查至少包括：

* 标签使用次数；
* 最近使用时间；
* 跨仓库一致性；
* 语义重叠；
* 自动化引用；
* Issue Forms 引用；
* 是否仍有明确维护价值；
* 是否需要迁移、合并或删除。

低使用频率不自动意味着标签应删除。正式流程或严重影响标签可能使用较少，但仍具有重要治理价值。

## 23. 维护责任

MathArts 组织维护者负责：

* 维护 `.github/labels.yml`；
* 维护本文件；
* 管理跨仓库同步机制；
* 审查组织级标签变更；
* 协调旧标签迁移；
* 定期检查标签一致性。

各仓库维护者负责：

* 完成 Issue 首次分流；
* 正确使用组织级标签；
* 维护仓库级扩展标签；
* 清理互斥或过期状态；
* 确保 Issue Forms 使用有效标签；
* 说明关闭原因；
* 反馈组织级标签缺口。

贡献者负责：

* 使用正确的 Issue Form；
* 提供足以完成分流的信息；
* 不通过标签夸大优先级或正式状态；
* 在发现分类错误时提供善意反馈。

## 24. 文件维护

本文件出现以下情况时必须更新：

* 新增、删除或重命名标签系列；
* 修改标签互斥或组合规则；
* 调整标签权限；
* 修改 Issue Forms 自动标签；
* 引入或移除跨仓库同步机制；
* 引入组织级 Issue Types 或 Issue Fields；
* 修改仓库级扩展前缀；
* 调整旧标签迁移规则；
* 定期审查发现流程缺口。

修改本文件时，应同时检查：

* `.github/labels.yml`；
* `.github/ISSUE_TEMPLATE/`；
* `.github/pull_request_template.md`；
* `CONTRIBUTING.md`；
* 标签同步工作流；
* 使用标签筛选条件的 GitHub Projects 或自动化。
