-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
use 'wbthomason/packer.nvim'
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use ({ "olimorris/onedarkpro.nvim",
config = function() vim.cmd("colorscheme onedark") end})

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    --lsp
use {'neovim/nvim-lspconfig'}
use {'hrsh7th/nvim-cmp'}
use {'hrsh7th/cmp-nvim-lsp'}
use {"williamboman/mason.nvim"}
use {"williamboman/mason-lspconfig.nvim"}
require("packer").startup(function()
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })
end)
  end)
