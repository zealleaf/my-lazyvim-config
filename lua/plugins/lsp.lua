return {

  -- mason.nvim
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css-lsp",
        "eslint-lsp",
        "eslint_d",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "marksman",
        "prettierd",
        "shfmt",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    init = function() end,
  },
}
