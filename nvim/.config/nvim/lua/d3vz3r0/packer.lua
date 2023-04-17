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

return require("packer").startup(function()
    use 'kamykn/spelunker.vim'
    use 'martinsione/darkplus.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'BurntSushi/ripgrep'

    -- Neovim Tree shitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    -- Neotree
    use {
    "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        },
    }
    use 'ThePrimeagen/git-worktree.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'lspcontainers/lspcontainers.nvim'
      use {
    'lspcontainers/lspcontainers.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/lsp_extensions.nvim',
    },
    config = function ()
      require'lspcontainers'.setup({
        ensure_installed = {
          "bashls",
          "dockerls",
          "gopls",
          "html",
          "pylsp",
          "rust_analyzer",
          "sumneko_lua",
          "terraformls",
          "tsserver",
          "yamlls"
        }
      })

      require'lsp-config'.init()
    end
  }
  use 'pantharshit00/vim-prisma'
  use 'hashivim/vim-terraform'

    use 'onsails/lspkind-nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use 'kosayoda/nvim-lightbulb'

    use 'weilbith/nvim-code-action-menu'

    -- autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- For vsnip users.
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- formmating
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- harpoon
    use 'ThePrimeagen/harpoon'

    -- prettier
    use 'sbdchd/neoformat'

    -- auto commenting
    use 'KarimElghamry/vim-auto-comment'

    -- UI useful stuff
    use 'lukas-reineke/indent-blankline.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-autopairs'
    use 'lewis6991/gitsigns.nvim'

    -- auto install packer must be at the end
    if packer_bootstrap then
        require('packer').sync()
    end
end)
