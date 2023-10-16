---@class CustomModule
local M = {}

M.get_selected_lines = function()
  local _, start_line, _, _ = unpack(vim.fn.getpos("'<"))
  local _, end_line, _, _ = unpack(vim.fn.getpos("'>"))

  -- print("start: ", start_line, "end:", end_line)

  local lines = vim.fn.getline(start_line, end_line)
  -- print("lines", lines)
  return lines
end


local Popup = require("nui.popup")
local popup_setted = false
local popup

M.show_float_code_window = function()
  -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'v', false)
  -- local mode = vim.api.nvim_get_mode().mode
  -- print("mode:", mode)
  local lines = M.get_selected_lines()
  M.show_float_window(lines)
end

M.show_float_window = function (lines)
  local enter = false
  if #lines == 0 then
    enter = true
  end
  if not popup_setted then
    popup = Popup({
      enter = enter,
      focusable = true,
      border = {
        style = "rounded",
      },
      position = {
        row = "1%",
        col = "98%",
      },
      size = {
        width = "30%",
        height = "30%",
      },
    })
    -- mount/open the component
    popup:mount()
    popup_setted = true

    popup:on("WinClosed", function()
      popup:unmount()
      popup_setted = false
    end, { once = true })
  end

  vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, lines)
end

return M
