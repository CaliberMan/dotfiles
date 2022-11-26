local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Dev Icons
  use 'kyazdani42/nvim-web-devicons'
  
  -- Color Scheme
  use 'folke/tokyonight.nvim'
  
  -- lualine
  use 'nvim-lualine/lualine.nvim'
  
  --Bottom Tabline Nvim
  use 'romgrk/barbar.nvim'

  -- Dashboard
  use {'glepnir/dashboard-nvim'}

 --Telescope
  use { 
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
      }
  use ("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
 -- CMP (Completion)
  use 'hrsh7th/cmp-buffer' 
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use "saadparwaiz1/cmp_luasnip"

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

end)
