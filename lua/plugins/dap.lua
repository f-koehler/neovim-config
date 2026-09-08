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
                ensure_installed = { "debugpy", "codelldb" },
                automatic_installation = true,
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
