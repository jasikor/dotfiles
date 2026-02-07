local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "xk", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp('renderDiagnostic')
    --  vim.cmd.RustLsp({ 'hover', 'actions' })
  end,
  { silent = true, buffer = bufnr, desc = "Full error" }
)
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {
    only_current_line = true, -- show only for the cursor line
  },
})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1a1a" })
