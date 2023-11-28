return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
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
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      local wk = require("which-key")
      wk.register({
        [";t"] = { name = "+telescope" },
        [";th"] = {
          function()
            builtin.help_tags()
          end,
          "Lists available help tags and opens a new window with the relevant help info on <cr>",
        },
        [";tr"] = {
          function()
            builtin.resume()
          end,
          "Resume the previous telescope picker",
        },
      })

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
          },
          n = {},
        },
      })

      -- opts.pickers = {
      --   diagnostics = {
      --     theme = "ivy",
      --     initial_mode = "normal",
      --     layout_config = {
      --       preview_cutoff = 9999,
      --     },
      --   },
      -- }

      telescope.setup(opts)
    end,
  },
}
