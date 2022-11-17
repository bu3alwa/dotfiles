-- set defaults
vim.opt.wildignore = '*.pyc,*_build/*,**/coverage/*,**/node_modules/*,**/android/*,**/ios/*,**/.git/*'

vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop=2
vim.opt.autoindent = true
vim.opt.smarttab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = false
vim.opt.hidden = true

vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.nu = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true

vim.opt.cmdheight = 2
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.spell = false
vim.opt.termguicolors = true
vim.opt.shortmess:append("c")

vim.g.mapleader = " "
