local wk = require("which-key")

wk.register({
  sf = {
    name = "+write",
  },
})

wk.register({
  sr = {
    name = "+spectre",
  },
}, { prefix = "<leader>", mode = { "n", "v" } })

return {}
