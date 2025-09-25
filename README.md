<img src="./image/line-neon.gif" width=100%><br>

<div id="user-content-toc">
  <ul align="center">
    <summary><h1 style="display: inline-block"><b>🌠 My NeoVim Configuration</b></h1></summary>
    <a href="https://github.com/LulietLyan/nvim"><strong>查看文档 »</strong></a>
    <br />
    <a href="https://github.com/LulietLyan/nvim">演示</a>
    &middot;
    <a href="https://github.com/LulietLyan/nvim/issues/new?labels=bug&template=bug-report---.md">Bugs</a>
    &middot;
    <a href="https://github.com/LulietLyan/nvim/issues/new?labels=enhancement&template=feature-request---.md">特性</a>
  </ul>
</div>

<p align="center"> 
    <img src="https://img.shields.io/github/followers/LulietLyan?label=Followers&style=for-the-badge&color=purple"alt="github follow"/>
    <img src="https://img.shields.io/github/stars/LulietLyan/nvim?label=Stars&style=for-the-badge"
    alt="github repo stars" >
    <img src="https://img.shields.io/github/contributors/LulietLyan/nvim?style=for-the-badge&logoColor=%23985684"
    alt="contributors" >
    <img src="https://img.shields.io/github/issues-pr/LulietLyan/nvim?style=for-the-badge&color=%23985684"
    alt="issues-pr" >
    <img src="https://img.shields.io/github/issues/LulietLyan/nvim?style=for-the-badge&color=%23777777" 
    alt="issues" >
    <img src="https://img.shields.io/github/forks/LulietLyan/nvim?style=for-the-badge&color=%23187777" 
    alt="forks" >
    <img src="https://img.shields.io/badge/Contributions-Welcome-%23028745?style=for-the-badge&labelColor=%23b08f42"
    alt="contribution"/>
    <img src="https://img.shields.io/badge/Star-IfYouLike-%23067897?style=for-the-badge&labelColor=%23879078"
    alt="star"/>
    <img src="https://img.shields.io/github/license/LulietLyan/nvim?style=for-the-badge"
    alt="license" >
</p>

<p align="center"> 
<a href="https://github.com/LulietLyan/nvim"><img src="./image/SYSU.svg" height=50pt alt="lulietlyan" /></a>
<a href="https://github.com/LulietLyan/nvim"><img src="./image/NSCC-GZ.svg" height=50pt alt="lulietlyan" /></a>
</p>

<img src="./image/line-neon.gif" width=100%><br>

# 📕 目录
- [📕 目录](#-目录)
- [🤔 项目背景](#-项目背景)
  - [设计理念](#设计理念)
  - [核心特性](#核心特性)
- [😋 快速上手指南](#-快速上手指南)
  - [系统要求](#系统要求)
  - [安装步骤](#安装步骤)
  - [配置说明](#配置说明)
- [🔧 插件配置](#-插件配置)
  - [LSP 语言服务器](#lsp-语言服务器)
  - [代码格式化](#代码格式化)
  - [文件管理](#文件管理)
  - [界面美化](#界面美化)
- [⌨️ 快捷键说明](#️-快捷键说明)
  - [Windows 风格快捷键](#windows-风格快捷键)
  - [LSP 相关快捷键](#lsp-相关快捷键)
  - [文件操作快捷键](#文件操作快捷键)
- [🎨 主题配置](#-主题配置)
- [❓ 待办事项](#-待办事项)
- [🤝 代码贡献](#-代码贡献)
  - [代码贡献人员](#代码贡献人员)


# 🤔 项目背景

这是一个基于 [LazyVim](https://github.com/LazyVim/LazyVim) 的现代化 NeoVim 配置，专为中文用户优化，提供了完整的开发环境配置。该配置集成了众多优秀的插件，为开发者提供了高效、美观的代码编辑体验。

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

## 设计理念

- **开箱即用**: 无需复杂配置，克隆即可使用
- **性能优先**: 基于 LazyVim 的懒加载机制，启动速度快
- **中文友好**: 针对中文用户习惯优化的快捷键和界面
- **模块化设计**: 插件配置清晰分离，易于维护和定制
- **跨平台兼容**: 支持 Windows、macOS 和 Linux 系统

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

## 核心特性

- 🚀 **快速启动**: 基于 LazyVim 的懒加载，启动时间 < 100ms
- 🎨 **美观界面**: 集成 Dashboard、状态栏、语法高亮等
- 🔧 **智能补全**: 支持多种语言的 LSP 和代码补全
- 📝 **自动格式化**: 保存时自动格式化代码
- 💾 **自动保存**: 智能自动保存，防止数据丢失
- 🔍 **强大搜索**: 基于 Telescope 的文件和内容搜索
- 🎯 **精准导航**: 支持文件树、符号跳转、定义跳转等
- 🐛 **调试支持**: 集成 DAP 调试器
- 📊 **Git 集成**: 内置 Git 状态显示和操作
- 🎪 **主题丰富**: 支持多种颜色主题

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

# 😋 快速上手指南

## 系统要求

- **NeoVim**: 版本 >= 0.9.0
- **Git**: 用于克隆仓库和插件管理
- **Node.js**: 版本 >= 16.0.0 (用于某些 LSP 服务器)
- **Python**: 版本 >= 3.8 (用于 Python 开发)
- **系统**: Windows 10+, macOS 10.15+, 或 Linux

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

## 安装步骤

### 1. 备份现有配置

```bash
# 如果已有 NeoVim 配置，请先备份
mv ~/.config/nvim ~/.config/nvim.backup
```

### 2. 克隆配置

```bash
# 克隆到 NeoVim 配置目录
git clone https://github.com/LulietLyan/nvim.git ~/.config/nvim
```

### 3. 启动 NeoVim

```bash
# 启动 NeoVim，插件会自动安装
nvim
```

### 4. 等待插件安装

首次启动时，LazyVim 会自动安装所有插件，请耐心等待安装完成。

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

## 配置说明

### 配置文件结构

```
~/.config/nvim/
├── init.lua              # 主入口文件
├── lazy-lock.json        # 插件版本锁定
├── lua/
│   ├── config/           # 基础配置
│   │   ├── options.lua   # 编辑器选项
│   │   ├── keymaps.lua   # 快捷键配置
│   │   ├── autocmds.lua  # 自动命令
│   │   └── lazy.lua      # LazyVim 配置
│   └── plugins/          # 插件配置
│       ├── colorscheme.lua    # 主题配置
│       ├── lsp.lua            # LSP 配置
│       ├── telescope.lua      # 文件搜索
│       ├── formatting.lua     # 代码格式化
│       ├── autosave.lua       # 自动保存
│       └── ...               # 其他插件
```

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

# 🔧 插件配置

## LSP 语言服务器

配置支持多种编程语言的 LSP 服务器：

- **Lua**: lua_ls
- **Python**: pyright
- **JavaScript/TypeScript**: tsserver
- **Rust**: rust-analyzer
- **Go**: gopls
- **C/C++**: clangd
- **Java**: jdtls

### 安装 LSP 服务器

```bash
# 在 NeoVim 中运行
:Mason
# 选择需要安装的 LSP 服务器
```

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

## 代码格式化

支持多种语言的自动格式化：

- **Python**: black, isort
- **JavaScript/TypeScript**: prettier
- **Lua**: stylua
- **Rust**: rustfmt
- **Go**: gofmt, goimports
- **C/C++**: clang-format
- **LaTeX**: latexindent

### 格式化快捷键

- `<leader>cf`: 手动格式化当前文件
- 保存时自动格式化（可配置）

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

## 文件管理

- **Telescope**: 强大的文件搜索和内容搜索
- **Diffview**: Git 差异查看
- **Trouble**: 诊断信息显示
- **Outline**: 代码大纲

### 文件操作快捷键

- `<leader>ff`: 查找文件
- `<leader>fg`: 全局搜索
- `<leader>fb`: 查找缓冲区
- `<leader>fh`: 查找帮助

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

## 界面美化

- **Dashboard**: 启动界面
- **Lualine**: 状态栏
- **Bufferline**: 标签栏
- **Indent-blankline**: 缩进线
- **Treesitter**: 语法高亮

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

# ⌨️ 快捷键说明

## Windows 风格快捷键

为了提供熟悉的编辑体验，配置了 Windows 风格的快捷键：

### 基础编辑
- `Ctrl+C`: 复制到系统剪贴板
- `Ctrl+V`: 从系统剪贴板粘贴
- `Ctrl+X`: 剪切到系统剪贴板
- `Ctrl+A`: 全选
- `Ctrl+Z`: 撤销
- `Ctrl+Y`: 重做
- `Ctrl+S`: 保存文件
- `Ctrl+O`: 打开文件
- `Ctrl+N`: 新建文件
- `Ctrl+W`: 关闭窗口
- `Ctrl+Q`: 退出

### 导航
- `Home`: 行首
- `End`: 行尾
- `Ctrl+Home`: 文件开头
- `Ctrl+End`: 文件结尾
- `Page Up/Down`: 翻页

### 搜索替换
- `Ctrl+F`: 查找
- `Ctrl+H`: 查找替换
- `F3`: 查找下一个
- `Shift+F3`: 查找上一个

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

## LSP 相关快捷键

- `F12`: 跳转到定义
- `F2`: 重命名符号
- `Ctrl+Shift+P`: 命令面板
- `Ctrl+Shift+F`: 全局搜索

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

## 文件操作快捷键

- `<leader>ff`: 查找文件
- `<leader>fg`: 全局搜索
- `<leader>fb`: 查找缓冲区
- `<leader>fr`: 最近文件
- `<leader>fc`: 配置文件

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

# 🎨 主题配置

当前配置使用 `torte` 主题，您可以通过以下方式更改主题：

### 更改主题

编辑 `lua/plugins/colorscheme.lua` 文件：

```lua
return {
    "LazyVim/LazyVim",
    opts = {
        colorscheme = "tokyonight", -- 或其他主题名称
    },
}
```

### 支持的主题

- `torte` (默认)
- `tokyonight`
- `catppuccin`
- `onedark`
- `gruvbox`
- 更多主题请参考 LazyVim 文档

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

# ❓ 待办事项

- [ ] 添加更多编程语言的 LSP 配置
- [ ] 优化启动性能
- [ ] 添加更多主题选项
- [ ] 完善调试配置
- [ ] 添加更多代码片段
- [ ] 优化中文输入法支持
- [ ] 添加更多 Git 集成功能

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

# 🤝 代码贡献

欢迎提交 Issue 和 Pull Request 来改进这个配置！

### 贡献指南

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开 Pull Request

### 报告问题

如果您遇到问题，请：

1. 检查 [Issues](https://github.com/LulietLyan/nvim/issues) 是否已有类似问题
2. 提供详细的错误信息和复现步骤
3. 包含您的系统信息和 NeoVim 版本

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

## 代码贡献人员

<a href="https://github.com/LulietLyan/nvim/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=LulietLyan/nvim" alt="contrib.rocks image" />
</a>

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>