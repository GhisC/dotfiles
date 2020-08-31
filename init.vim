set nocompatible
set encoding=utf-8
set shell=/bin/bash

" ===== General config =====

set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t

set number relativenumber
set backspace=indent,eol,start
set showcmd
set cmdheight=2
set updatetime=300
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
set colorcolumn=100

set smartcase
set ignorecase

set scrolloff=3

let mapleader=','

" ===== Clipboard =====
"
set clipboard+=unnamedplus
" let g:clipboard = {
"       \   'name': 'myClipboard',
"       \   'copy': {
"       \      '+': 'pbcopy',
"       \      '*': 'pbcopy',
"       \    },
"       \   'paste': {
"       \      '+': '+',
"       \      '*': '*',
"       \   },
"       \   'cache_enabled': 1,
"       \ }

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

" ===== Splits =====

set splitbelow
set splitright

" ===== Plugins =====

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle (required)
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
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
" Plugin 'christoomey/vim-tmux-navigator'  " CONFLICTS WITH SOME KEY BINDINGS

" completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

call vundle#end()
filetype plugin indent on

" ===== Theme =====
colorscheme gruvbox
let python_highlight_all=1

" ===== coc =====
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-python',
  \ ]

" ===== Airline =====
set noshowmode
let g:airline_theme='gruvbox'
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
nnoremap <silent> <leader>c :TagbarOpenAutoClose<CR>

" ===== Gutentags =====
set tags=~/.vim/ctags
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

" Move betweens splits
" nnoremap <D-J> <C-W><C-J>
" nnoremap <D-K> <C-W><C-K>
" nnoremap <D-L> <C-W><C-L>
" nnoremap <D-H> <C-W><C-H>

" Code folding
nnoremap <space> za

" use jk to quickly escape to normal mode while typing <- AWESOME tip
inoremap jk <ESC>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Leader F prefix for file related mappîngs (open, browse...)

" Leader B for buffer related mappings
nnoremap <silent> <Leader>bb :bn<CR> "create (N)ew buffer
nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete the current buffer
nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer"

abbreviate pdb import ipdb; ipdb.set_trace()<esc>
