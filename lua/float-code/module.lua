---@class CustomModule
local M = {}

local function region_to_text(region)
  local text = ''
  local maxcol = vim.v.maxcol
  for line, cols in vim.spairs(region) do
    local endcol = cols[2] == maxcol and -1 or cols[2]
    local chunk = vim.api.nvim_buf_get_text(0, line, cols[1], line, endcol, {})[1]
    text = ('%s%s\n'):format(text, chunk)
  end
  return text
end

---@return string
M.show_float_code_window = function()
  if not vim.api.nvim_get_mode().mode:find("^[vV\22sS\19]") then
    print("not in visualmode, skip")
    return ""
  end

  local r = vim.region(0, "'<", "'>", vim.fn.visualmode(), true)
  local text = region_to_text(r);

  print("visual select text:", text)

  local NuiText = require("nui.text")

  local text_ui = NuiText(text, "float-code")

  local bufnr, ns_id, linenr_start, byte_start = 0, -1, 1, 0

  text_ui:render(bufnr, ns_id, linenr_start, byte_start)

  return ""
end

return M
