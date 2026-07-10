# .github

本仓库用于维护 **MathArts** GitHub 组织的公共配置与社区文档。

它为组织内未自行覆盖的仓库提供默认 Issue 模板、Pull Request 模板、贡献指南、支持指南、治理入口、安全策略与行为准则，也维护组织主页内容。

## 文档入口

- [组织主页](profile/README.md)
- [贡献指南](CONTRIBUTING.md)
- [支持指南](SUPPORT.md)
- [治理入口](GOVERNANCE.md)
- [行为准则](CODE_OF_CONDUCT.md)
- [安全策略](SECURITY.md)

## 自动化

[文档自动化验证](.github/workflows/validate-documentation.yml)会在相关 Pull Request 和 `main` 分支变更中检查：

- 必需社区文件是否存在且非空；
- GitHub 配置文件的 YAML 语法；
- Markdown 结构与格式；
- 仓库内相对链接和文件引用。

外部链接每周自动检查一次，也可以通过 GitHub Actions 手动执行。
