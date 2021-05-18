vim.g.fzf_history_dir = '~/.local/share/fzf-history'
vim.cmd([[
    let $FZF_DEFAULT_COMMAND = 'ag --vimgrep --ignore .git --hidden --smart-case -g ""'
    let $FZF_CTRL_T_COMMAND = '~/.cache/nvim/ctags'
]])

vim.api.nvim_set_keymap('n', '<Leader>f', ':FZF<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>n', ':Ag<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>l', ':BLines<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>h', ':History<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>t', ':Tags<CR>', {noremap = true})
