local cmd = vim.cmd

vim.opt.clipboard="unnamedplus"
vim.opt.termguicolors = true

cmd("set encoding=utf-8")
cmd("set fileencodings=utf-8,cp949")
cmd("set autoindent")
cmd("set cindent")
cmd("set nu")
cmd("set vb")
cmd("set mouse=a")

cmd("set tabstop=4")
cmd("set shiftwidth=4")
cmd("set softtabstop=0")
cmd("set expandtab")

cmd("set laststatus=2")
cmd("set hlsearch")
cmd("set showmatch")
cmd("set smartcase")
cmd("set ruler")
cmd("set incsearch")

cmd("set title")
cmd("set titlestring=%f")

