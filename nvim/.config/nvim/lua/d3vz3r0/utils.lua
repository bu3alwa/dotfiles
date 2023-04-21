local M = {}
M.get_opened_buffers = function()
  local opened_buffers = {}
  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buffer) ~= 0 then
      local buffer_name = vim.api.nvim_buf_get_name(buffer)
      if buffer_name == nil or buffer_name == "" then
        buffer_name = "[No Name]#" .. buffer
      end
      opened_buffers[buffer_name] = {
        ["modified"] = vim.api.nvim_buf_get_option(buffer, "modified"),
        ["loaded"] = vim.api.nvim_buf_is_loaded(buffer),
      }
    end
  end
  return opened_buffers
end

return M
