local map = vim.keymap.set

-- Config
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.fillchars = { eob = " " }
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Tab config
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
 
-- Keymaps

-- Normal mode and save file
map('i', 'jk', '<Esc>', { noremap = true })
map('n', '<C-s>', '<cmd>w<CR>')

-- Nvim tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<leader>e', function()
  local api = require('nvim-tree.api')
  if not api.tree.is_visible() then
    api.tree.open()
  end
  api.tree.focus()
end, { desc = 'Focus NvimTree' })

-- Bufferline
map('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
-- map('n', '<leader>q', ':bd<CR>', { noremap = true, silent = true })

-- close buffer
map('n', '<leader>q', function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.cmd('bnext')
  vim.cmd('bd ' .. bufnr)
end, { desc = 'Close buffer and move to next' })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Terminal

-- Terminal horizontal (split bawah)
map("n", "<leader>h", function()
  require("toggleterm.terminal").Terminal:new({
    direction = "horizontal",
    close_on_exit = true,
    hidden = true,
  }):toggle()
end, { desc = "Toggle horizontal terminal" })

-- Terminal di tab baru
map("n", "<leader>t", function()
  require("toggleterm.terminal").Terminal:new({
    direction = "tab",
    close_on_exit = true,
    hidden = true,
  }):toggle()
end, { desc = "Toggle terminal in tab" })

--j+k  di terminal mode keluar ke normal mode
map("t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Pindah ke tab page berikutnya dan sebelumnya
map("n", "<leader><Tab>", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<leader><S-Tab>", ":tabprevious<CR>", { desc = "Previous tab" })

-- Shortcut untuk find and replace
vim.keymap.set('n', '<leader>r', function()
  local find = vim.fn.input("Find word: ")
  if find == '' then return end

  local replace = vim.fn.input("Replace with: ")
  if replace == '' then return end

  local confirm = vim.fn.input("Confirm each replacement? (y/n): ")

  local confirm_flag = (confirm == 'y' and 'c') or ''
  local cmd = string.format("%%s/\\<%s\\>/%s/g%s", find, replace, confirm_flag)
  vim.cmd(cmd)
end, { desc = "Interactive find and replace" })
