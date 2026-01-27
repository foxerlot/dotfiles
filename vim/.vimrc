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
set incsearch
set ignorecase
set smartcase
set list
set listchars=tab:\\u2502\\u0020,leadmultispace:\\u2502\\u0020\\u0020\\u0020
set fillchars=eob:\\u0020
set laststatus=2
set mousehide
set nowrap
set mouse=a
filetype plugin on
filetype indent on
syntax enable
colorscheme slate

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
nnoremap < <<
nnoremap > >>
nnoremap <C-a> ggVG

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "<right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "<right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "<right>" : "}"
inoremap <expr> <CR> strpart(getline('.'), col('.')-1, 1) == "}" ? "<CR><BS><ESC>O" : "<CR>"
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
