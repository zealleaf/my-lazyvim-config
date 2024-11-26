return {
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
