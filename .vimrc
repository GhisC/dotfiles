set nocompatible
set encoding=utf-8
set shell=/bin/bash

" ===== General config =====

set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t

set number relativenumber
set backspace=indent,eol,start
set showcmd
set cmdheight=2
set showmode
set autoread
set cursorline
set mouse=a
" set ttymouse=xterm2
set showmatch
set termguicolors
set undolevels=1000

set incsearch
set hlsearch

set foldmethod=indent
set foldlevel=99

set autowrite
set hidden

syntax enable
let python_highlight_all=1
set colorcolumn=100

set smartcase
set ignorecase

set scrolloff=3

let mapleader=','

" ===== Turn off Swap Files =====

set noswapfile
set nobackup
set nowb

" ===== Indentation =====

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set wrap
set linebreak

" ===== Plugins =====

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle (required)
Plugin 'morhetz/gruvbox'  " Color scheme and airline theme
Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'  " Git wrapper
Plugin 'google/vim-searchindex'
Plugin 'Yggdroot/indentLine'
Plugin 'w0rp/ale'
Plugin 'tweekmonster/django-plus.vim'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'ludovicchabant/vim-gutentags'

if has('nvim')
    " completion
    Plugin 'ncm2/ncm2'
    Plugin 'roxma/nvim-yarp'
    Plugin 'ncm2/ncm2-bufword'
    Plugin 'ncm2/ncm2-path'
    Plugin 'davidhalter/jedi-vim'
    Plugin 'ncm2/ncm2-jedi'
endif

call vundle#end()
filetype plugin indent on

" ===== Theme =====
let g:gruvbox_italic=1
" colorscheme gruvbox
colorscheme codedark

if has('nvim')
    " ===== NCM2 ===== (completion framework)
    autocmd BufEnter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    let ncm2#popup_delay = 5
    let ncm2#complete_length = [[1,1]]
    let g:ncm2#matcher = 'substrfuzzy'
    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endif

" ===== Airline =====
set noshowmode
" let g:airline_theme='gruvbox'
let g:airline_theme='codedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_c = 0
let g:airline_section_x = 0
let g:airline_section_y = 0

" ===== Indent Line =====
set conceallevel=1
let g:indentLine_conceallevel=1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" ===== Tagbar =====
nnoremap <silent> <leader>c :TagbarToggle<CR>
set tags=~/.vim/ctags

" ===== Gutentags =====
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_ctags_executable = '/usr/local/bin/ctags'

" ===== fzf =====
let g:fzf_history_dir = '~/.local/share/fzf-history'
let $FZF_DEFAULT_COMMAND = 'ag --vimgrep --ignore .git --hidden --smart-case -g ""'
let $FZF_CTRL_T_COMMAND = '~/.vim/ctags'
nnoremap <C-p> :FZF<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-n> :Ag<cr>
nnoremap <C-l> :BLines<cr>
nnoremap <C-h> :History<cr>
nnoremap <C-t> :Tags<cr>

" ===== ale =====
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:ale_lint_on_text_changed = 'never'
" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000
let g:ale_lint_on_enter = '0'
let g:ale_lint_on_save = '1'
nmap <silent> <C-M> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)

let g:ale_fix_on_save = 1  " fix file on save
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" ===== vimgutter options =====
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0

" ===== Keybindings ====

" Move between buffers
nnoremap  <silent> <C-k>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <C-j>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Code folding
nnoremap <space> za

" use jj to quickly escape to normal mode while typing <- AWESOME tip
inoremap jj <ESC>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Leader F prefix for file related mappîngs (open, browse...)

" Leader B for buffer related mappings
nnoremap <silent> <Leader>bb :bn<CR> "create (N)ew buffer
nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete the current buffer
nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer"

" Leader G prefix is for SCM (mainly git) related mappings
" nnoremap gs :Gstatus<CR>
" nnoremap gw :Gwrite<CR>
" nnoremap go :Gcommit<CR>
" nnoremap gD :Gdiff<CR>
" set diffopt+=vertical

abbreviate pdb import ipdb; ipdb.set_trace()<esc>
