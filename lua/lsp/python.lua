require("lspconfig").pyright.setup {
    cmd = {
        vim.fn.stdpath("data") ..
            "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"
    }
}
