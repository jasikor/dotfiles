-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here;
vim.keymap.set('n', '<Del>', '<Nop>', { noremap = true, silent = true })
-- Start/Stop recording into register q
-- Toggle recording in register q

vim.keymap.set('n', '<F4>', function()
  if vim.fn.reg_recording() == '' then
    return 'qq'
  else
    return 'q'
  end
end, { expr = true })

-- Playback register q
vim.keymap.set('n', '<F5>', '@q')
