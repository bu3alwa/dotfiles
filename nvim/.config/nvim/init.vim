call plug#begin()
Plug 'kamykn/spelunker.vim'
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'romgrk/nvim-treesitter-context'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'lspcontainers/lspcontainers.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'kosayoda/nvim-lightbulb'

Plug 'weilbith/nvim-code-action-menu'

" autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'github/copilot.vim'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" formmating
Plug 'jose-elias-alvarez/null-ls.nvim'

" Debugger Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'szw/vim-maximizer'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'rust-lang/rust.vim'
Plug 'darrikonn/vim-gofmt'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'tpope/vim-projectionist'
Plug 'tomlion/vim-solidity'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'BurntSushi/ripgrep'

Plug 'vim-conf-live/vimconflive2021-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" harpoon
Plug 'nvim-lua/plenary.nvim' 
Plug 'ThePrimeagen/harpoon'

" prettier
Plug 'sbdchd/neoformat'

"TREEEEEEEEEEEEEEEEEEEEEEE
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'KarimElghamry/vim-auto-comment'

" UI useful stuff
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install --production' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-autopairs'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

let g:vscode_style = "dark"
let g:vscode_transparency = 1
let g:vscode_italic_comment = 1
colorscheme vscode

let mapleader = " "

lua require'nvim-web-devicons'.get_icons()

" basics to have before plugins
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

" vim with me 
nnoremap <leader>vwm :lua require("vim-with-me").init()<CR>
nnoremap <leader>dwm :lua require("vim-with-me").disconnect()<CR>

inoremap <C-c> <esc>

" switch tabs
nnoremap <silent><nowait> <C-h> <C-w>h
nnoremap <silent><nowait> <C-j> <C-w>j
nnoremap <silent><nowait> <C-k> <C-w>k
nnoremap <silent><nowait> <C-l> <C-w>l

nnoremap <leader>fa <cmd>CodeActionMenu<CR>

" import our configs
lua require("neotree-config")
lua require("lsp-containers")
lua require("lsp-config")
lua require("lightbulb-config")
"lua require("cmp-tabnine")
lua require("cmp-config")
lua require("null-ls-config")
lua require("gitworktree-config")
lua require("telescope-config")
lua require("indent-config")
lua require("ts-rainbow-config")
lua require("nvim-autopairs-config")
lua require("lualine-config")
lua require('gitsigns-config')

" show neotree on load
autocmd VimEnter * Neotree show

" auto comment
let g:inline_comment_dict = {
		\'//': ["js", "ts", "cpp", "c", "dart"],
		\'#': ['py', 'sh'],
		\'"': ['vim'],
		\}
let g:block_comment_dict = {
		\'/*': ["js", "ts", "cpp", "c", "dart"],
		\'"""': ['py'],
		\}

nnoremap <silent><C-/> :AutoInlineComment<CR>

" Import cost auto run
augroup import_cost_auto_run
  autocmd!
  autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
augroup END

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
