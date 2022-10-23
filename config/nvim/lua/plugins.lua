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
  use 'easymotion/vim-easymotion'
  use 'preservim/nerdcommenter' -- <leader>cc to make comment

  -- UI
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main'
  }

  -- Make nvim as smart as vscode :)
  use 'neoclide/coc.nvim'

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
  use { 'tpope/vim-fugitive', cmd = 'Git' }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
    "hrsh7th/nvim-cmp",
   requires = {
      "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
      'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
      'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
      'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
    }
  }
  use 'onsails/lspkind-nvim'
  use { 'nvim-treesitter/nvim-treesitter' }--, run = ':TSUpdate'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Place last 
  if packer_bootstrap then
    require('packer').sync()
  end
end)

