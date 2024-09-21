require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua", "vim", "javascript"},

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
