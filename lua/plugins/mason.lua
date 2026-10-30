return {
    "mason-org/mason.nvim",
    opts = {
        -- tools already on PATH (e.g. from Nix) win over Mason installs
        PATH = "append",
    },
}
