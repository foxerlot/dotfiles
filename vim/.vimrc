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
syntax enable
colorscheme catppuccin_mocha
set cursorline
set showmatch
set incsearch
set ignorecase
set smartcase
set list
set listchars=leadmultispace:\\u2502\\u0020\\u0020\\u0020,trail:⋅
set fillchars=vert:\\u2502,eob:\\u0020
set backspace-=eol
set laststatus=2
set mousehide

augroup AutoNoHl
    autocmd!
    autocmd CmdLineLeave /,\? set nohlsearch
    autocmd CmdLineEnter /,\? set hlsearch
augroup END

nnoremap <silent> <Leader>e :Ve<CR>
nnoremap < <<
nnoremap > >>

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "<right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "<right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "<right>" : "}"
inoremap <expr> <CR> strpart(getline('.'), col('.')-1, 1) == "}" ? "<CR><CR><ESC>kS" : "<CR>"

vnoremap <silent> <Leader>h y:help <C-r>0<CR>
vnoremap <Leader>/ y/<C-r>0
