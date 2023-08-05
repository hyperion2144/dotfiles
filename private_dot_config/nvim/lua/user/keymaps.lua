-- o is operator pending mode
-- x is visual mode
local M = {}

function M.mappings(maps)
  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  local utils = require "astronvim.utils"
  local is_available = utils.is_available

  -- print(require("astronvim.utils").is_available "telescope_dap")
  -- print(vim.fn.has "unix" == 1)
  local system = vim.loop.os_uname().sysname

  if vim.g.neovide then
    if system == "Darwin" then
      vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
      -- Save
      maps.n["<D-s>"] = ":w<CR>"
      -- Paste normal mode
      maps.n["<D-v>"] = '"+P'
      -- Copy
      maps.v["<D-c>"] = '"+y'
      -- Paste visual mode
      maps.v["<D-v>"] = '"+P'
      -- Paste command mode
      maps.c["<D-v>"] = "<C-R>+"
      -- Paste insert mode
      maps.i["<D-v>"] = '<esc>"+pli'
    end
  end

  if is_available "markdown-preview.nvim" then
    maps.n["<leader>ue"] = { "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown preview" }
  end

  if is_available "marks.nvim" then
    -- marks
    maps.n["m"] = { desc = "Marks" }
    maps.n["m,"] = { "<Plug>(Marks-setnext)<CR>", desc = "Set Next Lowercase Mark" }
    maps.n["m;"] = { "<Plug>(Marks-toggle)<CR>", desc = "Toggle Mark(Set Or Cancel Mark)" }
    maps.n["m]"] = { "<Plug>(Marks-next)<CR>", desc = "Move To Next Mark" }
    maps.n["m["] = { "<Plug>(Marks-prev)<CR>", desc = "Move To Previous Mark" }
    maps.n["m:"] = { "<Plug>(Marks-preview)", desc = "Preview Mark" }

    maps.n["dm"] = { "<Plug>(Marks-delete)", desc = "Delete Marks" }
    maps.n["dm-"] = { "<Plug>(Marks-deleteline)<CR>", desc = "Delete All Marks On The Current Line" }
    maps.n["dm<space>"] = { "<Plug>(Marks-deletebuf)<CR>", desc = "Delete All Marks On Current Buffer" }
  end

  -- maps.n["<leader>m"] = { desc = "󱂬 Translate" }

  -- terminal
  if "toggleterm.nvim" then maps.t["<C-[>"] = { [[<C-\><C-n>]], desc = "Exit Terminal Mode" } end

  -- close mason
  if is_available "refactoring.nvim" then
    maps.n["<leader>r"] = { desc = " Refactor" }
    maps.v["<leader>r"] = { desc = " Refactor" }
  end

  -- auto save开关
  if is_available "auto-save.nvim" then maps.n["<leader>um"] = { ":ASToggle<CR>", desc = "Toggle AutoSave" } end

  if is_available "vim-visual-multi" then
    -- visual multi
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Find Subword Under"] = "<C-n>",
      ["Add Cursor Up"] = "<C-S-k>",
      ["Add Cursor Down"] = "<C-S-j>",
      ["Select All"] = "<C-S-n>",
      ["Skip Region"] = "<C-x>",
    }
  end

  -- telescope plugin mappings
  if is_available "telescope.nvim" then
    maps.v["<leader>f"] = { desc = "󰍉 Find" }
    maps.n["<leader>fp"] =
      { function() require("telescope").extensions.projects.projects {} end, desc = "Find projects" }
    maps.n["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODOs" }
    maps.n["<leader>fN"] = { "<cmd>Telescope noice<cr>", desc = "Find noice" }
    maps.v["<leader>fr"] =
      { "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", desc = "Find code refactors" }
    -- buffer switching
    maps.n["<leader>bt"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        else
          utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers In Telescope",
    }
  end

  -- visual模式下缩进代码, 缩进后仍然可以继续选中区域
  maps.v["<"] = { "<gv", desc = "Indent to the left" }
  maps.v[">"] = { ">gv", desc = "Indent to the right" }

  -- Comment
  if is_available "Comment.nvim" then
    maps.n["<leader>/"] = {
      function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Comment line",
    }
    maps.v["<leader>/"] =
      { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", desc = "Toggle comment line" }
  end

  -- trouble
  if is_available "trouble.nvim" then
    maps.n["<leader>x"] = { desc = " Trouble" }
    maps.n["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" }
    maps.n["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" }
    maps.n["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" }
    maps.n["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" }
    maps.n["<leader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble)" }
  end

  maps.n["<leader>z"] = { desc = " Tools" }
  if is_available "ccc.nvim" then
    maps.n["<leader>zp"] = { "<CMD>CccPick<CR>", desc = "Pick color" }
    maps.n["<leader>zc"] = { "<CMD>CccConvert<CR>", desc = "Convert color" }
    maps.n["<leader>uC"] = { "<CMD>CccHighlighterToggle<CR>", desc = "Toggle ccc highlighter" }
  end

  if is_available "nvim-treesitter" then
    -- TsInformation
    maps.n["<leader>lT"] = { "<cmd>TSInstallInfo<cr>", desc = "Tree sitter Information" }
  end

  if is_available "neoconf.nvim" then
    -- maps.n["<leader>n"] = { desc = " Neoconf" }
    maps.n["<leader>pd"] = { "<cmd>Neoconf<CR>", desc = "Select local/global neoconf config" }
    maps.n["<leader>pb"] = { "<cmd>Neoconf show<CR>", desc = "Show neoconf merge config" }
    maps.n["<leader>pc"] = { "<cmd>Neoconf lsp<CR>", desc = "Show neoconf merge lsp config" }
  end

  return maps
end

return M
