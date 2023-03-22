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

  -- Theme
  use 'ellisonleao/gruvbox.nvim'

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'ray-x/go.nvim'

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
  use 'onsails/lspkind-nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' } } }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  -- Autocompletion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
      'hrsh7th/cmp-nvim-lua',
      'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
      'f3fora/cmp-spell', 'hrsh7th/cmp-emoji',
      'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' --snippets
    },
    --'quangnguyen30192/cmp-nvim-ultisnips', 
    -- config = function()
    --   local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
    --   require("cmp").setup({
    --     snippet = {
    --       expand = function(args)
    --         vim.fn["UltiSnips#Anon"](args.body)
    --       end,
    --     },
    --     sources = {
    --       { name = "ultisnips" },
    --       -- more sources
    --     },
    --     -- recommended configuration for <Tab> people:
    --     mapping = {
    --       ["<Tab>"] = cmp.mapping(
    --         function(fallback)
    --           cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
    --         end,
    --         { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    --       ),
    --       ["<S-Tab>"] = cmp.mapping(
    --         function(fallback)
    --           cmp_ultisnips_mappings.jump_backwards(fallback)
    --         end,
    --         { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    --       ),
    --     },
    --   })
    -- end,
  }


  -- Navigate in tmux
  use({
    "aserowy/tmux.nvim",
    config = function() require("tmux").setup() end
  })


  -- Set up lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- local servers = { 'tsserver', 'solargraph', 'svelte' }
  -- local lspconfig = require('lspconfig')
  -- for _, lsp in pairs(servers) do
  --   lspconfig[lsp].setup {
  --     capabilities = capabilities,
  --   }
  -- end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Place last 
  -- if packer_bootstrap then
  --   require('packer').sync()
  -- end
end)

