local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>th", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, opts)
end)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup({
    capabilities = capabilities,
    cmd = {"clangd18",
        "--clang-tidy",
        "--background-index",
        "--all-scopes-completion=false",
        "--completion-style=detailed",
        "--header-insertion=never",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        "--enable-config"},
})

require('lspconfig').julials.setup({
    capabilities = capabilities })

require('lspconfig').zls.setup({})

require('lspconfig').texlab.setup({
    on_attach = function(client)
        client.server_capabilities.completionProvider = false
    end
})
