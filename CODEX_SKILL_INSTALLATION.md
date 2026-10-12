# Codex 技能与协作环境安装记录

## 已安装技能

- `finding-unknowns`：GitHub Codex 插件，包含 `reference-hunt`、`context-audit`、`blindspot-pass` 等未知点查找和上下文审查技能。
- `playwright`：浏览器 DOM 操作、网页测试和自动化。
- `playwright-interactive`：交互式浏览器操作。
- `codex-reasonix-collaboration`：本仓库新增的协作技能，固定用 Codex 规划/终审、Reasonix 执行。

## Serena MCP

Serena 通过 GitHub 官方项目安装，使用 `uv` 安装 `serena-agent`，然后执行：

```powershell
serena init
serena setup codex
```

当前 Codex MCP 名称为 `serena`，启动命令为：

```text
C:\Users\Arjen\.local\bin\serena.exe start-mcp-server --context=codex --project-from-cwd
```

## Reasonix 配置

Reasonix 使用 Codex profile，模型严格固定为 `deepseek-flash`：

```powershell
codex -p reasonix exec "你的执行任务"
```

首次使用协作技能时运行：

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\.codex\skills\codex-reasonix-collaboration\scripts\setup-reasonix.ps1" -PromptForApiKey
```

脚本会让用户交互式输入 `DEEPSEEK_API_KEY`，并保存到当前用户环境变量。API key、认证文件和临时上下文不得提交 Git。

## 固化工作流

1. Codex 检查环境并写 `PLAN.md`。
2. Reasonix 只用 `deepseek-flash`，严格执行计划并运行测试。
3. Codex 检查 `git diff`、测试结果和计划偏差。
4. 复杂架构、安全、迁移和公共 API 决策必须回到 Codex。
