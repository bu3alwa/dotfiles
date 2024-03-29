local function init()
  local c = require('vscode.colors').get_colors()
  require('vscode').setup({
    -- Alternatively set style in setup
    style = 'dark',

    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = false,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
      -- this supports the same val table as vim.api.nvim_set_hl
      -- use colors from this colorscheme by requiring vscode.colors!
      -- Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
      DashboardShortCut = { fg = c.vscBlue, bg = 'NONE' },
      DiagnosticUnderlineError = { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscRed },
      DiagnosticUnderlineWarn = { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscYellow },
      DiagnosticUnderlineInfo = { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscBlue },
      DiagnosticUnderlineHint = { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscBlue }
    }
  })
  require('vscode').load()
end

return {
  init = init
}
