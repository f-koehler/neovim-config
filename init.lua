if vim.g.vscode then
    require("config.global")
else
    require("config.global")
    require("config.lazy")

    require("config.lsp")
end
