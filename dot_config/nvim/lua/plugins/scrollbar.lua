return {
  "petertriho/nvim-scrollbar",
  event = "BufReadPost",
  config = function()
    require("scrollbar").setup({
      handle = {
        color = "#555555",
      },
    })
  end,
}
