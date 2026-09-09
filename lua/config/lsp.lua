vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Lsp buf code_action" })
vim.keymap.set({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, { desc = "Lsp buf code_action" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Lsp buf rename" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Lsp buf declaration" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Lsp buf definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Lsp buf references" })

-- Inline inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("config-lsp-inlay-hints", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end,
})
vim.keymap.set("n", "<leader>lh", function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
end, { desc = "Lsp toggle inlay hints" })
