return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
      },
      sections = {
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "project",
            fmt = function()
              local cwd = vim.fn.getcwd()
              return vim.fn.fnamemodify(cwd, ":t")
            end,
          },
          {
            "filename",
            fmt = function()
              local cwd = vim.fn.getcwd()
              local fullpath = vim.fn.expand("%:p")
              local relative_path = fullpath:sub(#cwd + 2)
              return relative_path
            end,
          },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
