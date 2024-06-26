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
          require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
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
            require("neo-tree.command").execute({ source = "buffers", toggle = true })
          end,
          "Buffer explorer",
        },
        [";eg"] = {
          function()
            require("neo-tree.command").execute({ source = "git_status", toggle = true })
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
          open_with_system = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local modify = vim.fn.fnamemodify
            local PATH_HOME = modify(filepath, ":~")

            vim.fn.system("open " .. PATH_HOME)
          end,
        },
        window = {
          position = "right",
          mappings = {
            l = "open",
            ["<space>"] = "",
            h = "navigate_up",
            -- b = "navigate_up",
            [";v"] = "open_with_vscode",
            [";o"] = "open_with_system",
            [";y"] = "copy_selector",
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
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 350,
      },
    },
  },
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
      { "r", mode = "o", false },
      { "R", mode = { "o", "x" }, false },
      { "<c-s>", mode = { "c" }, false },
      {
        ";s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    keys = {
      { "<leader>sr", false },
      {
        "<leader>srl",
        mode = { "n" },
        '<cmd>lua require("spectre").open_file_search()<CR>',
        desc = "Search local",
      },
      { "<leader>srg", mode = { "n" }, '<cmd>lua require("spectre").toggle()<CR>', desc = "Search global" },
      {
        "<leader>srw",
        mode = { "n" },
        '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
        desc = "Search word local",
      },
      {
        "<leader>srW",
        mode = { "n" },
        '<esc><cmd>lua require("spectre").open_visual({select_word=true})<CR>',
        desc = "Search word global",
      },
      {
        "<leader>srW",
        mode = { "v" },
        '<esc><cmd>lua require("spectre").open_visual()<CR>',
        desc = "Search word global",
      },
    },
  },
}
