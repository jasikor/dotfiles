-- ~/.config/nvim/lua/colors/mytheme.lua
local M = {}

M.setup = function()
  -- Define colors
  local colors = {
    bg = "#1e1e1e",
    fg = "#cdd6f4",
    red = "#f38ba8",
    green = "#00e300",
    blue = "#89b4fa",
    yellow = "#f9e2af",
  }

  -- Set highlight groups
  -- vim.api.nvim_set_hl(0, "Normal", { fg = colors.green })
  vim.api.nvim_set_hl(0, "Normal", { fg = "#aaaaaa" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1a1a" })
  vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#1a1a1a" })
  vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#333333" })
end

return M
