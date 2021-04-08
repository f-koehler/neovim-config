local lspconfig = require("lspconfig")

lspconfig.fortls.setup {
    cmd = {"/usr/bin/fortls"},
    filetypes = {"fortran"},
    root_dir = lspconfig.util.root_pattern(".git", ".fortls", "CMakeLists.txt",
                                           "Makefile"),
    settings = {
        ["fortran-ls"] = {
            enableCodeActions = true,
            hoverSignature = true,
            lowercaseIntrinsics = true,
            notifyInit = true,
            variableHover = true
        }
    }
}
