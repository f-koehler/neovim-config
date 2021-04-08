require("lspconfig").texlab.setup {
    cmd = { vim.fn.stdpath("data") .. "/lspinstall/latex/texlab" },
}
