vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

--vim.cmd [[highlight IndentSpaceIndent1 guibg=#a34e55 gui=nocombine]]
--vim.cmd [[highlight IndentSpaceIndent2 guibg=#806b44 gui=nocombine]]
--vim.cmd [[highlight IndentSpaceIndent3 guibg=#4b613c gui=nocombine]]
--vim.cmd [[highlight IndentSpaceIndent4 guibg=#2a585e gui=nocombine]]
--vim.cmd [[highlight IndentSpaceIndent5 guibg=#39688f gui=nocombine]]
--vim.cmd [[highlight IndentSpaceIndent6 guibg=#4b2d54 gui=nocombine]]
vim.opt.list = true

require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
--    space_char_highlight_list = {
--        "IndentSpaceIndent1",
--        "IndentSpaceIndent2",
--        "IndentSpaceIndent3",
--        "IndentSpaceIndent4",
--        "IndentSpaceIndent5",
--        "IndentSpaceIndent6",
--    },
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
}
