local function init()
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  local null_ls = require("null-ls")

  null_ls.setup({
    debug = true,
    sources = {
      require('none-ls.formatting.eslint_d'),
      null_ls.builtins.formatting.prettierd,
      require('none-ls.diagnostics.eslint_d'),
      require('none-ls.code_actions.eslint_d'),
      require('none-ls.formatting.ruff'),
      require('none-ls.diagnostics.ruff'),
      null_ls.builtins.completion.spell,
    },
    -- formatting done with conform now
    -- you can reuse a shared lspconfig on_attach callback here
    -- on_attach = function(client, bufnr)
    -- if client.supports_method("textDocument/formatting") then
    -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    -- group = augroup,
    -- buffer = bufnr,
    -- callback = function()
    --     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --     vim.lsp.buf.format({ bufnr = bufnr })
    -- end,
    -- })
    -- end
    -- end,
    -- formatting = {
    --         format = function(entry, vim_item)
    --             vim_item.kind = lspkind.presets.default[vim_item.kind]
    --             local menu = source_mapping[entry.source.name]
    --             vim_item.menu = menu
    --             return vim_item
    --         end,
    --     },
  })
end

return {
  init = init
}
