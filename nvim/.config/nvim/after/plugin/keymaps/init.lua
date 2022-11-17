local Remap = require("d3vz3r0.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<silent><C-/>", ":AutoInlineComment<CR>")

nnoremap("<silent><C-f>", ":silent !tmux neww tmux-sessionizer<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")
nnoremap("<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
nnoremap("<Leader>+", ":vertical resize +5<CR>")
nnoremap("<Leader>-", ":vertical resize -5<CR>")
nnoremap("<Leader>rp", ":resize 100<CR>")


inoremap("<C-c>", "<esc>")

-- switch tabs
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

nnoremap("<leader>fa", "<cmd>CodeActionMenu<CR>")


