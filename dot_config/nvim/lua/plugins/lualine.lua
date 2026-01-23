return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- component_separators = "",
        -- section_separators = { left = "", right = "" },
      },
      sections = {
        -- lualine_a = { { "diff", separator = { left = "" }, right_padding = 2 } },
        -- lualine_b = { { "progress", separator = { left = "" }, right_padding = 2 } },
        --   lualine_y = {
        --     { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
        --     { "location", padding = { left = 0, right = 1 } },
        --   },
        --   lualine_z = {
        --     {
        --       function()
        --         return " " .. os.date("%R")
        --       end,
        --       separator = { right = "" },
        --     },
        --   },
      },
    },
  },
}
