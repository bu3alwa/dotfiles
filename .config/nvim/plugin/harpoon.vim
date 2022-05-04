lua require("telescope").load_extension('harpoon')

" Harpoon
nnoremap <leader>m :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>p :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>[ :lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>] :lua require("harpoon.ui").nav_prev()<CR> 
nnoremap <leader>G :lua require("harpoon.tmux").gotoTerminal(1)<CR>

nnoremap <leader>fm :Telescope harpoon marks<CR>

