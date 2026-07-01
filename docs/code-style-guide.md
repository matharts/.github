# 代码风格指南

本指南为 MathArts 组织下项目的通用代码风格约定。个别仓库可根据技术栈特点进行补充或覆盖。

## 基本原则

1. **清晰优先**。数术概念本身已经够抽象了，代码应该让读者更容易理解，而不是更难。
2. **命名即文档**。变量名、函数名、类型名应该让不看注释也能猜到含义。
3. **中英映射统一**。所有数术术语在代码中使用拼音或英文标识符，并在术语表中维护与中文原名的对应关系。

## 命名约定

### 术语标识符

数术术语统一使用**拼音**作为代码标识符，保持与中文体系的直接映射：

```typescript
// ✅ 推荐：拼音标识符，含义明确
const tianGan = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"];
const diZhi = ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"];

enum BaGua {
  Qian = "乾",
  Kun = "坤",
  Zhen = "震",
  Xun = "巽",
  Kan = "坎",
  Li = "离",
  Gen = "艮",
  Dui = "兑",
}

// ❌ 避免：意译容易丢失原意或产生歧义
const heavenlyStems = [...];
enum Trigram { Heaven, Earth, ... }
```

**原则**：拼音是"音译"，不会引入英文翻译的歧义。`TianGan` 就是天干，没有第二种理解；而 `HeavenlyStems` 是不是天干，需要读者额外判断。

### 通用命名风格

| 场景           | 风格             | 示例                             |
| -------------- | ---------------- | -------------------------------- |
| 变量、函数     | camelCase        | `getYueJian()`, `tianGanHeHua()` |
| 类、类型、枚举 | PascalCase       | `BaGua`, `LiuYao`, `SiZhu`       |
| 常量           | UPPER_SNAKE_CASE | `TIAN_GAN_COUNT`, `DI_ZHI_COUNT` |
| 文件名         | kebab-case       | `tian-gan.ts`, `ba-gua.ts`       |
| 目录名         | kebab-case       | `liu-yao/`, `si-zhu/`            |

### 函数命名

函数名应明确表达动作：

```typescript
// ✅ 动作清晰
function paiSiZhu(input: BirthTime): SiZhuResult { ... }
function getWuXing(tianGan: TianGan): WuXing { ... }
function isChong(a: DiZhi, b: DiZhi): boolean { ... }

// ❌ 含义模糊
function process(data: any): any { ... }
function calc(input: string): string { ... }
```

## 注释

### 何时写注释

- **术语首次出现时**：简要说明含义与出处。
- **推演规则实现时**：注明理论依据，便于验证。
- **非显而易见的逻辑**：解释"为什么"而不是"是什么"。

```typescript
/**
 * 天干五合
 * 甲己合化土，乙庚合化金，丙辛合化水，丁壬合化木，戊癸合化火。
 * 来源：《滴天髓》
 */
function tianGanWuHe(a: TianGan, b: TianGan): WuXing | null {
  // 合化需满足条件：两干相合且月令透出化神
  // 此处仅判断"合"的关系，化气条件由调用方校验
  ...
}
```

### 注释语言

- 注释使用**中文**。数术概念用中文表达更精确，避免翻译损耗。
- JSDoc / TSDoc 的 `@param`、`@returns` 等标签保留英文关键字，描述用中文。

## 项目结构

各仓库根据实际需要组织，但建议遵循以下通用结构：

```
repo/
├── src/              # 源代码
│   ├── models/       # 数据模型与类型定义
│   ├── engine/       # 推演引擎与核心算法
│   ├── data/         # 静态数据（术语表、映射表等）
│   └── utils/        # 通用工具函数
├── tests/            # 测试
├── docs/             # 文档
├── README.md
├── LICENSE
└── package.json (or cargo.toml, pyproject.toml, etc.)
```

## 类型安全

MathArts 项目推荐使用强类型语言或类型系统：

- **TypeScript** 优先于 JavaScript
- **Rust** 适用于高性能计算引擎
- **Python** 项目应使用 type hints

数术概念之间存在严格的归属关系（天干属五行、地支藏天干等），类型系统能帮助在编译期捕获映射错误。

```typescript
// ✅ 类型约束防止传错参数
function getWuXing(gan: TianGan): WuXing { ... }

// ❌ string 无法防止传入无效值
function getWuXing(gan: string): string { ... }
```

## 格式化

不在代码风格上做人工审查——交给工具：

- **JavaScript / TypeScript**：使用 [oxc](https://oxc.rs/)（oxlint 检查 + oxfmt 格式化）
- **Rust**：使用 `rustfmt` + `clippy`
- **Python**：使用 `ruff`

每个仓库应在根目录配置好格式化工具，并在 CI 中检查。
