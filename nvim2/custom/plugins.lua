local plugins = {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "gopls",
                "lua-language-server",
                "html-lsp",
                "prettier",
                "stylua"
            },
        },
    },
    {
        "mfussenegger/nvim-dap",
        init = function()
            require("core.utils").load_mappings "dap"
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function()
            require "custom.configs.lint"
        end,
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings "dap_go"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    -- {
    --   "jose-elias-alvarez/null-ls.nvim",
    --   ft = "go",
    --   opst = function ()
    --     return require "custom.configs.null-ls"
    --   end,
    -- },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "custom.configs.formatting"
        end,
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
            require("core.utils").load_mappings "gopher"
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },
}
return plugins
