local servers = {
    ansiblels = {},
    basedpyright = {},
    bashls = {},
    clangd = {},
    docker_compose_language_service = {},
    docker_language_server = {},
    gh_actions_ls = {},
    gopls = {},
    harper_ls = {},
    lua_ls = {},
    neocmake = {},
    nil_ls = {},
    qmlls = {},
    ruff = {},
    rust_analyzer = {},
    statix = {},
    taplo = {},
    tofu_ls = {},
    terraformls = {},
    texlab = {},
    yamlls = {},
    zizmor = {},
}

-- executable of each server; Mason only installs servers that aren't already
-- on PATH (e.g. provided by Nix, see home/editor-tools.nix)
local executables = {
    ansiblels = "ansible-language-server",
    basedpyright = "basedpyright-langserver",
    bashls = "bash-language-server",
    clangd = "clangd",
    docker_compose_language_service = "docker-compose-langserver",
    docker_language_server = "docker-language-server",
    gh_actions_ls = "gh-actions-language-server",
    gopls = "gopls",
    harper_ls = "harper-ls",
    lua_ls = "lua-language-server",
    neocmake = "neocmakelsp",
    nil_ls = "nil",
    qmlls = "qmlls",
    ruff = "ruff",
    rust_analyzer = "rust-analyzer",
    statix = "statix",
    taplo = "taplo",
    tofu_ls = "tofu-ls",
    terraformls = "terraform-ls",
    texlab = "texlab",
    yamlls = "yaml-language-server",
    zizmor = "zizmor",
}

local mason_ensure_installed = {}
for server in pairs(servers) do
    if vim.fn.executable(executables[server]) == 0 then
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
