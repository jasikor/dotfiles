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

-- Auto-fold use statements
local function fold_use_statements()
  local buf = vim.api.nvim_get_current_buf()
  local ok, parser = pcall(vim.treesitter.get_parser, buf, "rust")
  if not ok or not parser then
    return
  end
  local tree = parser:parse()[1]
  local root = tree:root()
  -- Collect only top-level use_declaration nodes (direct children of root)
  local use_nodes = {}
  for i = 0, root:child_count() - 1 do
    local child = root:child(i)
    if child:type() == "use_declaration" then
      table.insert(use_nodes, child)
    end
  end
  if #use_nodes == 0 then
    return
  end
  local first_node = use_nodes[1]
  local last_node = use_nodes[#use_nodes]
  local first_use = select(1, first_node:range())
  local last_use = select(3, last_node:range())
  vim.cmd("setlocal foldmethod=manual")
  vim.cmd("silent! normal! zE")
  vim.cmd(("%d,%dfold"):format(first_use + 1, last_use + 1))
end

vim.schedule(fold_use_statements)
