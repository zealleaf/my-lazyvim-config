---@diagnostic disable: assign-type-mismatch
return {
  -- mason.nvim
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "html-lsp",
        "css-lsp",
        "eslint_d",
        "prettierd",
      })
    end,
  },
  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
