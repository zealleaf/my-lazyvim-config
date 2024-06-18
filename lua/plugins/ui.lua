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
          button("s", "Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
          button("d", "Default Open", "<cmd> DefaultOpen <cr>"),
          { type = "padding", val = 1 },
          button("n", "New file", "<cmd> ene <BAR> startinsert <cr>"),
          button("p", "Project", "<cmd> Telescope projects <cr>"),
        },
      }
      config.layout[8] = {
        type = "group",
        val = {
          button("c", "Config", LazyVim.pick.config_files()),
          button("x", "Lazy Extras", "<cmd> LazyExtra <cr>"),
          button("l", "Lazy", "<cmd> Lazy <cr>"),
          { type = "padding", val = 1 },
          button("q", "Quit", "<cmd> qa <cr>"),
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
        delay = 100,

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
        goto_top = ";[",
        goto_bottom = ";/",
      },
    },
  },

  -- mini.animate
  -- {
  --   "echasnovski/mini.animate",
  --   opts = {
  --     cursor = {
  --       enable = false,
  --     },
  --     scroll = {
  --       enable = false,
  --     },
  --   },
  -- },

  -- bufferline.nvim
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", ":BufferLineCycleNext<CR>", desc = "Next tab", silent = true },
      { "<S-Tab>", ":BufferLineCyclePrev<CR>", desc = "Prev tab", silent = true },
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
    },
  },

  -- incline.nvim
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 }, zindex = 25 },
        hide = {
          cursorline = true,
        },
        render = "basic",
      })
    end,
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
    keys = { { "<leader>z", ":ZenMode<CR>", desc = "Zen Mode", silent = true } },
  },

  -- which-key.nvim
  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = "rounded", -- none, single, double, shadow
      },
    },
  },
}
