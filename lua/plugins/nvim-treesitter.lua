return {
  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "cmake",
        "comment",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "scss",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "gitcommit",
        "gitignore",
        "rust",
        "vue",
        "diff",
        "astro",
      })
    end,
  },
}
