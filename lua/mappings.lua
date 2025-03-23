require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Shortcut untuk membuka terminal di tab baru
map('n', '<leader>tt', ':tabnew | terminal<CR>', { noremap = true, silent = true })

-- Opsional: Shortcut untuk membuka terminal di tab baru dan langsung masuk ke mode insert
map('n', '<leader>ti', ':tabnew<CR>:terminal<CR>i', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.opt_local.number = false      -- Nonaktifkan line number
    vim.opt_local.relativenumber = false -- Nonaktifkan relative number
  end,
})
