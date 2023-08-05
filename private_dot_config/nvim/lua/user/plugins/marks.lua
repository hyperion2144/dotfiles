return {
  "chentoast/marks.nvim",
  lazy = true,
  event = "User AstroFile",
  config = function()
    require("marks").setup {
      default_mappings = false,
      builtin_marks = { "", "⚑" },
      cyclic = true,
      force_write_shada = false,
      refresh_interval = 250,
      excluded_filetypes = {
        "qf",
        "NvimTree",
        "toggleterm",
        "TelescopePrompt",
        "alpha",
        "netrw",
        "neo-tree",
      },
    }
  end,
}
