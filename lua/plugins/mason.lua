return {
    "mason-org/mason.nvim",
    opts = {
        -- on NixOS, prefer tools from nixpkgs over (possibly stale) Mason installs
        PATH = require("config.platform").is_nixos and "append" or "prepend",
    },
}
