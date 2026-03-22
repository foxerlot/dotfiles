let g:mapleader = " "
let g:maplocalleader = " "
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_sort_by = "exten"
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
set ignorecase
set list
set listchars=tab:\\u2502\\u0020,space:⋅,leadmultispace:\\u2502\\u0020\\u0020\\u0020
set fillchars=vert:\\u2503
set mouse=a
set showcmd
set splitbelow
set warn
set nowrap
set foldmethod=marker
set omnifunc=syntaxcomplete#Complete
filetype indent on
filetype plugin on
syntax enable

" functions {{{
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

function! s:ResetToNetrw() abort
    for buf in getbufinfo({'buflisted': 1})
        execute 'bdelete ' . buf.bufnr
    endfor
    Explore
endfunction
" }}}

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

nnoremap <C-a> ggVG
nnoremap <silent> <leader>m :make<CR>:cwindow<CR>
nnoremap <leader>t :term<CR>
nnoremap <leader>e :Ve<CR>
nnoremap <leader>x :%!xxd -g 1<CR>:setlocal syntax=xxd<CR>:syntax match xxdNull /\<00\>/<CR>:highlight xxdNull ctermfg=gray<CR>
nnoremap <silent> <leader>b :BufPick<CR>
nnoremap <silent> <C-j> :m+1<CR>==
nnoremap <silent> <C-k> :m-2<CR>==
nnoremap <C-d> 15jzz
nnoremap <C-u> 15kzz
nnoremap <C-n> 5j
nnoremap <C-p> 5k
nnoremap <C-b>n :bnext<CR>
nnoremap <C-b>p :bprevious<CR>
nnoremap <C-b>d :bdelete<CR>
nnoremap <C-b>l :buffers<CR>
nnoremap <silent> <C-b>e :call <SID>ResetToNetrw()<CR>
nnoremap <C-,> 3<C-w><
nnoremap <C-.> 3<C-w>>
nnoremap zj <C-e>
nnoremap zk <C-y>
nnoremap <S-up> <C-a>
nnoremap <S-down> <C-x>

vnoremap < <gv
vnoremap > >gv
vnoremap <leader>h "9y:<C-u>h <C-r>9<CR>
vnoremap <C-c> "+y
vnoremap <C-x> <esc>v
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-k> :m '<-2<CR>gv=gv
vnoremap <C-d> 15jzz
vnoremap <C-u> 15kzz
vnoremap <C-n> 5j
vnoremap <C-p> 5k

tnoremap <esc> <C-w>N

" emacs remaps {{{
cnoremap <C-b> <left>
cnoremap <C-n> <down>
cnoremap <C-p> <up>
cnoremap <C-f> <right>
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cnoremap <C-x> <C-f>
snoremap <C-b> <left>
snoremap <C-n> <down>
snoremap <C-p> <up>
snoremap <C-f> <right>
snoremap <C-a> <home>
snoremap <C-e> <end>
tnoremap <C-b> <left>
tnoremap <C-n> <down>
tnoremap <C-p> <up>
tnoremap <C-f> <right>
tnoremap <C-a> <home>
tnoremap <C-e> <end>
" }}}

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
Plug 'morhetz/gruvbox'
Plug 'lilydjwg/colorizer'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'google/vim-searchindex'
Plug 'foxerlot/scratch-shell.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neovimhaskell/haskell-vim'

call plug#end()

colorscheme gruvbox
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
set noautowrite
set noshowmode
set signcolumn=no
set termguicolors
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_indent_if = 2
let g:haskell_indent_case = 2

" statusline {{{
highlight StlModeHl    ctermbg=blue ctermfg=16
highlight StlModeArrow ctermbg=245 ctermfg=blue
highlight StlPadHl     ctermbg=245 ctermfg=255
highlight StlPadArrow  ctermbg=none ctermfg=245
highlight StlNone      ctermbg=none ctermfg=255

function! StlMode()
    let l:mode = mode()
    let l:short = winwidth(0) < 50
    if l:mode[0] == "n"
        highlight StlModeHl ctermbg=lightblue
        highlight StlModeArrow ctermfg=lightblue
        return l:short ? "N" : "NORMAL"
    elseif l:mode[0] == "i"
        highlight StlModeHl ctermbg=lightgreen
        highlight StlModeArrow ctermfg=lightgreen
        return l:short ? "I" : "INSERT"
    elseif l:mode[0] == "r"
        highlight StlModeHl ctermbg=red
        highlight StlModeArrow ctermfg=red
        return l:short ? "R" : "REPLACE"
    elseif l:mode[0] == "v"
        highlight StlModeHl ctermbg=lightmagenta
        highlight StlModeArrow ctermfg=lightmagenta
        return l:short ? "V" : "VISUAL"
    elseif l:mode[0] == "s"
        highlight StlModeHl ctermbg=magenta
        highlight StlModeArrow ctermfg=magenta
        return l:short ? "S" : "SELECT"
    elseif l:mode[0] == "c"
        highlight StlModeHl ctermbg=lightcyan
        highlight StlModeArrow ctermfg=lightcyan
        return l:short ? "C" : "COMMAND"
    else
        return l:short ? "?" : "OTHER"
    endif
endfunction

function! StlGit()
    let head = FugitiveHead()
    let [a,m,r] = GitGutterGetHunkSummary()
    return head == "" ? "" : "  " . head . " " . printf('+%d ~%d -%d', a, m, r) . " "
    return 
endfunction

set statusline=%#StlModeHl#\ %{StlMode()}\ %#StlModeArrow#
set statusline+=%#StlPadHl#%{StlGit()}%#StlPadArrow#
set statusline+=%#StlNone#\ %f%m%r%=%S%{&filetype}\ 
set statusline+=%#StlPadArrow#%#StlPadHl#\ %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}]\ 
set statusline+=%#StlModeArrow#%#StlModeHl#\ %L-%l\:%c\ 
" }}}

augroup Atocmds
    autocmd!
    autocmd FileType qf setlocal nolist
    autocmd filetype vim nnoremap <buffer> <silent> <leader>m :w<CR>:so<CR>
    autocmd VimEnter * nunmap <space>tc
    autocmd FileType lisp setlocal makeprg=sbcl\ --script\ %
augroup END

nnoremap <leader>cc :ScratchPrompt<CR>
nnoremap <leader>cr :ScratchRepeat<CR>
nnoremap <leader>ce :ScratchEdit<CR>
nnoremap <leader>cm :ScratchMake<CR>
nnoremap <leader>cd :ScratchPrompt cd ..<CR>
