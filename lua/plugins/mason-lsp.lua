return {
    -- Mason: Instalador de LSP servers
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

    -- Mason-LSPConfig: Puente entre Mason y LSPConfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                -- Instalación automática de estos servidores
                ensure_installed = {
                    "lua_ls",      -- Lua
                    "ts_ls",       -- TypeScript/JavaScript
                    "html",        -- HTML
                    "cssls",       -- CSS
                    "jsonls",      -- JSON
                },
                automatic_installation = true,
            })
        end,
    },

    -- Configuración de LSP usando vim.lsp.config (Neovim 0.11+)
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- Configuración de servidores LSP usando vim.lsp.config
            vim.lsp.config('*', {
                capabilities = capabilities,
            })

            -- Configuración específica para Lua
            vim.lsp.config.lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }

            -- Auto-iniciar LSP cuando se abre un archivo
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function(args)
                    -- Habilitar LSP si hay uno disponible para este filetype
                    pcall(vim.lsp.enable, args.buf)
                end,
            })

            -- Keymaps de LSP
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Ir a definición" })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Mostrar documentación" })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code actions" })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Renombrar" })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnóstico siguiente" })
        end,
    },
}
