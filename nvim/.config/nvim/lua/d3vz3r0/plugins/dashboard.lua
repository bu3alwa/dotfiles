local function init()
  require('dashboard').setup {
    config = {
      shortcut = {
        {
          icon = "  ",
          desc = 'Update    ',
          group = '@property',
          action = 'Lazy update',
          shotcut = 'u'
        },
        {
          icon = "  ",
          desc = "Recently Opened Files    ",
          shortcut = "SPC f r",
          action = "Telescope oldfiles",
        },
        {
          icon = "  ",
          desc = "Jump to Bookmark    ",
          shortcut = "SPC s m",
          action = "Telescope marks",
        },
        {
          icon = "  ",
          desc = "Open Documentation    ",
          shortcut = "SPC D d",
          action = "lua require('doom.core.functions').open_docs()",
        },
      },
      header = {
        "                                                                              ",
        "=================     ===============     ===============   ========  ========",
        "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
        "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
        "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
        "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
        "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
        "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
        "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
        "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
        "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
        "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
        "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
        "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
        "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
        "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
        "||.=='    _-'                                                     `' |  /==.||",
        "=='    _-'                        N E O V I M                         \\/   `==",
        "\\   _-'                                                                `-_   /",
        " `''                                                                      ``'  ",
      },
      hide = {
        lualine,
        winbar,
      },
      footer = { "", "Doom Nvim loaded" },
      colors = {
        header = "#586268",
        center = "#51afef",
        shortcut = "#a9a1e1",
        footer = "#586268",
      },
    }
  }


  --   vim.api.nvim_create_augroup("dashboard_on_empty", { clear = true })
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "BDeletePost*",
  --     group = alpha_on_empty,
  --     callback = function(event)
  --       local opened_buffers = require('d3vz3r0.utils').get_opened_buffers()
  --       local is_empty = true
  --
  --       for buffname, _ in pairs(opened_buffers) do
  --         print(buffname)
  --         if (not string.find(buffname, 'No Name') and not string.find(buffname, 'neo-tree')) then
  --           is_empty = false
  --         end
  --       end
  --
  --       if is_empty then
  --         vim.cmd('NeoTreeClose')
  --         vim.cmd('Dashboard')
  --         vim.cmd(event.buf .. "bwipeout")
  --       end
  --     end,
  --   })
end

return {
  init = init
}
