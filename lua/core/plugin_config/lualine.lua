require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch',{'filename', path=1}},
    lualine_c = {''}
  }
}
