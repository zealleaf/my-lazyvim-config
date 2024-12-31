return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        yaml = { "prettierd" },
        toml = { "taplo" },
        svg = { "lemminx" },
        bash = { "shfmt" },
        lua = { "stylua" },
        html = { "prettierd" },
        css = { "prettierd" },
        less = { "prettierd" },
        javascript = { "prettierd", "eslint_d" },
        typescript = { "prettierd", "eslint_d" },
        javascriptreact = { "prettierd", "eslint_d" },
        typescriptreact = { "prettierd", "eslint_d" },
        vue = { "prettierd", "eslint_d" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        markdown = {
          "prettierd",
          "markdownlint",
        },
        c = { "clang_format" },
        rust = { "rustfmt" },
        python = {
          formatters = { "isort", "black" },
          run_all_formatters = true,
        },
        go = {
          formatters = { "gofumpt", "goimports" },
          run_all_formatters = true,
        },
      },
    },
  },
}
