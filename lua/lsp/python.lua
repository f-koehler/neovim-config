require 'lspconfig'.sumneko_lua.setup {
  cmd = {vim.fn.stdpath("data") .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
}
