require("d3vz3r0.set")
require("d3vz3r0.packer")

-- import our configs
require("d3vz3r0.neotree-config")
-- require("d3vz3r0.lsp-config")
require("d3vz3r0.lightbulb-config")
require("d3vz3r0.cmp-config")
require("d3vz3r0.null-ls-config")
require("d3vz3r0.gitworktree-config")
require("d3vz3r0.telescope-config")
require("d3vz3r0.indent-config")
require("d3vz3r0.ts-rainbow-config")
require("d3vz3r0.nvim-autopairs-config")
require("d3vz3r0.lualine-config")
require("d3vz3r0.gitsigns-config")


vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = "Neotree show"})

vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd(
    { "VimEnter", "WinEnter", "BufWinEnter" },
    { pattern = "*", command = "setlocal cursorline", group = "CursorLine" }
)
vim.api.nvim_create_autocmd(
    "WinLeave",
    { pattern = "*", command = "setlocal cursorline", group = "CursorLine" }
)

