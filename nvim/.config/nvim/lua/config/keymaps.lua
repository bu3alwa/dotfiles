-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap.set

keymap("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", { desc = "Creates a tmux session" })
keymap("n", "<leader><Bslash>", ":Neotree toggle<CR>", { desc = "Opens NeoTree Navigation" })

keymap("n", "<Leader>+", ":vertical resize +5<CR>", { desc = "Increase window size vertically" })
keymap("n", "<Leader>-", ":vertical resize -5<CR>", { desc = "Decrease window size vertically" })
keymap("n", "<Leader>rp", ":resize 100<CR>", { desc = "Increase window size vertically" })
keymap("n", "<Leader>u", ":UndotreeToggle<CR>", { desc = "Toggle (u)ndotree" })

keymap("n", "gh", "<cmd>diffget //2<cr>", { desc = "Get diff from left" })
keymap("n", "gl", "<cmd>diffget //3<cr>", { desc = "Get diff from right" })

keymap("i", "<C-c>", "<esc>", { desc = "Exit insert mode" })

keymap("n", "<C-w>", "<cmd>:CloseWindow<CR>", { desc = "Close current window" })

keymap("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "(F)ind (k)eymaps" })
keymap("n", "<leader>fa", "<cmd>CodeActionMenu<CR>", { desc = "(F)ind (a)ctions" })

keymap("n", "<leader>gs", "<cmd>Git<CR>", { desc = "(G)it (s)tatus" })

keymap("n", "<leader>fgs", "<cmd>Telescope git_status<CR>", { desc = "(F)ind (g)it (s)tatus" })
keymap("n", "<leader>fgc", "<cmd>Telescope git_commit<CR>", { desc = "(F)ind (g)it (c)ommit" })
keymap("n", "<leader>fgb", "<cmd>Telescope git_branches<CR>", { desc = "(F)ind (g)it (b)ranches" })
keymap("n", "<leader>fS", "<cmd>:Telescope aerial<CR>", { desc = "(F)ind (s)ymbols" })

keymap("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, {
  silent = true,
  desc = "(H)arpoon (a)ppend",
})
keymap("n", "<leader>he", function()
  require("harpoon.ui").toggle_quick_menu()
end, {
  silent = true,
  desc = "(H)arpoon (e)dit",
})
keymap("n", "<leader>hc", function()
  require("harpoon.cmd-ui").toggle_quick_menu()
end, {
  silent = true,
  desc = "(H)arpoon (c)ommand",
})

-- keymap({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "Paste after" })
-- keymap({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "Paste before" })

keymap("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "(S)pectre toggle",
})
keymap("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "(S)earch current (w)ord",
})
keymap("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "(S)earch current (w)ord",
})
keymap("n", "<leader>sf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "(S)earch on current (f)ile",
})
keymap("n", "<leader>ct", function()
  require("copilot.suggestion").toggle_auto_trigger()
end, {
  desc = "(C)opilot (t)oggle: toggles copilot autosuggestion",
})

keymap("n", "<leader>fs", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ") })
end, { desc = "(F)ind (s)tring" })

keymap("n", "<Leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "(F)ind (f)iles" })
keymap("n", "<leader>fw", function()
  require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end, { desc = "(F)ind (w)ord" })
keymap("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "(F)ind (b)uffers" })
keymap("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, { desc = "(F)ind (h)elp" })
keymap("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "(F)ind (g)rep" })

keymap("n", "<leader>yh", "<cmd>Telescope yank_history<CR>", { desc = "(Y)ank (h)istory" })

keymap("n", "<leader>xx", function()
  require("trouble").toggle()
end)
keymap("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end)
keymap("n", "<leader>xd", function()
  require("trouble").toggle("document_diagnostics")
end)
keymap("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end)
keymap("n", "<leader>xl", function()
  require("trouble").toggle("loclist")
end)
keymap("n", "gR", function()
  require("trouble").toggle("lsp_references")
end)
