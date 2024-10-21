local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier, -- Prettier sebagai formatter
  },
})

-- Auto format on save
vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.json lua vim.lsp.buf.format({ async = true })
  augroup END
]]

