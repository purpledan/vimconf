local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup({
    capabilities = capabilities,
    cmd = {"clangd",
        "--clang-tidy",
        "--background-index",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        "--enable-config"}, 
})

require('lspconfig').julials.setup({})
