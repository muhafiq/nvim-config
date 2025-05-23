require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python", "javascript", "html", "bash" },
  highlight = {
    enable = true,                -- syntax highlighting
    additional_vim_regex_highlighting = false,
  },
}
