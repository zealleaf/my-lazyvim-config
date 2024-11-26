return {
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
}
