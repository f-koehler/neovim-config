local formatters_by_ft = {
    c = { "clang-format" },
    cmake = { "cmake_format" },
    cpp = { "clang-format" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
    nix = { "nixfmt" },
    python = { "ruff" },
    qml = { "qmlformat" },
    rust = { "rustfmt" },
    scss = { "prettier" },
    sh = { "shfmt" },
    terraform = { "terraform_fmt" },
    tex = { "tex-fmt" },
    tfvars = { "terraform_fmt" },
    toml = { "taplo" },
    typescript = { "prettier" },
    yaml = { "prettier" },
}

local mason_exclude = {
    -- not in the mason registry
    rustfmt = true,
    -- not in the mason registry
    qmlformat = true,
}

-- conform's formatter id doesn't always match the mason package name
local mason_package_by_formatter = {
    cmake_format = "cmakelang",
    terraform_fmt = "terraform",
}

local tools = {}
for _, formatters in pairs(formatters_by_ft) do
    for _, formatter in ipairs(formatters) do
        if not mason_exclude[formatter] then
            tools[mason_package_by_formatter[formatter] or formatter] = true
        end
    end
end

return {
    "stevearc/conform.nvim",
    dependencies = {
        {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            dependencies = { "mason-org/mason.nvim" },
            opts = { ensure_installed = vim.tbl_keys(tools) },
        },
    },
    keys = {
        {
            "<C-S-i>",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    config = function()
        require("conform").setup({
            formatters_by_ft = formatters_by_ft,
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
        })
    end,
}
