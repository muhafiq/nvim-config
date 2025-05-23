require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "pyright", "ts_ls" },
  automatic_installation = true,
  automatic_enable = false
}

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Default handler untuk semua LSP
local default_on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
end

-- Konfigurasi LSP server
local servers = { "lua_ls", "pyright", "ts_ls" }
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = default_on_attach,
    capabilities = capabilities
  }
end

