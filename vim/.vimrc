let g:mapleader = " "
let g:maplocalleader = " "
set number
set relativenumber
set autoindent
set smartindent
set cindent
set nocompatible
set background=dark
set belloff=all
set novisualbell
set noerrorbells
set cursorline
set expandtab
set shiftwidth=4
set tabstop=4
set list
set listchars=tab:\\u2502\\u0020,space:⋅,leadmultispace:\\u2502\\u0020\\u0020\\u0020
set fillchars=vert:\\u2503
set mouse=a
set showcmd
set showmode
set termguicolors
set warn
set nowrap
filetype indent on
filetype plugin on
syntax enable

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "<right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "<right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "<right>" : "}"
inoremap <C-x> <C-o>
inoremap <C-o> <esc>O

nnoremap <C-a> ggVG
nnoremap <leader>t :term<CR>
nnoremap <silent> <leader>m :make<CR>:cwindow<CR>
nnoremap <leader>e :Ve<CR>
nnoremap <C-d> 15jzz
nnoremap <C-u> 15kzz
nnoremap <C-b>n :bnext<CR>
nnoremap <C-b>p :bprevious<CR>
nnoremap <C-b>d :bdelete<CR>
nnoremap <C-b>l :buffers<CR>

vnoremap < <gv
vnoremap > >gv
vnoremap <C-c> "+y

cnoremap <C-b> <left>
cnoremap <C-n> <down>
cnoremap <C-p> <up>
cnoremap <C-f> <right>
cnoremap <C-a> <home>
cnoremap <C-e> <end>

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
" Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'lilydjwg/colorizer'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'google/vim-searchindex'

call plug#end()

colorscheme gruvbox
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
set noautowrite

highlight StlInsert  ctermbg=magenta ctermfg=black
highlight StlVisual  ctermbg=blue ctermfg=black
highlight StlCommand ctermbg=green ctermfg=black
highlight StlFile    ctermbg=gray ctermfg=black
highlight StlNormal  ctermbg=black

function! ModeHL()
    if mode() ==# 'i'
        return '%#StlInsert#'
    elseif mode() ==# 'v' || mode() ==# 'V' || mode() ==# "\<C-v>"
        return '%#StlVisual#'
    elseif mode() ==# 'c'
        return '%#StlCommand#'
    endif
    return "%#StlNormal#"
endfunction

set statusline=%#StlFile#%f\ %{%ModeHL()%}%m%r%=%#StlFile#\ %S%{&fileencoding?&fileencoding:&encoding}%y[%l\:%c]

