local function init()
  require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    check_ts = true,
  })
end


return {
  init = init
}
