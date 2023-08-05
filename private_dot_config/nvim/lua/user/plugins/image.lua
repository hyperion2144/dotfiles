return {
  -- {
  --   "edluffy/hologram.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("hologram").setup {
  --       auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
  --     }
  --   end,
  -- },
  {
    "nvim-telescope/telescope-media-files.nvim",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "media_files" end,
  },
}
