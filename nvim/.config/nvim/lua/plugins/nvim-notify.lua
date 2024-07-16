return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>und",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>unh",
      function()
        require("telescope").load_extension('notify').notify()
      end,
      desc = "Dismiss All Notifications",
    }
  },
  opts = {
    stages = "static",
    timeout = 3000,
    max_height = function()
      return math.floor(7)
    end,
    max_width = function()
      return math.floor(50)
    end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
  init = function()
    -- when noice is not enabled, install notify on VeryLazy
    if not LazyVim.has("noice.nvim") then
      LazyVim.on_very_lazy(function()
        vim.notify = require("notify")
      end)
    end
  end,
}
