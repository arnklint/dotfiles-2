vim.g.mapleader = ","

vim.g.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- search and ignore case
vim.o.ignorecase = true
vim.o.smartcase = true

local function register_mappings(mappings, default_options)
  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.keymap.set, mode, prefix, cmd, options)
    end
  end
end

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Exit Insert Mode
map("i", "kk", "<ESC>")
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")

-- Terminal window navigation
map("i", "<C-h>", "<C-\\><C-N><C-w>h")
map("i", "<C-j>", "<C-\\><C-N><C-w>j")
map("i", "<C-k>", "<C-\\><C-N><C-w>k")
map("i", "<C-l>", "<C-\\><C-N><C-w>l")

-- moving text
map("i", "<C-j>", "<esc><cmd>m .+1<CR>==")
map("i", "<C-k>", "<esc><cmd>m .-2<CR>==")

-- Better window movement
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

map("n", "<C-Up>", "<cmd>resize -2<CR>", { silent = true })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { silent = true })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { silent = true })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { silent = true })

-- escape clears highlighting
map("n", "<esc>", "<cmd>noh<cr><esc>")

-- hop words
map("n", "f", "<cmd>HopWord<cr>")
map("n", "F", "<cmd>HopLine<cr>")

-- yank to end of line on Y
map("n", "Y", "y$")

local mappings = {
  i = {
    -- Insert mode
    -- { "kk", "<ESC>" },
    -- { "jj", "<ESC>" },
    -- { "jk", "<ESC>" },
    -- Terminal window navigation
    -- { "<C-h>", "<C-\\><C-N><C-w>h" },
    -- { "<C-j>", "<C-\\><C-N><C-w>j" },
    -- { "<C-k>", "<C-\\><C-N><C-w>k" },
    -- { "<C-l>", "<C-\\><C-N><C-w>l" },
    -- moving text
    -- { "<C-j>", "<esc><cmd>m .+1<CR>==" },
    -- { "<C-k>", "<esc><cmd>m .-2<CR>==" },
    -- Ctrl single quote for backtick
    -- { "<C-'>", "``<esc>i" },
  },
  n = {
    -- Normal mode
    -- Better window movement
    -- { "<C-h>", "<C-w>h", { silent = true } },
    -- { "<C-j>", "<C-w>j", { silent = true } },
    -- { "<C-k>", "<C-w>k", { silent = true } },
    -- { "<C-l>", "<C-w>l", { silent = true } },
    -- Resize with arrows
    -- { "<C-Up>", "<cmd>resize -2<CR>", { silent = true } },
    -- { "<C-Down>", "<cmd>resize +2<CR>", { silent = true } },
    -- { "<C-Left>", "<cmd>vertical resize -2<CR>", { silent = true } },
    -- { "<C-Right>", "<cmd>vertical resize +2<CR>", { silent = true } },
    -- Ctrl + p fuzzy files
    -- { "<C-p>", telescope_find_files },
    -- escape clears highlighting
    -- { "<esc>", "<cmd>noh<cr><esc>" },
    -- hop words
    -- { "f", "<cmd>HopWord<cr>" },
    -- { "F", "<cmd>HopLine<cr>" },
    -- yank to end of line on Y
    -- { "Y", "y$" },
    -- lsp mappings
    { "K", vim.lsp.buf.hover },
    { "<C-k>", vim.lsp.buf.signature_help },
    {
      "[d",
      function()
        vim.diagnostic.goto_prev(border_options)
      end,
    },
    {
      "]d",
      function()
        vim.diagnostic.goto_next(border_options)
      end,
    },
    { "gD", vim.lsp.buf.declaration },
    { "gd", vim.lsp.buf.definition },
    { "gr", vim.lsp.buf.references },
    { "gi", vim.lsp.buf.implementation },
    -- bufferline
    { "H", "<cmd>BufferLineCyclePrev<CR>" },
    { "L", "<cmd>BufferLineCycleNext<CR>" },
  },
  t = {
    -- Terminal mode
    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
    -- map escape to normal mode in terminal
    { "<Esc>", [[ <C-\><C-n> ]] },
    { "jj", [[ <C-\><C-n> ]] },
  },
  v = {
    -- Visual/Select mode
    -- Better indenting
    { "<", "<gv" },
    { ">", ">gv" },
    -- hop words
    { "f", require("hop").hint_words },
    -- moving text
    { "J", "<cmd>m '>+1<CR>gv=gv" },
    { "K", "<cmd>m '<-2<CR>gv=gv" },
  },
  x = {
    -- remap p to always paste from last yank
    { "<leader>p", '"_dP' },
  },
}

register_mappings(mappings, { silent = true, noremap = true })

vim.api.nvim_set_keymap('n', '<c-P>',
  "<cmd>lua require('fzf-lua').files()<CR>",
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>r',
  "<cmd>lua require('fzf-lua').grep()<CR>",
  { noremap = true, silent = true })
