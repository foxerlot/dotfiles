let mapleader=" "
let maplocalleader=" "
set number
set relativenumber
set ruler
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set termguicolors
colorscheme gruvbox
set background=dark
syntax enable
set cursorline
set showmatch
set incsearch
set ignorecase
set smartcase
set list
set listchars=leadmultispace:\\u2502\\u0020\\u0020\\u0020
set fillchars=eob:\\u0020
set laststatus=2
set mousehide
set nowrap
set mouse=a
set clipboard=unnamedplus

augroup AutoNoHl
    autocmd!
    autocmd CmdLineLeave /,\? set nohlsearch
    autocmd CmdLineEnter /,\? set hlsearch
augroup END

nnoremap <silent> <leader>e :Ve<CR>
nnoremap <silent> <M-w> <C-w>w
nnoremap <silent> <C-j> :m+1<CR>
nnoremap <silent> <C-k> :m-2<CR>
nnoremap < <<
nnoremap > >>

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "<right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "<right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "<right>" : "}"
inoremap <expr> <CR> strpart(getline('.'), col('.')-1, 1) == "}" ? "<CR><BS><ESC>O" : "<CR>"

vnoremap <silent> <leader>h y:help <C-r>0<CR>
vnoremap <silent> <leader>/ y/<C-r>0

tnoremap <silent> <M-w> <C-w>w
