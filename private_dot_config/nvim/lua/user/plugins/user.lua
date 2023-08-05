return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = vim.g.transparent_background,
      show_end_of_buffer = true,
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        aerial = true,
        alpha = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        leap = true,
        markdown = true,
        mason = true,
        mini = true,
        neotree = true,
        noice = true,
        cmp = true,
        dap = { enabled = true, enable_ui = true },
        native_lsp = {
          enabled = true,
          inlay_hints = {
            background = true,
          },
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        notify = true,
        semantic_tokens = true,
        treesitter_context = true,
        treesitter = true,
        nvimtree = false,
        ts_rainbow = true,
        ts_rainbow2 = true,
        symbols_outline = true,
        telescope = true,
        lsp_trouble = true,
        which_key = true,
        headlines = true,
        sandwich = true,
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      local newOpt = {
        timeout = 0,
      }
      if vim.g.transparent_background then newOpt.background_colour = "#0f1117" end
      return require("astronvim.utils").extend_tbl(opts, newOpt)
    end,
  },
}
