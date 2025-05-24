# 🧠 Minimalist Neovim Config

Minimalist adalah konfigurasi Neovim berbasis Lua yang ringan namun cukup lengkap untuk kebutuhan pengembangan modern. Menggunakan [packer.nvim](https://github.com/wbthomason/packer.nvim) sebagai plugin manager, konfigurasi ini mendukung LSP, autocompletion, file explorer, Git integration, dan lainnya.

## ✨ Fitur Utama

- 🎨 **Rose Pine Colorscheme** — tema lembut dan nyaman di mata
- 🌲 **nvim-treesitter** — highlighting berbasis syntax tree
- 🚀 **Built-in LSP** dengan dukungan auto install via Mason
- 🧠 **Autocompletion** dengan `nvim-cmp` dan snippet engine `LuaSnip`
- 🔍 **Telescope** — fuzzy finder cepat dan powerful
- 📁 **nvim-tree** — file explorer dengan icon
- 🧩 **Lualine** — status line yang elegan
- 🐙 **Gitsigns** — git diff dan blame langsung di editor
- 🧵 **Bufferline** — tab antarmuka buffer
- ⚙️ **Null-ls** — formatter dan linter eksternal
- 🖥️ **ToggleTerm** — terminal dalam Neovim

## 📦 Plugin yang Digunakan

| Kategori            | Plugin                                                                                                                                                                                                                                    |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Plugin Manager      | [`wbthomason/packer.nvim`](https://github.com/wbthomason/packer.nvim)                                                                                                                                                                     |
| Syntax Highlighting | [`nvim-treesitter/nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)                                                                                                                                                   |
| LSP Support         | [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig), [`williamboman/mason.nvim`](https://github.com/williamboman/mason.nvim), [`williamboman/mason-lspconfig.nvim`](https://github.com/williamboman/mason-lspconfig.nvim) |
| UI & Theme          | [`rose-pine/neovim`](https://github.com/rose-pine/neovim), [`nvim-lualine/lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim), [`akinsho/bufferline.nvim`](https://github.com/akinsho/bufferline.nvim)                           |
| File Explorer       | [`nvim-tree/nvim-tree.lua`](https://github.com/nvim-tree/nvim-tree.lua)                                                                                                                                                                   |
| Fuzzy Finder        | [`nvim-telescope/telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim)                                                                                                                                                       |
| Git Integration     | [`lewis6991/gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim)                                                                                                                                                                   |
| Autocompletion      | [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) & dependencies                                                                                                                                                                  |
| Snippets            | [`L3MON4D3/LuaSnip`](https://github.com/L3MON4D3/LuaSnip)                                                                                                                                                                                 |
| Formatter & Linter  | [`jose-elias-alvarez/null-ls.nvim`](https://github.com/jose-elias-alvarez/null-ls.nvim), [`jay-babu/mason-null-ls.nvim`](https://github.com/jay-babu/mason-null-ls.nvim)                                                                  |
| Terminal            | [`akinsho/toggleterm.nvim`](https://github.com/akinsho/toggleterm.nvim)                                                                                                                                                                   |
| Icons               | [`nvim-tree/nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons)                                                                                                                                                           |
| Autopairs           | [`windwp/nvim-autopairs`](https://github.com/windwp/nvim-autopairs)                                                                                                                                                                       |

## 🔧 Instalasi

1. Pastikan Neovim versi >= 0.8 terinstall
2. Clone repository ini ke folder `~/.config/nvim`:

```sh
git clone https://github.com/muhafiq/nvim-config.git ~/.config/nvim

```
