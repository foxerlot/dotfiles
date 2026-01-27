vim.cmd([[
let mapleader=" "
let maplocalleader=" "
set relativenumber
set number
set ruler
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set termguicolors
set background=dark
set cursorline
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set noshowmatch
set list
set listchars=tab:\\u2502\\u0020,leadmultispace:\\u2502\\u0020\\u0020\\u0020
set fillchars=eob:\\u0020,vert:\\u2502
set laststatus=2
set showcmd
set mousehide
set nowrap
set wrapscan
set matchtime=0
set mouse=a
set belloff=all
set noerrorbells
set novisualbell
set nocp
set signcolumn=yes
set autoread
set noautowrite
set history=200
set sidescroll=5
filetype indent on
filetype plugin on
syntax enable
" colorscheme gruvbox

set makeprg=gcc\ -Wall\ -Wextra\ -Wpedantic\ -std=c23\ %\ -o\ %:r

augroup RunCode
	autocmd!
	autocmd FileType c      nnoremap <buffer> <silent> <F5> :!./%:r<CR>
	autocmd FileType python nnoremap <buffer> <silent> <F5> :!python3 %<CR>
augroup END

augroup QuickfixEnterClose
	autocmd!
	autocmd FileType qf nnoremap <buffer> <silent> <CR> <CR>:cclose<CR>
augroup END

function! GrepPrompt()
	let l:pattern = input('Search: ')
	if empty(l:pattern)
		return
	endif

	let l:escaped = escape(l:pattern, '\/.*$^~[]')
	execute 'silent grep ' . l:escaped . ' %'
	cwindow
	redraw!
endfunction

nnoremap <silent> <leader>e :Ve<CR>
nnoremap <silent> <leader>t :term<CR>
nnoremap <silent> <leader>w <C-w>
nnoremap <silent> <leader>m :silent !rm -rf %:r<CR>:make<CR>:cwindow<CR>
nnoremap <leader>s :call GrepPrompt()<CR>
nnoremap <silent> <C-j> :m+1<CR>
nnoremap <silent> <C-k> :m-2<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap < <<
nnoremap > >>
nnoremap <C-a> ggVG
nnoremap <C-c> "+y
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

inoremap <C-n> <down>
inoremap <C-p> <up>
inoremap <C-f> <right>
inoremap <C-b> <left>
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap <C-m> <CR>

vnoremap <silent> <leader>h "zy:help <C-r>z<CR>
vnoremap < <gv
vnoremap > >gv
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-c> "+y
vnoremap <M-h> <C-w>h
vnoremap <M-j> <C-w>j
vnoremap <M-k> <C-w>k
vnoremap <M-l> <C-w>l

tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
tnoremap <C-\><C-\> <C-\><C-n>:q!<CR>

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'lilydjwg/colorizer'
Plug 'jiangmiao/auto-pairs'

cal plug#end()

colorscheme gruvbox
]])

vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    'vim',
                    'require'
                },
            },
        },
    },
}

vim.lsp.config['clangd'] = {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--header-insertion=iwyu", "--offset-encoding=utf-16"},
    filetypes = { 'c', 'cpp', 'h', 'hpp' },
}

vim.lsp.enable({'lua_ls', 'clangd'})

vim.diagnostic.config({
  virtual_text = true,
})
