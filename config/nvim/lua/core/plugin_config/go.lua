require('go').setup()


local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').gofmt()
  end,
  group = format_sync_grp,
})

local gotest = require("go.null_ls").gotest()
local gotest_codeaction = require("go.null_ls").gotest_action()
local golangci_lint = require("go.null_ls").golangci_lint()
--table.insert(sources, gotest, golangci_lint)
--table.insert(sources, gotest_codeaction)
--null_ls.setup({ sources = sources, debounce = 1000, default_timeout = 5000 })
