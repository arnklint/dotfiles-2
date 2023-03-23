local cmp = require 'cmp'
local luasnip = require 'luasnip'

--[[
--
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
--]]

--local cmp = require'cmp'
--local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
--
--cmp.setup({
--  snippet = {
--    -- REQUIRED - you must specify a snippet engine
--    expand = function(args)
--      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--    end,
--  },
--  window = {
--    completion = cmp.config.window.bordered(),
--    documentation = cmp.config.window.bordered(),
--  },
--  mapping = cmp.mapping.preset.insert({
--    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-Space>'] = cmp.mapping.complete(),
--    ['<C-e>'] = cmp.mapping.abort(),
--    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--    ["<Tab>"] = cmp.mapping(
--      function(fallback)
--        cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
--      end,
--      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
--    ),
--    ["<S-Tab>"] = cmp.mapping(
--      function(fallback)
--        cmp_ultisnips_mappings.jump_backwards(fallback)
--      end,
--      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
--    ),
--  }),
--  sources = cmp.config.sources({
--    { name = 'nvim_lsp' },
--    { name = 'ultisnips' }, -- For ultisnips users.
--  }, {
--    { name = 'buffer' },
--  })
--})
--
---- Set configuration for specific filetype.
--cmp.setup.filetype('gitcommit', {
--  sources = cmp.config.sources({
--    { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
--  }, {
--    { name = 'buffer' },
--  })
--})
--
---- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline({ '/', '?' }, {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = 'buffer' }
--  }
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = cmp.config.sources({
--    { name = 'path' }
--  }, {
--    { name = 'cmdline' }
--  })
--})
