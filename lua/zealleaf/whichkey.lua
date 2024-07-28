local wk = require("which-key")

wk.add({
  { mode = "n" },
  { ";w", group = "+window" },
})

wk.add({
  { mode = { "n", "v" } },
  { "<leader>sr", group = "+grug-far" },
})

wk.add({
  { mode = "n" },
  { ";z", group = "+nvim-ufo" },
  {
    ";zc",
    function()
      require("ufo").closeAllFolds()
    end,
    desc = "Close all folds",
  },
  {
    ";zk",
    function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end,
    desc = "Hover fold",
  },
  {
    ";zo",
    function()
      require("ufo").openAllFolds()
    end,
    desc = "Open all folds",
  },
})

wk.add({
  { mode = "n" },
  { ";e", group = "+neo-tree" },
  {
    ";eb",
    function()
      require("neo-tree.command").execute({ source = "buffers", toggle = true })
    end,
    desc = "Buffer explorer",
  },
  {
    ";eg",
    function()
      require("neo-tree.command").execute({ source = "git_status", toggle = true })
    end,
    desc = "Git explorer",
  },
})

return {}
