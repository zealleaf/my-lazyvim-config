local wk = require("which-key")

wk.add({
  { mode = { "n", "v" } },
  { "<leader>z", group = "+z-keymaps" },
})

wk.add({
  { mode = { "n", "v" } },
  { "<leader>sr", group = "+grug-far" },
})

wk.add({
  { mode = "n" },
  {
    "<leader>zb",
    function()
      require("neo-tree.command").execute({ source = "buffers", toggle = true })
    end,
    desc = "Buffer explorer",
  },
  {
    "<leader>zg",
    function()
      require("neo-tree.command").execute({ source = "git_status", toggle = true })
    end,
    desc = "Git explorer",
  },
})

return {}
