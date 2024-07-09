local wk = require("which-key")

wk.register({
  w = {
    name = "+window",
  },
}, { prefix = ";", mode = { "n" } })

wk.register({
  sr = {
    name = "+spectre",
  },
}, { prefix = "<leader>", mode = { "n", "v" } })

return {}
