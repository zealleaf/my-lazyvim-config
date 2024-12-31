return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        provider = "openai_fim_compatible",
        openai_fim_compatible = {
          name = "Deepseek",
          model = "deepseek-chat",
          end_point = "https://api.deepseek.com",
          api_key = os.getenv("DEEPSEEK_API_KEY"),
          stream = true,
          optional = {
            stop = nil,
            max_tokens = nil,
          },
        },
      })
    end,
  },
}
