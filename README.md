# useful_tool

个人实用工具集合。

## cc-switch

Claude Code / Codex 配置切换工具，用于在多个 AI 编程助手配置之间快速切换。

### 安装

```bash
sudo cp cc-switch/cc-switch /usr/bin/cc-switch
sudo chmod +x /usr/bin/cc-switch
```

配置文件会自动生成在 `~/.cc-switch/`。

### 使用

启动后通过系统托盘图标操作，支持：
- Claude Code / Codex 配置文件切换
- 配置备份与恢复
- 多 Profile 管理

---

## Watt Toolkit (Steam++)

Steam 网络加速工具，解决 Steam 社区、商店等页面访问问题。

### 安装 & 运行

```bash
cd watt_toolkit
chmod +x Steam++.sh
./Steam++.sh
```

需要系统已安装 .NET 运行时（dotnet 目录内已包含运行时）。

---

## 系统要求

- **架构**: ARM aarch64 (Linux)
- **系统**: Ubuntu / Debian 系 Linux，或 Jetson (Tegra)
- cc-switch: 无额外依赖
- Watt Toolkit: 已内置 .NET 运行时
