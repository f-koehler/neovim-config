return {
    "stevearc/overseer.nvim",
    opts = {},
    config = function(_, opts)
        require("overseer").setup(opts)
        vim.keymap.set("n", "<leader>tt", "<cmd>OverseerRun<cr>", { desc = "Overseer run task" })
        vim.keymap.set("n", "<leader>to", "<cmd>OverseerToggle<cr>", { desc = "Overseer toggle task list" })
    end,
}
