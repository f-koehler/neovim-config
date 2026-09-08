local servers = {
    ansiblels = {},
    basedpyright = {},
    clangd = {},
    gh_actions_ls = {},
    harper_ls = {},
    lua_ls = {},
    qmlls = {},
    rust_analyzer = {},
    texlab = {},
}

local mason_exclude = {
    -- a, b
}

local mason_ensure_installed = {}
for server in pairs(servers) do
    if not mason_exclude[server] then
        table.insert(mason_ensure_installed, server)
    end
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        {
            "mason-org/mason-lspconfig.nvim",
            dependencies = { "mason-org/mason.nvim" },
            opts = {
                -- we call vim.lsp.enable ourselves below
                automatic_enable = false,
                ensure_installed = mason_ensure_installed,
            },
        },
    },
    config = function()
        for server, config in pairs(servers) do
            vim.lsp.config(server, config)
        end
        vim.lsp.enable(vim.tbl_keys(servers))
    end,
}
