vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=70 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=70 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 blend=70 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=70 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=70 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD blend=70 gui=nocombine]]

vim.cmd [[highlight IndentSpaceIndent1 guibg=#E06C75 blend=10 gui=nocombine]]
vim.cmd [[highlight IndentSpaceIndent2 guibg=#E5C07B blend=10 gui=nocombine]]
vim.cmd [[highlight IndentSpaceIndent3 guibg=#98C379 blend=10 gui=nocombine]]
vim.cmd [[highlight IndentSpaceIndent4 guibg=#56B6C2 blend=10 gui=nocombine]]
vim.cmd [[highlight IndentSpaceIndent5 guibg=#61AFEF blend=10 gui=nocombine]]
vim.cmd [[highlight IndentSpaceIndent6 guibg=#C678DD blend=10 gui=nocombine]]
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
    space_char_highlight_list = {
        "IndentSpaceIndent1",
        "IndentSpaceIndent2",
        "IndentSpaceIndent3",
        "IndentSpaceIndent4",
        "IndentSpaceIndent5",
        "IndentSpaceIndent6",
    },
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
}
