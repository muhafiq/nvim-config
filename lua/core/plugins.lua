local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'  
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'neovim/nvim-lspconfig'  -- LSP config plugin
  use {
    'hrsh7th/nvim-cmp',          -- Autocompletion plugin
    requires = {
      'hrsh7th/cmp-nvim-lsp',    -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',      -- Buffer source for nvim-cmp
      'hrsh7th/cmp-path',        -- Path source for nvim-cmp
      'hrsh7th/cmp-cmdline',     -- Command-line source for nvim-cmp
      'saadparwaiz1/cmp_luasnip',-- Snippet completions
      'L3MON4D3/LuaSnip',        -- Snippet engine
    }
  }
  -- use {
  --   "Exafunction/codeium.nvim",
  --   requires = {
  --       "nvim-lua/plenary.nvim",
  --       "hrsh7th/nvim-cmp",
  --   },
  -- }
  use 'onsails/lspkind.nvim'
  use 'zbirenbaum/nvterm'
  use { 
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use {
    'akinsho/bufferline.nvim', 
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use 'github/copilot.vim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
