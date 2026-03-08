return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        local theme = require("core.theme")
        local colors = theme.colors

        local custom_theme = {
            normal = {
                a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
                b = { fg = colors.fg, bg = colors.dark_blue },
                c = { fg = colors.gray, bg = "NONE" },
            },
            insert = {
                a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
                b = { fg = colors.fg, bg = colors.dark_yellow },
                c = { fg = colors.gray, bg = "NONE" },
            },
            visual = {
                a = { fg = colors.bg, bg = colors.bright_magenta, gui = "bold" },
                b = { fg = colors.fg, bg = colors.dark_blue },
                c = { fg = colors.gray, bg = "NONE" },
            },
            command = {
                a = { fg = colors.bg, bg = colors.bright_cyan, gui = "bold" },
                b = { fg = colors.fg, bg = colors.dark_blue },
                c = { fg = colors.gray, bg = "NONE" },
            },
            replace = {
                a = { fg = colors.bg, bg = colors.red, gui = "bold" },
                b = { fg = colors.fg, bg = colors.dark_red },
                c = { fg = colors.gray, bg = "NONE" },
            },
            inactive = {
                a = { fg = colors.gray, bg = "NONE" },
                b = { fg = colors.gray, bg = "NONE" },
                c = { fg = colors.comment, bg = "NONE" },
            },
        }

        local separators_left = vim.fn.nr2char(0xe0b4)
        local separators_right = vim.fn.nr2char(0xe0b6)

        require("lualine").setup({
            options = {
                theme = custom_theme,
                globalstatus = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = separators_left, right = separators_right },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    { "branch", icon = "" },
                    {
                        "diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                    },
                },
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        symbols = { modified = " ●", readonly = " ", unnamed = "[Sin nombre]" },
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_lsp" },
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                    },
                },
                lualine_y = { "filetype" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_c = { "filename" },
                lualine_x = { "location" },
            },
        })
    end,
}
