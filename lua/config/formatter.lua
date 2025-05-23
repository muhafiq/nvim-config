local null_ls = require("null-ls")

require("mason-null-ls").setup({
  ensure_installed = { "prettierd" }, -- bisa ditambah formatter lain
  automatic_installation = true,
})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- format otomatis saat save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

