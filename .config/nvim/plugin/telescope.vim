" Find files using Telescope command-line sugar.
lua require("telescope")
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
