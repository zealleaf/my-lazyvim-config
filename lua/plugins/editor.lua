return {
  -- neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>e",
        function()
          local Util = require("lazyvim.util")
          require("neo-tree.command").execute({ toggle = true, position = "right", dir = Util.root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "right", dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    config = function()
      local wk = require("which-key")
      wk.register({
        [";e"] = { name = "+neo-tree" },
        [";eb"] = {
          function()
            require("neo-tree.command").execute({ source = "buffers", position = "right", toggle = true })
          end,
          "Buffer explorer",
        },
        [";eg"] = {
          function()
            require("neo-tree.command").execute({ source = "git_status", position = "right", toggle = true })
          end,
          "Git explorer",
        },
      })
    end,
  },
  {
    "telescope.nvim",
    config = function(_, opts)
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      local wk = require("which-key")
      wk.register({
        [";t"] = { name = "+telescope" },
        [";th"] = {
          function()
            builtin.help_tags()
          end,
          "Lists available help tags and opens a new window with the relevant help info on <CR>",
        },
        [";tr"] = {
          function()
            builtin.resume()
          end,
          "Resume the previous telescope picker",
        },
      })

      telescope.setup(opts)
    end,
  },
}
