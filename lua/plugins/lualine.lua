return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        local theme = require("core.theme")

        vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })

        local function filesize()
            local file = vim.fn.expand('%:p')
            if file == nil or #file == 0 then return '' end
            local size = vim.fn.getfsize(file)
            if size <= 0 then return '' end
            local sufixes = { 'b', 'k', 'm', 'g' }
            local i = 1
            while size > 1024 do
                size = size / 1024
                i = i + 1
            end
            return string.format('%.1f%s', size, sufixes[i])
        end

        local function os_icon()
            return ''
        end

        require("lualine").setup({
            options = {
                theme = theme.lualine_theme,
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '', right = '' }, right_padding = 2 }
                },
                lualine_b = {
                    'branch',
                    { 'diff', colored = true, symbols = { added = '+', modified = '~', removed = '-' } }
                },
                lualine_c = {
                    '%=',
                    {
                        'filename',
                        path = 1,
                        symbols = { modified = ' ●', readonly = ' ', unnamed = '[No Name]' }
                    }
                },
                lualine_x = {
                    {
                        filesize,
                        icon = '',
                        color = { fg = theme.colors.grey }
                    }
                },
                lualine_y = {
                    { 'filetype', icon_only = true },
                    { 'encoding', fmt = string.upper },
                    { os_icon,    color = { fg = theme.colors.blue } }
                },
                lualine_z = {
                    { 'location', separator = { left = '', right = '' }, left_padding = 2 },
                },
            },
        })
    end,
}
