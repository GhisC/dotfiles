-- =========================
-- NEOVIM CONFIGURATION FILE
-- =========================

-- ==========
-- Definitions
-- ==========

--[[
Vim has 3 kinds of options — global, buffer-local and window-local:
- vim.api.nvim_set_option()
- vim.api.nvim_buf_set_option()
- vim.api.nvim_win_set_option()
]]

local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- ==========
-- Map leader
-- ==========

vim.g.mapleader = ' '

-- ======
-- Editor
-- ======

o.timeoutlen = 100
o.updatetime = 300

-- Files
o.swapfile = false
o.backup = false 
o.writebackup = false 

-- Encoding
o.fileencoding = "utf-8" -- The encoding written to file

-- Clipboard
o.clipboard = "unnamedplus"

-- Indentation
-- TODO Does work with lua syntax
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')
bo.smartindent = true

-- Buffers
o.autowrite = true
o.hidden = true
o.title = true
o.titlestring="%<%F%=%l/%L - nvim"

-- ========
-- Terminal
-- ========

-- Enable mouse
o.mouse = "a" 

-- ======
-- Visual
-- ======

-- True color support
o.termguicolors = true
o.t_Co = "256"

-- Scroll
o.scrolloff = 2

-- Line numbers
wo.number = true
wo.relativenumber = true

-- Syntax highlighting
vim.cmd [[filetype plugin indent on]]
vim.cmd [[syntax enable]]

-- Search
o.hlsearch = false

-- Splits
o.splitbelow = true 
o.splitright = true

-- Mode
o.showmode = false 

-- Tabline
o.showtabline = 2 

-- Characters
wo.list = true
wo.listchars = "trail:·,tab:→ ,nbsp:·"

-- Sign column
wo.signcolumn = "yes" 

-- Command
o.cmdheight = 2 

-- Cursor line and column
wo.cursorline = true 
wo.colorcolumn = "100"
o.ruler = true

-- Folds
wo.foldmethod = "indent"
wo.foldlevel = 99

-- ========
-- Commands
-- ========

o.smartcase = true
o.ignorecase = true

-- TODO move to completion plugin config
-- ==========
-- Completion
-- ==========

o.completeopt = "menuone,noinsert,noselect"

-- Make popup menu smaller
o.pumheight = 10 

-- Disable messages
o.shortmess = o.shortmess.."c"


-- vim.o.shell = 'zsh'
-- vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
