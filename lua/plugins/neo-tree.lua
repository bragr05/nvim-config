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
        vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = colors.red })
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
                    expander_collapsed = vim.fn.nr2char(0xf061),
                    expander_expanded = vim.fn.nr2char(0xf0a3),
                },
                icon = {
                    folder_closed = vim.fn.nr2char(0xf115),
                    folder_open = vim.fn.nr2char(0xf114),
                    folder_empty = vim.fn.nr2char(0xf0256),
                    folder_empty_open = vim.fn.nr2char(0xf0dcf),
                },
                git_status = {
                    symbols = {
                        added     = "",
                        modified  = "",
                        deleted   = "✖",
                        renamed   = "➜",
                        untracked = "★",
                        ignored   = "◌",
                        unstaged  = "✗",
                        staged    = "✓",
                        conflict  = "",
                    }
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = {
                    enabled = true,
                },
            },
        })
    end,
}
