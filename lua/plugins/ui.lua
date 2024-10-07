---@diagnostic disable: param-type-mismatch
return {
  -- alpha-nvim
  {
    "goolord/alpha-nvim",
    config = function()
      local config = require("alpha.themes.startify").config
      local button = require("alpha.themes.startify").button
      config.layout[2].val = {
        [[               _ _             __      ]],
        [[ _______  __ _| | | ___  __ _ / _|     ]],
        [[|_  / _ \/ _` | | |/ _ \/ _` | |_       ]],
        [[ / /  __/ (_| | | |  __/ (_| |  _|     ]],
        [[/___\___|\__,_|_|_|\___|\__,_|_|        ]],
      }
      config.layout[4] = {
        type = "group",
        val = {
          button("q", "cd ..", "<cmd> qa <cr>"),
        },
      }
      config.layout[8] = {
        type = "group",
        val = {
          button("c", "Lazy Config", LazyVim.pick.config_files()),
          button("x", "Lazy Extras", "<cmd> LazyExtra <cr>"),
          button("l", "Lazy Store", "<cmd> Lazy <cr>"),
        },
      }
      require("alpha").setup(config)
    end,
  },
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          any = {
            {
              event = "notify",
              find = "No information available",
            },
            {
              event = "notify",
              find = "Invalid mapping for",
            },
          },
        },
        opts = { skip = true },
      })
    end,
  },
  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    opts = {
      fps = 60,
      timeout = 2000,
      top_down = false,
      render = "minimal",
    },
  },
  -- mini.indentscope
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 50,

        -- Animation rule for scope's first drawing. A function which, given
        -- next and total step numbers, returns wait time (in ms). See
        -- |MiniIndentscope.gen_animation| for builtin options. To disable
        -- animation, use `require('mini.indentscope').gen_animation.none()`.
        -- animation = --<function: implements constant 20ms between steps>,
        animation = require("mini.indentscope").gen_animation.none(),

        -- Symbol priority. Increase to display on top of more symbols.
        priority = 2,
      },

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Textobjects
        -- object_scope = "ii",
        -- object_scope_with_border = "ai",

        -- Motions (jump to respective border line; if not present - body line)
        goto_top = "<leader>zk",
        goto_bottom = "<leader>zj",
      },
    },
  },
  -- lualine.nvim
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
  -- zen-mode.nvim
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      zindex = 35,
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>zz", ":ZenMode<CR>", desc = "Zen Mode", silent = true } },
  },
}
