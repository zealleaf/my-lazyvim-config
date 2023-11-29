return {
  -- dashboard-nvim
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[
			                                     ,--,    ,--,                                       
			                                   ,--.'|  ,--.'|                           .--.,       
			       ,----,                      |  | :  |  | :                         ,--.'  \      
			     .'   .`|                      :  : '  :  : '                         |  | /\/      
			  .'   .'  .'   ,---.     ,--.--.  |  ' |  |  ' |      ,---.     ,--.--.  :  : :        
			,---, '   ./   /     \   /       \ '  | |  '  | |     /     \   /       \ :  | |-       
			;   | .'  /   /    /  | .--.  .-. ||  | :  |  | :    /    /  | .--.  .-. ||  : :/|      
			`---' /  ;--,.    ' / |  \__\/: . .'  : |__'  : |__ .    ' / |  \__\/: . .|  |  .'      
			  /  /  / .`|'   ;   /|  ," .--.; ||  | '.'|  | '.'|'   ;   /|  ," .--.; |'  : '        
			./__;     .' '   |  / | /  /  ,.  |;  :    ;  :    ;'   |  / | /  /  ,.  ||  | |        
			;   |  .'    |   :    |;  :   .'   \  ,   /|  ,   / |   :    |;  :   .'   \  : \        
			`---'         \   \  / |  ,     .-./---`-'  ---`-'   \   \  / |  ,     .-./  |,'        
			               `----'   `--`---'                      `----'   `--`---'   `--'          
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      opts.config.header = vim.split(logo, "\n")

      opts.config.center = {
        {
          action = "Telescope projects",
          desc = " Projects                             ",
          icon = " ",
          key = "p",
        },
        {
          action = "Telescope oldfiles",
          desc = " Recent files",
          icon = " ",
          key = "r",
        },
        {
          action = "Telescope live_grep",
          desc = " Find text",
          icon = " ",
          key = "g",
        },
        {
          action = "ene | startinsert",
          desc = " Current path",
          icon = " ",
          key = "/",
        },
        {
          action = [[lua require("lazyvim.util").telescope.config_files()()]],
          desc = " Config",
          icon = " ",
          key = "c",
        },
        {
          action = 'lua require("persistence").load()',
          desc = " Restore Session",
          icon = " ",
          key = "s",
        },
        {
          action = "LazyExtras",
          desc = " Lazy Extras",
          icon = " ",
          key = "x",
        },
        {
          action = "Lazy",
          desc = " Lazy",
          icon = "󰒲 ",
          key = "l",
        },
        {
          action = "qa",
          desc = " Quit",
          icon = " ",
          key = "q",
        },
      }
    end,
  },

  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    opts = {
      fps = 60,
      timeout = 5000,
      top_down = false,
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
  {
    "echasnovski/mini.animate",
    opts = {
      cursor = {
        enable = false,
      },
      scroll = {
        enable = false,
      },
    },
  },

  -- bufferline.nvim
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", ":BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", ":BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
  },

  -- lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- globalstatus = false,
        theme = "solarized_dark",
      },
    },
  },

  -- incline.nvim
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
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
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = "basic",
        -- render = function(props)
        --   local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        --   if vim.bo[props.buf].modified then
        --     filename = "[+] " .. filename
        --   end
        --
        --   local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        --   return { { icon, guifg = color }, { " " }, { filename } }
        -- end,
      })
    end,
  },

  -- zen-mode.nvim
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", ":ZenMode<CR>", desc = "Zen Mode" } },
  },
}
