local sumneko_root_path = vim.fn.stdpath("data") .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require("lspconfig").sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
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
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          maxPreload = 10000
        }
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
