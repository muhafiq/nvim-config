local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- Luasnip sebagai snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),  -- Scroll ke atas di dokumentasi
    ['<C-f>'] = cmp.mapping.scroll_docs(4),   -- Scroll ke bawah di dokumentasi
    ['<C-Space>'] = cmp.mapping.complete(),   -- Memunculkan manual completion
    ['<C-e>'] = cmp.mapping.close(),          -- Menutup menu completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Pilih item dengan Enter
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()  -- Pilih item berikutnya di menu completion
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()  -- Expand snippet atau lompat
      else
        fallback()  -- Jika tidak ada, gunakan default behavior dari Tab
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()  -- Pilih item sebelumnya di menu completion
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)  -- Lompat ke posisi snippet sebelumnya
      else
        fallback()  -- Jika tidak ada, gunakan default behavior dari Shift+Tab
      end
    end, { 'i', 's' })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP sebagai sumber auto-completion
    { name = 'luasnip' },   -- Snippet sebagai sumber auto-completion
  }, {
    { name = 'buffer' },    -- Buffer sebagai sumber auto-completion
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

return capabilities

