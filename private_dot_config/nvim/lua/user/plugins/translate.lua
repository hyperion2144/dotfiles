return {
  "JuanZoran/Trans.nvim",
  build = function() require("Trans").install() end,
  keys = {
    -- 可以换成其他你想映射的键
    { "<leader>zt", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = " Translate" },
    { "<leader>zf", mode = { "n", "x" }, "<Cmd>TransPlay<CR>", desc = " Auto Play" },
    -- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
    { "<leader>zi", "<Cmd>TranslateInput<CR>", desc = " Translate From Input" },
  },
  dependencies = { "kkharji/sqlite.lua" },
  opts = {
    -- your configuration there
    frontend = {
      default = {
        theme = "tokyonight",
        auto_play = false,
      },
    },
  },
}
