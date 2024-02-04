return {
  -- neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    tag = "3.14",
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

      require("neo-tree").setup({
        commands = {
          copy_selector = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            local vals = {
              ["BASENAME"] = modify(filename, ":r"),
              ["EXTENSION"] = modify(filename, ":e"),
              ["FILENAME"] = filename,
              ["PATH (CWD)"] = modify(filepath, ":."),
              ["PATH (HOME)"] = modify(filepath, ":~"),
              ["PATH"] = filepath,
              ["URI"] = vim.uri_from_fname(filepath),
            }

            local options = vim.tbl_filter(function(val)
              return vals[val] ~= ""
            end, vim.tbl_keys(vals))
            if vim.tbl_isempty(options) then
              vim.notify("No values to copy", vim.log.levels.WARN)
              return
            end
            table.sort(options)
            vim.ui.select(options, {
              prompt = "Choose to copy to clipboard:",
              format_item = function(item)
                return ("%s: %s"):format(item, vals[item])
              end,
            }, function(choice)
              local result = vals[choice]
              if result then
                vim.notify(("Copied: `%s`"):format(result))
                vim.fn.setreg("+", result)
              end
            end)
          end,
          open_with_vscode = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local modify = vim.fn.fnamemodify
            local PATH_HOME = modify(filepath, ":~")

            vim.fn.system("open -a 'Visual Studio Code' " .. PATH_HOME)
          end,
        },
        window = {
          mappings = {
            l = "open",
            ["<space>"] = "",
            h = "navigate_up",
            -- b = "navigate_up",
            v = "open_with_vscode",
            Y = "copy_selector",
            L = "focus_preview",
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          use_libuv_file_watcher = true,
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

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
      })

      telescope.setup(opts)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
    },
  },
}
