# 🚀 Neovim Configuration

A modular and modern Neovim setup written in **Lua**, optimized for full-stack and backend development (including dedicated **Java/JDTLS** integration) and managed using [lazy.nvim](https://github.com/folke/lazy.nvim).

## 🛠️ Prerequisites

To ensure all LSP servers, syntax highlighters, and statusline icons work seamlessly, make sure you have the following installed on your system:

* **Neovim** (v0.9.5 or higher recommended)

* **Git**

* **A Nerd Font** (e.g., *JetBrains Mono Nerd Font*, *FiraCode Nerd Font*) for icons.

* **Java Development Kit (JDK 17+)** (required for `jdtls` Java language server).

* **C Compiler & Build Tools** (`gcc`, `make`, `unzip`, `curl` for Treesitter/Mason compilations).

## 📦 Quick Start Installation

Follow these steps to set up this configuration on any Linux or macOS machine:

### 1. Backup existing Neovim files (Optional)

```
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

```

### 2. Clone the Repository

Clone this repository directly into your Neovim configuration directory:

```
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git ~/.config/nvim

```

*(Replace `YOUR_USERNAME/YOUR_REPO_NAME.git` with your actual GitHub repository URL).*

### 3. Launch Neovim

```
nvim
```

On first launch, **lazy.nvim** will automatically bootstrap itself and begin downloading all required plugins. Restart Neovim once the installation finishes.

## 📁 Repository Structure

```
~/.config/nvim/
├── init.lua                   # Entry point (bootstraps lazy.nvim and loads configs)
├── lua/
│   ├── config/
│   │   ├── options.lua        # Vim options and global settings
│   │   ├── keymaps.lua        # Global keybindings
│   │   └── autocmds.lua       # Auto-command
│   ├── plugins/               # Plugin specifications for lazy.nvim
│   └── jdtls.lua              # Java LSP (JDTLS), Lombok, and Debugger setup
└── README.md
```

## ⚙️ Features & Key Plugins

* **Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)

* **Statusline:** [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) with custom transparent theme integration.

* **Java LSP & DAP:** Built-in Java support via `nvim-jdtls`, integrated with Mason, Lombok support, and debugging capabilities.

* **Completion & Snippets:** Powered by `nvim-cmp` and `cmp_nvim_lsp`.
