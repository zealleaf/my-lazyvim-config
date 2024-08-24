return {
  -- vim-maximizer
  {
    "szw/vim-maximizer",
    event = "VeryLazy",
    init = function()
      local opts = {
        noremap = true,
        silent = true,
      }

      vim.keymap.set("n", "<leader>zm", ":MaximizerToggle!<CR>", opts)
    end,
  },
  -- git-conflict.nvim
  { "akinsho/git-conflict.nvim", version = "*", config = true },
}
