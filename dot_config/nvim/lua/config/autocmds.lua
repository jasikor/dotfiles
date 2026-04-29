-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  pattern = "*",
  command = "silent! wa",
})

-- Fake cursor in inactive windows
local ns = vim.api.nvim_create_namespace("fake_cursor")
local fake_cursors = {}

vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_get_current_buf()
    local cursor = vim.api.nvim_win_get_cursor(0)
    if fake_cursors[win] then
      pcall(vim.api.nvim_buf_del_extmark, buf, ns, fake_cursors[win])
    end
    fake_cursors[win] = vim.api.nvim_buf_set_extmark(buf, ns, cursor[1] - 1, cursor[2], {
      virt_text = { { "█", "FakeCursorInactive" } },
      virt_text_pos = "overlay",
    })
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    local win = vim.api.nvim_get_current_win()
    if fake_cursors[win] then
      local buf = vim.api.nvim_get_current_buf()
      pcall(vim.api.nvim_buf_del_extmark, buf, ns, fake_cursors[win])
      fake_cursors[win] = nil
    end
  end,
})
