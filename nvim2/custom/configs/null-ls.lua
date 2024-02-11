local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local sources = {
    formatting.gofumpt,
    formatting.goimports_reviser,
    formatting.golines,
    formatting.stylua,
}

null_ls.setup({
    sources = sources,
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
-- local opts = {
--   sources = {
--     null_ls.builtins.formatting.gofumpt,
--     null_ls.builtins.formatting.goimports_reviser,
--     null_ls.builtins.formatting.golines,
--   },
--   on_attach = function (client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({
--         group = augroup,
--         buffer = bufnr,
--       })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function ()
--           -- vim.lsp.buf.format({ bufnr = bufnr })
--             vim.lsp.buf.formatting_sync()
--         end,
--       })
--     end
--   end,
-- }
-- return opts

-- local formatting = null_ls.builtins.formatting
-- local sources = {
--     formatting.gofumpt,
--     formatting.goimports_reviser,
--     formatting.golines,
--     formatting.stylua,
-- }

-- return null_ls.setup({
--     sources = sources,
--
--   on_attach = function (client)
--     if client.resolved_capabilities.document_formatting then
--         vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--     end
--   end,
-- })
