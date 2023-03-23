require('nvim-treesitter.configs').setup {
  -- ensure_installed = { "ruby", "vim", "typescript", "javascript" },
  sync_installed = false,
  auto_install = true,
  highlight = {
    enable = true,
    -- disable = { "eruby", "html" }, -- list of language that will be disabled
  }
}
