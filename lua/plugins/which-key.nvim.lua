local wk = require("which-key")

wk.add({
  { mode = { "n", "v" } },
  { "<leader>z", group = "+z-keymaps" },
})

wk.add({
  { mode = { "n", "v" } },
  { "<leader>sr", group = "+grug-far" },
})

return {
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
