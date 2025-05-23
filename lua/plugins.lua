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
  -- List plugins here
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'           -- installer LSP & tools
  use 'williamboman/mason-lspconfig.nvim' -- mason + lspconfig
  use { "rose-pine/neovim", name = "rose-pine" }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Autocompletion plugin
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',   -- LSP source
      'hrsh7th/cmp-buffer',     -- Buffer source
      'hrsh7th/cmp-path',       -- Path source
      'hrsh7th/cmp-cmdline',    -- Cmdline source
      'saadparwaiz1/cmp_luasnip', -- Snippet source
      'L3MON4D3/LuaSnip',       -- Snippet engine
      'onsails/lspkind-nvim'
    }
  }
  -- Nvim tree plugin
  use {
    'nvim-tree/nvim-web-devicons', -- icon file
    config = function()
      require('nvim-web-devicons').setup({ default = true })
    end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.nvim-tree')
    end
  }
  -- gitsigns plugin
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.gitsigns')
    end
  }
  -- Bufferline
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  }
  -- End plugins here
  if packer_bootstrap then
    require('packer').sync()
  end
end)
