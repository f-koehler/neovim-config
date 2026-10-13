local M = {}

local function detect_nixos()
    if vim.uv.os_uname().sysname ~= "Linux" then
        return false
    end
    local file = io.open("/etc/lsb-release", "r")
    if not file then
        return false
    end
    local content = file:read("*a")
    file:close()
    return content:match('DISTRIB_ID="?nixos"?') ~= nil
end

-- on NixOS, tools come from nixpkgs (see nixos-tools.nix) instead of Mason
M.is_nixos = detect_nixos()

return M
