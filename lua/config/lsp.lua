require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "pyright", "ts_ls", "vue_ls", "emmet_ls", "eslint", "svelte", "gopls" },
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
local servers = { "lua_ls", "pyright", "ts_ls", "svelte", "gopls" }
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = default_on_attach,
    capabilities = capabilities
  }
end

-- emmet language server
lspconfig.emmet_language_server.setup {
  on_attach = default_on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
}

-- volar or vue language server
require("lspconfig").volar.setup {
  on_attach = default_on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
  init_options = {
    typescript = {
      tsdk = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"
    }
  }
}
