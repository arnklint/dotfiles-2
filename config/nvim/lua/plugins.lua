-- Inspired by https://github.com/mrLuisFer/neovim-dotfiles/blob/main/lua/plugins.lua

-- Install packer automagically
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Specify plugins
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Closes brackets
  use 'alvan/vim-closetag'
  use 'jiangmiao/auto-pairs'

  -- Movement
  use 'preservim/nerdcommenter' -- <leader>cc to make comment
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- Keybindings info
  use 'liuchengxu/vim-which-key'

  -- UI
  --use {
    --'glepnir/galaxyline.nvim',
    --branch = 'main'
  --}
  --use {
    --'nvim-lualine/lualine.nvim',
    --requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  --}

  -- Make nvim as smart as vscode :)
  -- use 'neoclide/coc.nvim'

  -- RipGrep
  ----  use 'vim-ripgrep'
  use 'duane9/nvim-rg'

  -- FZF
  use { 'junegunn/fzf', run = './install --bin', }
  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Git
  use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })
  use { 'tpope/vim-fugitive', cmd = 'Git' }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }

  -- Autocompletion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
      'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
      'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
      'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
    }
  }

  local cmp = require'cmp'
  local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      -- ["<Tab>"] = cmp.mapping(
      --   function(fallback)
      --     cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      --   end,
      --   { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
      -- ),
      -- ["<S-Tab>"] = cmp.mapping(
      --   function(fallback)
      --     cmp_ultisnips_mappings.jump_backwards(fallback)
      --   end,
      --   { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
      -- ),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Navigate in tmux
  use({
    "aserowy/tmux.nvim",
    config = function() require("tmux").setup() end
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  local servers = { 'tsserver', 'solargraph', 'svelte' }
  local lspconfig = require('lspconfig')
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities,
    }
  end

  -- Indentation
  -- require'nvim-treesitter.configs'.setup {
  --   indent = {
  --     enable = true
  --   },
  --   refactor = {
  --     refactor = {
  --       highlight_current_scope = { enable = true },
  --     },
  --     highlight_definitions = {
  --       enable = true,
  --       -- Set to false if you have an `updatetime` of ~100.
  --       clear_on_cursor_move = true,
  --     },
  --     smart_rename = {
  --       enable = true,
  --       keymaps = {
  --         smart_rename = "grr",
  --       },
  --     },
  --   },
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Place last 
  --if packer_bootstrap then
    --require('packer').sync()
  --end
end)

