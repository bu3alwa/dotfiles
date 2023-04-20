local function init()
  local Remap = require("d3vz3r0.bind")
  local nnoremap = Remap.nnoremap
  local vnoremap = Remap.vnoremap
  local inoremap = Remap.inoremap
  local xnoremap = Remap.xnoremap
  local nmap = Remap.nmap

  nnoremap("<C-f>", ":silent !tmux neww tmux-sessionizer<CR>")
  nnoremap("<leader><Bslash>", "<cmd>NeoTreeRevealToggle<CR>")
  -- Does not work with lazy
  -- nnoremap("<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
  nnoremap("<Leader>+", ":vertical resize +5<CR>")
  nnoremap("<Leader>-", ":vertical resize -5<CR>")
  nnoremap("<Leader>rp", ":resize 100<CR>")
  nnoremap('<Leader>u', ":UndotreeToggle<CR>")

  nnoremap("gh", "<cmd>diffget //2<cr>")
  nnoremap("gl", "<cmd>diffget //3<cr>")


  inoremap("<C-c>", "<esc>")

  -- switch tabs
  nnoremap("<C-h>", "<C-w>h")
  nnoremap("<C-j>", "<C-w>j")
  nnoremap("<C-k>", "<C-w>k")
  nnoremap("<C-l>", "<C-w>l")

  nnoremap("<C-w>", "<cmd>:CloseWindow<CR>")

  nnoremap("<leader>fk", "<cmd>Telescope keymaps<CR>")
  nnoremap("<leader>fa", "<cmd>CodeActionMenu<CR>")

  nnoremap("<leader>gs", "<cmd>Git<CR>")

  nnoremap("<leader>fgs", "<cmd>Telescope git_status<CR>")
  nnoremap("<leader>fgc", "<cmd>Telescope git_commit<CR>")
  nnoremap("<leader>fgb", "<cmd>Telescope git_branches<CR>")


  local silent = { silent = true }

  nnoremap("<leader>ha", function() require("harpoon.mark").add_file() end, silent)
  nnoremap("<leader>he", function() require("harpoon.ui").toggle_quick_menu() end, silent)
  nnoremap("<leader>hc", function() require("harpoon.cmd-ui").toggle_quick_menu() end, silent)

  -- nnoremap("<C-1>", function() require("harpoon.ui").nav_file(1) end, silent)
  -- nnoremap("<C-2>", function() require("harpoon.ui").nav_file(2) end, silent)
  -- nnoremap("<C-3>", function() require("harpoon.ui").nav_file(3) end, silent)
  -- nnoremap("<C-4>", function() require("harpoon.ui").nav_file(4) end, silent)
end

return {
  init = init
}
