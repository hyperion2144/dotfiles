return {
  -- add the community repository of plugin specifications
  "astronvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/astronvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.bars-and-lines.scope-nvim" },
  { import = "astrocommunity.bars-and-lines.statuscol-nvim" },

  { import = "astrocommunity.color.ccc-nvim" },
  {
    "uga-rosa/ccc.nvim",
    keys = function() return {} end,
  },
  { import = "astrocommunity.color.headlines-nvim" },
  { import = "astrocommunity.color.modes-nvim" },

  { import = "astrocommunity.completion.codeium-vim" },

  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  {
    "go.nvim",
    config = function()
      require("go").setup {
        lsp_inlay_hints = { enable = false },
      }
    end,
  },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.dart" },
  {
    "flutter-tools.nvim",
    opts = function()
      require("telescope").load_extension "flutter"

      return {
        lsp = require("astronvim.utils.lsp").config "dartls",
        debugger = {
          enabled = true,
          run_via_dap = true,
          register_configurations = function(_)
            require("dap").configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
          end,
        },
        fvm = true,
        dev_tools = {
          autostart = true,
        },
      }
    end,
  },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.wgsl" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.godot" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.pack.html-css" },

  { import = "astrocommunity.programming-language-support.nvim-jqx" },

  { import = "astrocommunity.project.project-nvim" },

  { import = "astrocommunity.search.sad-nvim" },
  { "sad.nvim", config = function()
    require("sad").setup {
      vsplit = true,
    }
  end },

  { import = "astrocommunity.lsp.inc-rename-nvim" },

  { import = "astrocommunity.markdown-and-latex.glow-nvim" },

  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.telescope-dap-nvim" },
  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },

  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },

  { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.hypersonic-nvim" },
  { import = "astrocommunity.editing-support.multicursors-nvim" },
  { import = "astrocommunity.editing-support.mini-splitjoin" },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.editing-support.vim-move" },

  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },

  { import = "astrocommunity.git.openingh-nvim" },
  -- { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },

  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.indent-tools-nvim" },

  -- { import = "astrocommunity.media.drop-nvim" },

  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.flit-nvim" },
  { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.motion.nvim-surround" },

  { import = "astrocommunity.test.neotest" },

  { import = "astrocommunity.utility.neodim" },
  { import = "astrocommunity.utility.nvim-toggler" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
  { import = "astrocommunity.utility.transparent-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  {
    "folke/noice.nvim",
    cond = vim.g.neovide,
    opts = {
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+l, %d+b" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
        { filter = { event = "msg_show", find = "autosave: saved at%s" }, opts = { skip = true } },
      },
    },
  },

  -- { import = "astrocommunity.workflow.bad-practices-nvim" },
}
