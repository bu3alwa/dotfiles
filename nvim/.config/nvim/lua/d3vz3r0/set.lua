-- set defaults
local function set_commands()
  vim.opt.wildignore = '*.pyc,*_build/*,**/coverage/*,**/node_modules/*,**/android/*,**/ios/*,**/.git/*'

  vim.opt.number = true
  vim.opt.shiftwidth = 2
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
  vim.opt.autoindent = true
  vim.opt.smarttab = true

  vim.opt.completeopt = 'menuone,noselect'
  vim.wo.signcolumn = 'yes'

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

  vim.opt.cmdheight = 3
  vim.opt.updatetime = 50

  vim.timeout = true
  vim.timeout = 300


  vim.opt.colorcolumn = "80"

  vim.opt.spell = false
  vim.opt.termguicolors = true
  vim.opt.shortmess:append("c")

  -- Keymaps for better default experience
  -- See `:help vim.keymap.set()`
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  -- Remap for dealing with word wrap
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

  --vim.opt.clipboard = 'unamedplus'
  vim.opt.mouse = 'a'

  -- [[ Highlight on yank ]]
  -- See `:help vim.highlight.on_yank()`
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })
end

local function init()
  set_commands()
end

return {
  init = init
}
