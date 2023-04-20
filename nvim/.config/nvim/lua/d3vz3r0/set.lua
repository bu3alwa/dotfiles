DASHBOARD_GLOBAL = true

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

  vim.api.nvim_create_user_command("CloseWindow", function()
    local currentWin = vim.api.nvim_get_current_win()
    local currentBuf = vim.api.nvim_get_current_buf()
    local currentBufName = vim.api.nvim_buf_get_name(currentBuf)

    local undoTree, neoTree = false, false
    local windows = vim.api.nvim_list_wins()
    local len = vim.tbl_count(windows)
    local count = 0

    for _, win in pairs(windows) do
      local buf = vim.api.nvim_win_get_buf(win)
      local name = vim.api.nvim_buf_get_name(buf)
      if (name == '') then
        count = count + 1
      end

      if (string.find(name, "neo%-tree filesystem") ~= nil) then
        print('neo-tree')
        neoTree = true
        count = count + 1
      end

      if (string.find(name, "undotree") ~= nil) then
        undoTree = true
        count = count + 2
      end
    end

    -- It would be better to compare it as a valid buffer instead of this. But for now this if fine
    if (string.find(currentBufName, 'neo%-tree filesystem') ~= nil or string.find(currentBufName, 'undotree') ~= nil) then
      vim.cmd.close()
    elseif (len - count - 1 > 0) then
      vim.cmd.Bdelete(currentBuf)
      vim.api.nvim_win_close(currentWin, false)
    elseif string.find(currentBufName, "Dashboard") then
      vim.cmd.quitall()
    else
      vim.cmd.Bdelete(currentBuf)
      vim.cmd.Dashboard()
      DASHBOARD_GLOBAL = true

      if (neoTree) then
        vim.cmd.NeoTreeClose()
      end

      if (undoTree) then
        vim.cmd.UndotreeHide()
      end
    end
  end, {})
end

local file_tree_group = vim.api.nvim_create_augroup('FileTreeGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPre' }, {
  callback = function(event)
    local name = vim.api.nvim_buf_get_name(event.buf)
    local find = string.find(name, 'Dashboard')

    if (find == nil and DASHBOARD_GLOBAL == true and name ~= '') then
      DASHBOARD_GLOBAL = false
      vim.cmd.NeoTreeShow()
    end
  end,
  group = file_tree_group,
  pattern = '*'
})


local function init()
  set_commands()
end

return {
  init = init
}
