---@diagnostic disable: param-type-mismatch
return {
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
}
