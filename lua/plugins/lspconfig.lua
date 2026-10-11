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

local mason_exclude = {
    -- a, b
}

-- mason fetches prebuilt binaries for these, which don't run on NixOS,
-- so they come from nixpkgs there instead (see nixos-tools.nix)
local nixpkgs_on_nixos = {
    basedpyright = true, -- the pypi package bundles a prebuilt node
    clangd = true,
    docker_language_server = true,
    harper_ls = true,
    lua_ls = true,
    neocmake = true,
    qmlls = true,
    ruff = true,
    rust_analyzer = true,
    -- not a binary, but mason's cargo build fails without --locked
    statix = true,
    taplo = true,
    terraformls = true,
    tofu_ls = true,
    texlab = true,
    zizmor = true, -- the pypi package is a prebuilt binary
}

local is_nixos = require("config.platform").is_nixos

local mason_ensure_installed = {}
for server in pairs(servers) do
    if not mason_exclude[server] and not (is_nixos and nixpkgs_on_nixos[server]) then
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
