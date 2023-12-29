-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use ({
      'folke/tokyonight.nvim',
      as = 'toykonight',
      config = function()
          vim.cmd('colorscheme tokyonight-night')
    end
  })

  use 'nvim-tree/nvim-web-devicons'

  use ({
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
          require('dashboard').setup {
      -- config
      }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
  })

  use ({
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      requires = { {'nvim-lua/plenary.nvim'} }
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('ThePrimeagen/harpoon')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use {
      'tummetott/unimpaired.nvim',
      config = function()
          require('unimpaired').setup {
            -- add any options here or leave empty
            }
        end
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },

      config = function()
          require('lualine').setup {
              options = {
                  theme = 'tokyonight'
              }
          }
      end
  }

  use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
          require("ibl").setup()
      end
  }

  use {
      'akinsho/bufferline.nvim', 
      tag = "*", 
      requires = 'nvim-tree/nvim-web-devicons',
      config = function()
          require("bufferline").setup()
      end
  }

  use {
      'NvChad/nvim-colorizer.lua',
      config = function()
          require 'colorizer'.setup()
      end
  }

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

end)
