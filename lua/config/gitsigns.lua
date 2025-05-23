require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '│' },
    change = { hl = 'GitGutterChange', text = '│' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
  current_line_blame = true, -- blame on the left
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- end of line
    delay = 500,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
}
