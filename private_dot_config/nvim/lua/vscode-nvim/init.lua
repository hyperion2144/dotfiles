require('vscode-nvim.keybindings')
require('vscode-nvim.options')
require('vscode-nvim.lazy')

vim.api.nvim_exec([[
augroup autosave
    autocmd!
    autocmd InsertLeave * call VSCodeNotify("workbench.action.files.save")
augroup end
]], false)
