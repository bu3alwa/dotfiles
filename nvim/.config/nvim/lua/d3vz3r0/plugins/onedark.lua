local function init()
  -- Lua
  require('onedark').setup {
    -- Main options --
    style = 'dark',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,          -- Show/hide background
    term_colors = true,           -- Change terminal color as per the selected theme style
    ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = "<leader>ts",                                                     -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = 'italic',
      keywords = 'none',
      functions = 'none',
      strings = 'none',
      variables = 'none'
    },

    -- Lualine options --
    lualine = {
      transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {
      black = "#0e1013",
      bg0 = "#1f2329",
      bg1 = "#282c34",
      bg2 = "#30363f",
      bg3 = "#323641",
      bg_d = "#181b20",
      bg_blue = "#61afef",
      bg_yellow = "#e8c88c",
      fg = "#a0a8b7",
      purple = "#bf68d9",
      green = "#8ebd6b",
      orange = "#cc9057",
      blue = "#4fa6ed",
      yellow = "#e2b86b",
      cyan = "#48b0bd",
      red = "#e55561",
      grey = "#535965",
      light_grey = "#7a818e",
      dark_cyan = "#266269",
      dark_red = "#8b3434",
      dark_yellow = "#835d1a",
      dark_purple = "#7e3992",
      diff_add = "#272e23",
      diff_delete = "#2d2223",
      diff_change = "#172a3a",
      diff_text = "#274964",
    }, -- Override default colors
    highlights = {
      ["@parameter"] = { fg = "#abb2bf" },
      ["@property"] = { fg = "#abb2bf" },
      ["@warning"] = { fg = "#56b6c2" },
      ["jsx_element"] = { fg = '$cyan' },
      ["key"] = { fg = '$yellow' }
    },

    -- Plugins Config --
    diagnostics = {
      darker = false,    -- darker colors for diagnostic
      undercurl = true,  -- use undercurl instead of underline for diagnostics
      background = true, -- use background color for virtual text
    },
  }
end

return {
  init = init
}
