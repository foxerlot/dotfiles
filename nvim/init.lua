vim.cmd([[
let mapleader=" "
let maplocalleader=" "
set number
set relativenumber
set ruler
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set history=200
set showcmd
set noshowmode
set nowrap
set sidescroll=5
set list
set listchars=tab:\\u2502\\u0020,leadmultispace:\\u2502\\u0020\\u0020\\u0020
set fillchars=eob:\\u0020,vert:\\u2502
set noautowrite
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noshowmatch
set matchtime=0
set laststatus=2
set termguicolors
syntax on
set cursorline
set mousehide
set mouse=a
set noerrorbells
set novisualbell
set belloff=all
set completeopt=menuone,noinsert,noselect
set nocp
set signcolumn=yes
filetype plugin on
set makeprg=gcc\ -std=c23\ -Wall\ -Wextra\ -Wpedantic\ -g\ %

augroup AutoNoHl
    autocmd!
    autocmd CmdLineLeave /,\? set nohlsearch
    autocmd CmdLineEnter /,\? set hlsearch
augroup END

nnoremap <silent> <C-j> :m+1<CR>
nnoremap <silent> <C-k> :m-2<CR>
nnoremap <silent> <C-a> ggVG
nnoremap <silent> <F5> :silent !rm -rf ./a.out<CR>:make<CR>:!./a.out<CR>
nnoremap <silent> <leader>e :Ve<CR>
nnoremap < <<
nnoremap > >>

vnoremap <silent> <leader>h y:help <C-r>0<CR>
vnoremap <silent> <leader>/ y/<C-r>0<CR>

call plug#begin()

Plug 'windwp/nvim-autopairs'
Plug 'nvim-lualine/lualine.nvim'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'alec-gibson/nvim-tetris'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'kawre/leetcode.nvim'

call plug#end()

colorscheme gruvbox-baby
]])

require("nvim-autopairs").setup {}
require('lualine').setup()
require('leetcode').setup {
    ---@type string
    arg = "leetcode.nvim",

    ---@type lc.lang
    lang = "c",

    cn = { -- leetcode.cn
        enabled = false, ---@type boolean
        translator = true, ---@type boolean
        translate_problems = true, ---@type boolean
    },

    ---@type lc.storage
    storage = {
        home = vim.fn.stdpath("data") .. "/leetcode",
        cache = vim.fn.stdpath("cache") .. "/leetcode",
    },

    ---@type table<string, boolean>
    plugins = {
        non_standalone = false,
    },

    ---@type boolean
    logging = true,

    injector = {}, ---@type table<lc.lang, lc.inject>

    cache = {
        update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
    },

    editor = {
        reset_previous_code = true, ---@type boolean
        fold_imports = true, ---@type boolean
    },

    console = {
        open_on_runcode = true, ---@type boolean

        dir = "row", ---@type lc.direction

        size = { ---@type lc.size
            width = "90%",
            height = "75%",
        },

        result = {
            size = "60%", ---@type lc.size
        },

        testcase = {
            virt_text = true, ---@type boolean

            size = "40%", ---@type lc.size
        },
    },

    description = {
        position = "left", ---@type lc.position

        width = "40%", ---@type lc.size

        show_stats = true, ---@type boolean
    },

    ---@type lc.picker
    picker = { provider = nil },

    hooks = {
        ---@type fun()[]
        ["enter"] = {},

        ---@type fun(question: lc.ui.Question)[]
        ["question_enter"] = {},

        ---@type fun()[]
        ["leave"] = {},
    },

    keys = {
        toggle = { "q" }, ---@type string|string[]
        confirm = { "<CR>" }, ---@type string|string[]

        reset_testcases = "r", ---@type string
        use_testcase = "U", ---@type string
        focus_testcases = "H", ---@type string
        focus_result = "L", ---@type string
    },

    ---@type lc.highlights
    theme = {},

    ---@type boolean
    image_support = false,
}

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
