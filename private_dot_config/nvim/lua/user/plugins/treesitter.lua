return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      -- "lua"
    })
    return {
      hilight = {
        enable = true,
        disable = {"dart"},
      },
      indent = {
        enable = true,

        -- NOTE: enabling indentation significantly slows down editing in Dart files
        disable = { "dart" },
      },
    }
  end,
}
