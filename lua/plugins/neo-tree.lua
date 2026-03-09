return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local theme = require("core.theme")
        local colors = theme.colors

        vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = colors.fg, bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { fg = colors.fg, bg = "NONE" })

        vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = colors.lavender })
        vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = colors.bright_blue })
        vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = colors.pink, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = colors.fg })
        vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = colors.bright_cyan })

        vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = colors.teal })
        vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = colors.peach })
        vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = colors.lavender })
        vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = colors.pink })
        vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = colors.comment })

        vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = colors.line_number })
        vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = colors.soft_purple })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "neo-tree",
            callback = function()
                vim.opt_local.winhl = "Normal:NeoTreeNormal"
                vim.cmd("setlocal guifont=JetBrainsMono\\ Nerd\\ Font:h11")
            end,
        })

        require("neo-tree").setup({
            close_if_last_window = true,
            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "▸",
                    expander_expanded = "▾",
                    indent_size = 2,
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                },
                git_status = {
                    symbols = {
                        added     = "+",
                        modified  = "~",
                        deleted   = "-",
                        renamed   = "→",
                        untracked = "?",
                        ignored   = "",
                        unstaged  = "✗",
                        staged    = "✓",
                        conflict  = "!",
                    }
                },
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_by_name = {
                        ".git",
                        ".DS_Store",
                        "thumbs.db",
                        "node_modules",
                        "__pycache__",
                        ".cache",
                    },
                    never_show = {
                        ".git",
                        ".DS_Store",
                    },
                },
                follow_current_file = {
                    enabled = true,
                },
            },
        })
    end,
}
