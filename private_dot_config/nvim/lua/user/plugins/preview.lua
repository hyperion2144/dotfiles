return {
  "rmagatti/goto-preview",
  config = function() require("goto-preview").setup {} end,
  keys = {
    { "gp", "", mode = "n", desc = "Go to Preview" },
    {
      "gpd",
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      mode = { "n" },
      desc = "Go to Definition",
    },
    {
      "gpt",
      "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
      mode = { "n" },
      desc = "Go to Type Definition",
    },
    {
      "gpi",
      "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
      mode = { "n" },
      desc = "Go to Implementation",
    },
    { "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", mode = { "n" }, desc = "Close Preview Window" },
    {
      "gpr",
      "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
      mode = { "n" },
      desc = "Go to References",
    },
  },
}
