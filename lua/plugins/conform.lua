local formatters_by_ft = {
    cpp = { "clang-format" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
    python = { "ruff" },
    scss = { "prettier" },
    tex = { "tex-fmt" },
    toml = { "taplo" },
    typescript = { "prettier" },
    yaml = { "prettier" },
}

local mason_exclude = {
    -- a, b
}

local tools = {}
for _, formatters in pairs(formatters_by_ft) do
    for _, formatter in ipairs(formatters) do
        if not mason_exclude[formatter] then
            tools[formatter] = true
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
