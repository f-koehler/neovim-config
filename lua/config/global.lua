-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- default indentation settings
vim.opt.autoindent = true -- copy indent from current line to new one
vim.opt.smartindent = true
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.tabstop = 4 -- number of spaces in a <Tab>
vim.opt.shiftwidth = 4 -- number of spaces for each indentation
vim.opt.softtabstop = 4 -- number of spaces in tab while editing

-- window and buffer management
vim.opt.hidden = true -- allow switching buffers without saving
vim.opt.confirm = true -- ask for confirmation instead of failing???

-- search settings
vim.opt.incsearch = true -- show search matches as you type
vim.opt.hlsearch = true -- highlight search results
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- override ignorecase if search contains uppercase

-- display settings
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.scrolloff = 8 -- keep 8 lines above and below the cursor
vim.opt.sidescrolloff = 8 -- keep 8 columns left and right of the cursor
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.termguicolors = true -- enable 24-bit RGB colors

-- performance
vim.opt.lazyredraw = false -- don't redraw during macros (disabled for better UX)
vim.opt.updatetime = 250 -- fast completion and swap file writing
vim.opt.timeoutlen = 500 -- time to wait for mapped sequence
