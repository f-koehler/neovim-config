-- use codelldb from PATH (e.g. from Nix, see home/editor-tools.nix) if there is one,
-- otherwise let Mason install it (checked before Mason adds its bin dir to PATH)
local system_codelldb = vim.fn.executable("codelldb") == 1

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            dependencies = { "nvim-neotest/nvim-nio" },
            opts = {},
        },
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
        {
            "jay-babu/mason-nvim-dap.nvim",
            dependencies = { "mason-org/mason.nvim" },
            opts = {
                -- a codelldb from PATH is configured below instead
                ensure_installed = system_codelldb and { "debugpy" } or { "debugpy", "codelldb" },
                automatic_installation = system_codelldb and { exclude = { "codelldb" } } or true,
                handlers = {},
            },
        },
    },
    keys = {
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Dap toggle breakpoint",
        },
        {
            "<leader>dB",
            function()
                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            desc = "Dap conditional breakpoint",
        },
        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            desc = "Dap continue / start",
        },
        {
            "<leader>di",
            function()
                require("dap").step_into()
            end,
            desc = "Dap step into",
        },
        {
            "<leader>do",
            function()
                require("dap").step_over()
            end,
            desc = "Dap step over",
        },
        {
            "<leader>dO",
            function()
                require("dap").step_out()
            end,
            desc = "Dap step out",
        },
        {
            "<leader>dt",
            function()
                require("dap").terminate()
            end,
            desc = "Dap terminate",
        },
        {
            "<leader>dr",
            function()
                require("dap").repl.toggle()
            end,
            desc = "Dap toggle repl",
        },
        {
            "<leader>dl",
            function()
                require("dap").run_last()
            end,
            desc = "Dap run last",
        },
        {
            "<leader>du",
            function()
                require("dapui").toggle()
            end,
            desc = "Dap toggle UI",
        },
        {
            "<leader>de",
            function()
                require("dapui").eval()
            end,
            mode = { "n", "v" },
            desc = "Dap eval expression",
        },
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        if system_codelldb then
            dap.adapters.codelldb = { type = "executable", command = "codelldb" }

            local codelldb = {
                {
                    name = "LLDB: Launch",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
            dap.configurations.c = codelldb
            dap.configurations.cpp = codelldb
            dap.configurations.rust = codelldb
        end

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
        vim.fn.sign_define(
            "DapBreakpointCondition",
            { text = "◆", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" }
        )
        vim.fn.sign_define("DapLogPoint", { text = "◐", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
        vim.fn.sign_define(
            "DapStopped",
            { text = "▶", texthl = "DiagnosticSignOk", linehl = "CursorLine", numhl = "" }
        )
        vim.fn.sign_define(
            "DapBreakpointRejected",
            { text = "✗", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
        )
    end,
}
