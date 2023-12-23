require('nvim-treesitter.configs').setup {
  -- ensure_installed = { "ruby", "vim", "typescript", "javascript" },
  sync_installed = false,
  auto_install = true,
  autopairs = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    "html",
    "ruby",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "svelte",
    "sql",
    "markdown",
    "tsx",
    "typescript",
    "yaml"
  },
  highlight = {
    enable = true,
    -- disable = { "eruby", "html" }, -- list of language that will be disabled
  }
}
