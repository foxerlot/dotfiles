" NOTE: i do not use vim, i use neovim. my neovim configuration files can be found in foxerlot/nodtvim
let g:mapleader = " "
let g:maplocalleader = " "
syntax on

set number
set relativenumber
set numberwidth=4
set autoindent
set smartindent
set copyindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set ruler
set nocursorline
set nocursorcolumn
set wrap
set noshowmode
set sidescroll=5
set sidescrolloff=3
set scrolloff=3
set noerrorbells
set nohlsearch
set noshowmatch
set backspace=indent,start
set list
set listchars=trail:⋅
set completeopt=menu,menuone,noselect
set mousehide

inoremap { {}<left>
inoremap <expr> <CR> strpart(getline('.'), col('.')-1, 1) == "}" ? "<CR><CR><ESC>kS" : "<CR>"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "<right>" : "}"

nnoremap <Leader>w <C-w>
nnoremap <Leader>e :Vexplore<CR>

vnoremap <Leader>h y:<C-u>help <C-r>0<CR>
