local servers = {
    ansiblels = {},
    lua_ls = {},
    clangd = {},
    qmlls = {},
    ruff = {},
    rust_analyzer = {},
}

return {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
        for server, config in pairs(servers) do
            vim.lsp.config(server, config)
        end
        vim.lsp.enable(vim.tbl_keys(servers))
    end,
}
