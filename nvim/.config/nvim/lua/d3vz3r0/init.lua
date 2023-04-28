local function init()
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  require("d3vz3r0.set").init()
  require("d3vz3r0.packageManager").init()
  require("d3vz3r0.keymaps").init()
end

return {
  init = init
}
