local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
    }
    vim.lsp.buf.execute_command(params)
end

lspconfig.gopls.setup {
    on_attach = on_attach,
    -- Your original on_attach function
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
            gofumpt = true, -- if you're using gofumpt as your formatter
        },
    },
}

lspconfig.solidity.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
    filetypes = { "solidity", "sol" },
    root_dir = util.root_pattern ".git",
    single_file_support = true,
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        preference = {
            disableSuggestions = true,
        }
    },
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
        }
    }
}
