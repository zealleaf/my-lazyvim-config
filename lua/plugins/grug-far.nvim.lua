return {
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      { "<leader>sr", false, mode = { "n", "v" } },
      {
        "<leader>srg",
        mode = { "n" },
        ":lua require('grug-far').open({ transient = true })<cr>",
        desc = "global",
        silent = true,
      },
      {
        "<leader>srf",
        function()
          local is_visual = vim.fn.mode():lower():find("v")
          if is_visual then -- needed to make visual selection work
            vim.cmd([[normal! v]])
          end
          local grug = require("grug-far");
          (is_visual and grug.with_visual_selection or grug.open)({
            prefills = { filesFilter = "*." .. vim.fn.expand("%:e") },
          })
        end,
        mode = { "n", "v" },
        desc = "filetype",
        silent = true,
      },
      {
        "<leader>srl",
        mode = { "n" },
        ":lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<cr>",
        desc = "local",
        silent = true,
      },
      {
        "<leader>srw",
        mode = { "n" },
        ":lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<cr>",
        desc = "gword",
        silent = true,
      },
      {
        "<leader>srw",
        mode = { "v" },
        ":lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<cr>",
        desc = "lword",
        silent = true,
      },
    },
  },
}
