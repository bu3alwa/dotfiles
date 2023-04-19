local function install_package_manager()
  -- Install package manager
  --    https://github.com/folke/lazy.nvim
  --    `:help lazy.nvim.txt` for more info
  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)
end


local function packages()
  require('lazy').setup({
    'kamykn/spelunker.vim',
    'martinsione/darkplus.nvim',
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },
    -- telescope
    'nvim-lua/popup.nvim',
    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require 'd3vz3r0.plugins.telescope'.init()
      end
    },
    'nvim-telescope/telescope-fzy-native.nvim',
    'BurntSushi/ripgrep',
    {  -- Neovim Tree shitter
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require('d3vz3r0.plugins.treesitter').init()
      end

    },
    "nvim-treesitter/playground",
    "romgrk/nvim-treesitter-context",
    { -- Neotree
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require('d3vz3r0.plugins.neotree').init()
      end,
    },
    'ThePrimeagen/git-worktree.nvim',
    { -- lsp
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "folke/neodev.nvim",
      "mfussenegger/nvim-dap",
      run = ":MasonUpdate",
      config = function()
        require('d3vz3r0.plugins.lspconfig').init()
      end

    },
    'pantharshit00/vim-prisma',
    'hashivim/vim-terraform',
    {
      'onsails/lspkind-nvim',
      config = function()
        require 'd3vz3r0.plugins.lspkind'.init()
      end
    },
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    'kosayoda/nvim-lightbulb',
    'weilbith/nvim-code-action-menu',
    { -- autocomplete
      'hrsh7th/nvim-cmp',
      dependencies = {
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
    },
    { -- formmating
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        require 'd3vz3r0.plugins.nullls'.init()
      end
    },
    -- harpoon
     'ThePrimeagen/harpoon',
    -- prettier
     'sbdchd/neoformat',
    -- auto commenting
     'KarimElghamry/vim-auto-comment',
    -- UI ful stuff
    {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require 'd3vz3r0.plugins.indent'.init()
      end
    },
    {
      'HiPhish/nvim-ts-rainbow2',
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require 'd3vz3r0.plugins.rainbowindent'.init()
      end
    },
    {
      'windwp/nvim-autopairs',
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require 'd3vz3r0.plugins.nvimautopair'.init()
      end
    },
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require 'd3vz3r0.plugins.gitsigns'.init()
      end
    },
    {
      "windwp/nvim-ts-autotag",
      wants = "nvim-treesitter",
      event = "InsertEnter",
      config = function()
        require 'd3vz3r0.plugins.autotag'.init()
      end,
    },
    {
      "tpope/vim-fugitive"
    }
  })
end

local function init()
  install_package_manager()
  packages()
end

return {
  init = init
}
