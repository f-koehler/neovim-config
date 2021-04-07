vim.o.hidden = true

-- enable mouse support
vim.o.mouse = "a"

-- do not conceal (for markdown)
vim.o.conceallevel = 0

-- shows line numbers
vim.wo.number = true

-- highlight line where cursor is located
vim.wo.cursorline = true

-- expand tabs to spaces
vim.bo.expandtab = true

-- smart indenting
vim.bo.smartindent = true

-- always show sign column
vim.wo.signcolumn = "yes"

vim.o.timeoutlen = 100
vim.o.updatetime = 300
vim.o.termguicolors = true
vim.cmd("colorscheme nord")
