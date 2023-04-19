local function init()
  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

  hl("SignColumn", {
    bg = "none",
  })

  hl("ColorColumn", {
    ctermbg = 0,
    bg = "#555555",
  })

  hl("CursorLineNR", {
    bg = "None"
  })

  hl("Normal", {
    bg = "none"
  })

  hl("LineNr", {
    fg = "#5eacd3"
  })

  hl("netrwDir", {
    fg = "#5eacd3"
  })

  hl("DiagnosticUnderlineError", {
    undercurl = true,
    sp = "Red"
  })

  hl("DiagnosticUnderlineWarn", {
    undercurl = true,
    sp = "Yellow"
  })

  hl("DiagnosticUnderlineInfo", {
    undercurl = true,
    sp = "Blue"
  })
end

return {
	init = init
}

