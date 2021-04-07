local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system \"", system_name, "\" for sumneko")
end

local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"
require 'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
      },
      telemetry = {
        enable = false,
      },
		},
	},
}


-- TODO: replace this with Lua api once https://github.com/neovim/neovim/pull/12378 is fixed
vim.api.nvim_exec([[
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
]], false)
