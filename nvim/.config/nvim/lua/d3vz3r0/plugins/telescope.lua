local function init()
    require('telescope').setup{
        defaults = {
            file_ignore_patterns = { "node%_modules/.*" },
        }
    }

  local Remap = require("d3vz3r0.bind")
  local nnoremap = Remap.nnoremap

  nnoremap("<C-p>", ":Telescope")
  nnoremap("<leader>fs", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
  end)
  nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
  end)
  nnoremap("<Leader>ff", function()
    require('telescope.builtin').find_files()
  end)
  nnoremap("<leader>fw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
  end)
  nnoremap("<leader>fb", function()
    require('telescope.builtin').buffers()
  end)
  nnoremap("<leader>fh", function()
    require('telescope.builtin').help_tags()
  end)
  nnoremap("<leader>fg", function ()
    require('telescope.builtin').live_grep()
  end)

end 

return {
    init = init
}
