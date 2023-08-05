return {
  "simrat39/symbols-outline.nvim",
  event = "VeryLazy",
  config = function() require("symbols-outline").setup() end,
  opts = {},
  keys = {
    { "<leader>uo", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
  },
}
