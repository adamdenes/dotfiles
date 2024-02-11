local conform = require "conform"

conform.setup {
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        go = { "gofumpt", "golines", "goimports-reviser" },
        solidity = { "prettier" },
        python = { "autopep8" },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    },

    vim.api.nvim_set_keymap(
        "n",
        "<leader>fm",
        ':lua require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })<CR>',
        { noremap = true, silent = true }
    ),
    vim.api.nvim_set_keymap(
        "v",
        "<leader>fm",
        ':lua require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })<CR>',
        { noremap = true, silent = true }
    ),
}
