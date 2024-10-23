local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  local buf_set_keymap = vim.api.nvim_buf_set_keymap

  -- Go to definition
  buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  
  -- Hover documentation
  buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  
  -- Show function signature help
  buf_set_keymap(bufnr, 'n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- List references
  buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- Rename symbol
  buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

-- Use on_attach on setup server LSP
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.ts_ls.setup{
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Disable LS in Javascript
    if vim.bo[bufnr].filetype == "javascript" then
      client.server_capabilities.document_formatting = false
    end
  end,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
}

lspconfig.eslint.setup({
  filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.tailwindcss.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.volar.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.html.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.cssls.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

