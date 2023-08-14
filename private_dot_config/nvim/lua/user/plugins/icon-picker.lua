return {
  "ziontee113/icon-picker.nvim",
  config = function()
    require("icon-picker").setup {
      disable_legacy_commands = true,
    }

  end,
  keys = {
    { "<Leader>zP", "<cmd>IconPickerNormal<cr>",mode = { "n"}, desc = "Icon Picker" },
    { "<Leader>zY", "<cmd>IconPickerYank<cr>",mode = { "n"}, desc = "Yank the selected icon into register" },
    { "<C-i>", "<cmd>IconPickerInsert<cr>",mode = { "i"}, desc = "Icon Insert" },
  }
}
