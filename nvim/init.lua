-- ##########################
-- Neovim initialization file
-- ##########################

require('globals')
require('settings')
require('plugins')
require('bindings')

-- Plugins config
require('plugins.coc')
require('plugins.colorscheme')
require('plugins.galaxyline')
require('plugins.gitsigns')
require('plugins.gutentags')
-- require('plugins.lsp-install')
require('plugins.nvim-comment')
-- require('plugins.nvim-compe')
-- require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.which-key')

-- LSP
-- require('lsp')
-- require('lsp.python')
