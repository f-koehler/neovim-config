return {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function(_, opts)
        vim.lsp.config("ansiblels", {})
        vim.lsp.config("lua_ls", {})
        vim.lsp.config("clangd", {})
        vim.lsp.config("qmlls", {})
    end,
}
