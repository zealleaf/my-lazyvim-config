return {
  {
    "olimorris/onedarkpro.nvim",
    opts = {
      colors = {
        dark = { bg = "#16191e" },
      },
      options = {
        cursorline = true,
        transparency = true,
      },
      highlights = {
        WhichKeyFloat = { bg = "#16191e" },
        WhichKeyBorder = { bg = "#16191e" },
        NotifyBackground = { bg = "#000000" },
        PmenuSel = { bg = "#2e313a" },
      },
    },
  },
  { "craftzdog/solarized-osaka.nvim" },
  {
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
        },
        groups = {
          all = {
            WhichKeyFloat = { bg = "#16191e" },
            WhichKeyBorder = { bg = "#16191e" },
          },
        },
      })
    end,
  },
}
