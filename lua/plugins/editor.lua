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
            ["<leader>zv"] = "open_with_vscode",
            ["<leader>zs"] = "open_with_system",
            ["<leader>zy"] = "copy_selector",
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
        "<leader>zf",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      { "<leader>sr", false, mode = { "n", "v" } },
      {
        "<leader>srd",
        mode = { "n" },
        ":lua require('grug-far').grug_far({ transient = true })<cr>",
        desc = "transient default",
      },
      {
        "<leader>sr.",
        function()
          local is_visual = vim.fn.mode():lower():find("v")
          if is_visual then -- needed to make visual selection work
            vim.cmd([[normal! v]])
          end
          local grug = require("grug-far");
          (is_visual and grug.with_visual_selection or grug.grug_far)({
            prefills = { filesFilter = "*." .. vim.fn.expand("%:e") },
          })
        end,
        mode = { "n", "v" },
        desc = "dot filetype",
      },
      {
        "<leader>srf",
        mode = { "n" },
        ":lua require('grug-far').grug_far({ prefills = { flags = vim.fn.expand('%') } })<cr>",
        desc = "current file",
      },
      {
        "<leader>srw",
        mode = { "n" },
        ":lua require('grug-far').grug_far({ prefills = { search = vim.fn.expand('<cword>') } })<cr>",
        desc = "word workspace",
      },
      {
        "<leader>srw",
        mode = { "v" },
        ":<c-u>lua require('grug-far').with_visual_selection({ prefills = { flags = vim.fn.expand('%') } })<cr>",
        desc = "word current file",
      },
    },
  },
  -- which-key.nvim
  {
    "folke/which-key.nvim",
    opts = {
      win = {
        border = "rounded", -- none, single, double, shadow, rounded
      },
      -- icons = {
      --   rules = false,
      -- },
    },
  },
}
