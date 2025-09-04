return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                scss = { "prettier" },
                yaml = { "prettier" },
                toml = { "taplo" },
            },
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
        })
    end,
}
