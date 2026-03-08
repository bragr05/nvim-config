return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "sqlls",
                },
                automatic_installation = true,
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.lsp.config('*', {
                capabilities = capabilities,
            })

            vim.lsp.config.lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function(args)
                    pcall(vim.lsp.enable, args.buf)
                end,
            })

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Ir a definición" })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Mostrar documentación" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renombrar" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnóstico siguiente" })
        end,
    },
}
