return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            extensions = {
                file_browser = {
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {
                            -- your custom insert mode mappings
                        },
                        ["n"] = {
                            -- your custom normal mode mappings
                        },
                    },
                },
            },
        })

        -- Load the file browser extension
        telescope.load_extension("file_browser")

        -- Keymaps for file browser
        vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "Telescope file browser" })
        vim.keymap.set(
            "n",
            "<leader>fc",
            ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
            { desc = "Telescope file browser (current dir)" }
        )
        -- vim-vinegar style "-" key for current directory
        vim.keymap.set(
            "n",
            "-",
            ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
            { desc = "Open file browser in current directory" }
        )
    end,
}
