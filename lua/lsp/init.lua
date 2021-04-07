require("lsp.bash")
require("lsp.cmake")
require("lsp.cpp")
require("lsp.css")
require("lsp.docker")
require("lsp.fortran")
require("lsp.go")
require("lsp.graphviz")
require("lsp.html")
require("lsp.json")
require("lsp.julia")
require("lsp.latex")
require("lsp.lua")
require("lsp.python")
require("lsp.r")
require("lsp.rust")
require("lsp.typescript")
require("lsp.vim")
require("lsp.yaml")

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}
