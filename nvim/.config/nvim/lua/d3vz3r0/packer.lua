local packer_bootstrap = nil

local function ensure_packer()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local function packer_startup()
  local packer = require('packer')
  packer.init({
    git = {
      clone_timeout = 100,
    },
    profile = {
      enable = true
    }
  })

  packer.startup(function(use)
    use 'kamykn/spelunker.vim'
    use 'martinsione/darkplus.nvim'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- telescope
    use 'nvim-lua/popup.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require 'd3vz3r0.plugins.telescope'.init()
      end
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'BurntSushi/ripgrep'

    -- Neovim Tree shitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require('d3vz3r0.plugins.treesitter').init()
      end

    }
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
      config = function()
        require('d3vz3r0.plugins.neotree').init()
      end,
    }
    use 'ThePrimeagen/git-worktree.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use {
      'lspcontainers/lspcontainers.nvim',
      requires = {
        'neovim/nvim-lspconfig',
        'nvim-lua/lsp_extensions.nvim',
      },
      config = function()
        require 'lspcontainers'.setup({
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

        require 'd3vz3r0.plugins.lspconfig'.init()
      end
    }

    use 'pantharshit00/vim-prisma'
    use 'hashivim/vim-terraform'

    use {
      'onsails/lspkind-nvim',
      config = function()
        require 'd3vz3r0.plugins.lspkind'.init()
      end
    }

    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use 'kosayoda/nvim-lightbulb'

    use 'weilbith/nvim-code-action-menu'

    -- autocomplete
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'ray-x/cmp-treesitter',
        {
          'tzachar/cmp-tabnine',
          run = "./install.sh",
        },
        'onsails/lspkind-nvim'
      },
      config = function()
        require 'd3vz3r0.plugins.cmp'.init()
        require 'd3vz3r0.plugins.lspkind'.init()
      end
    }

    -- formmating
    use {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        require 'd3vz3r0.plugins.nullls'.init()
      end
    }


    -- harpoon
    use 'ThePrimeagen/harpoon'

    -- prettier
    use 'sbdchd/neoformat'

    -- auto commenting
    use 'KarimElghamry/vim-auto-comment'

    -- UI useful stuff
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require 'd3vz3r0.plugins.indent'.init()
      end
    }
    use {
      'HiPhish/nvim-ts-rainbow2',
      requires = {
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require 'd3vz3r0.plugins.rainbowindent'.init()
      end
    }

    use {
      'windwp/nvim-autopairs',
      requires = {
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require 'd3vz3r0.plugins.nvimautopair'.init()
      end
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require 'd3vz3r0.plugins.gitsigns'.init()
      end
    }

    use {
      "windwp/nvim-ts-autotag",
      wants = "nvim-treesitter",
      event = "InsertEnter",
      config = function()
        require 'd3vz3r0.plugins.autotag'.init()
      end,
    }

    if packer_bootstrap then
      require('packer').sync()
    end
  end)
end

local function init()
  packer_bootstrap = ensure_packer()
  packer_startup()
end

return {
  init = init
}
