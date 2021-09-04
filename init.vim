set encoding=utf-8
set termguicolors

set relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set smartindent

set showmatch

set ruler

set equalalways
set formatoptions=croq

set title
set hlsearch
set ignorecase
set smartcase
set incsearch

set wildmode=longest,list
set clipboard=unnamed
set lazyredraw
set wrap
set linebreak
set ttyfast
set nostartofline
autocmd BufWritePre * :%s/\s\+$//e

syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'

" general library
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" code completion
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'mhinz/vim-startify'
Plug 'nvim-telescope/telescope.nvim'

" pretty stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/lsp-colors.nvim'

Plug 'Sumguy31/vim-osx-arc-moonfly-colors'

" git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" comments
Plug 'b3nj5m1n/kommentary'
Plug 'folke/todo-comments.nvim'
Plug 'folke/trouble.nvim'
Plug 's1n7ax/nvim-comment-frame'

call plug#end()

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '  : '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

colorscheme moonfly
let g:airline_theme='luna'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" autostart coq
let g:coq_settings = { 'auto_start': v:true }

lua << EOF
require('gitsigns').setup()
require'nvim-web-devicons'.setup {
 default = true;
}
require("todo-comments").setup()
require("trouble").setup()
require'nvim-web-devicons'.get_icons()
require('nvim-comment-frame').setup()

-- set up language servers
local coq = require "coq"
local lsp = require "lspconfig"
lsp.pyright.setup(coq.lsp_ensure_capabilities())
lsp.svls.setup(coq.lsp_ensure_capabilities())
lsp.clangd.setup{
    cmd = {"clangd-9", "--background-index"}
}
EOF
