vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup {
  filters = { dotfiles = false },
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    width = 30,
    preserve_window_proportions = true,
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      glyphs = {
        default = "󰈚",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
        },
        git = {
          unstaged = "✗",     -- belum di stage
          staged = "✓",       -- sudah di stage
          unmerged = "",     -- konflik merge
          renamed = "➜",      -- rename
          untracked = "★",    -- file baru yang belum di track (ini bintang)
          deleted = "",
          ignored = "◌",
        },
      },
    },
  }
}
