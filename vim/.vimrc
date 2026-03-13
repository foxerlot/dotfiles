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

function! SmartPair(key)
    if a:key == "{"
        return "{}\<left>"
    elseif a:key == "["
        return "[]\<left>"
    elseif a:key == "("
        return "()\<left>"
    endif
    let l:next = strpart(getline('.'), col('.')-1, 1)
    if a:key == ")" && l:next == ")"
        return "\<right>"
    elseif a:key == "]" && l:next == "]"
        return "\<right>"
    elseif a:key == "}" && l:next == "}"
        return "\<right>"
    elseif (a:key == '"' || a:key == "'") && l:next == a:key
        return "\<right>"
    elseif a:key == '"'
        return "\"\"\<left>"
    elseif a:key == "'"
        return "''\<left>"
    endif
    return a:key
endfunction

function! SmartCR()
    let pair = strpart(getline('.'), col('.')-2, 2)
    if pair == "{}" || pair == "[]" || pair == "()"
        return "\<CR>\<C-o>O"
    else
        return "\<CR>"
    endif
endfunction

function! SmartBS()
    let pair = strpart(getline('.'), col('.')-2, 2)
    if pair == "{}" || pair == "[]" || pair == "()"
        return "\<BS>\<DEL>"
    else
        return "\<BS>"
    endif
endfunction

inoremap <expr> ( SmartPair("(")
inoremap <expr> [ SmartPair("[")
inoremap <expr> { SmartPair("{")
inoremap <expr> ) SmartPair(")")
inoremap <expr> ] SmartPair("]")
inoremap <expr> } SmartPair("}")
inoremap <expr> ' SmartPair("'")
inoremap <expr> " SmartPair('"')
inoremap <expr> <CR> SmartCR()
inoremap <expr> <BS> SmartBS()
inoremap <C-o> <esc>O

nnoremap <C-a> ggVG
nnoremap <leader>t :term<CR>
nnoremap <silent> <leader>m :make<CR>:cwindow<CR>
nnoremap <leader>e :Ve<CR>
nnoremap <leader>x :%!xxd<CR>
nnoremap <silent> <C-j> :m+1<CR>==
nnoremap <silent> <C-k> :m-2<CR>==
nnoremap <C-d> 15jzz
nnoremap <C-u> 15kzz
nnoremap <C-b>n :bnext<CR>
nnoremap <C-b>p :bprevious<CR>
nnoremap <C-b>d :bdelete<CR>
nnoremap <C-b>l :buffers<CR>
nnoremap <C-,> 3<C-w><
nnoremap <C-.> 3<C-w>>

vnoremap < <gv
vnoremap > >gv
vnoremap <C-c> "+y
vnoremap <C-x> <esc>v
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-k> :m '<-2<CR>gv=gv
vnoremap ~ ~gv

cnoremap <C-b> <left>
cnoremap <C-n> <down>
cnoremap <C-p> <up>
cnoremap <C-f> <right>
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cnoremap <C-x> <C-f>

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
Plug 'morhetz/gruvbox'
Plug 'lilydjwg/colorizer'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'google/vim-searchindex'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

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

set statusline=%#StlFile#%f\ %{%ModeHL()%}%m%r%=%{&fileencoding?&fileencoding:&encoding}\ %#StlFile#%S%y[%l\:%c]

