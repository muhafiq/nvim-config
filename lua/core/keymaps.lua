vim.cmd [[ set number ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.fillchars = { eob = " " }
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Comment
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Nvim tree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Go to normal mode
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = true })

-- Save with ctrl + s
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

-- terminal
vim.keymap.set("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
vim.keymap.set("n", "<leader>h", function()
  require("nvterm.terminal").new "horizontal"
end, { desc = "terminal new horizontal term" })

vim.keymap.set("n", "<leader>v", function()
  require("nvterm.terminal").new "vertical"
end, { desc = "terminal new vertical window" })

-- Move tab Bufferline
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

