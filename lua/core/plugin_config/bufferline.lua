require('bufferline').setup{
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "~~~File Explorer~~~",
        highlight = "Directory",
        text_align = "center"
      }
    },
    -- numbers = "buffer_id",
    diagnostics = "nvim_lsp",
    separator_style = "thin", -- "slant", "thick", "thin", "padded_slant", or "none"
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
  }
}
