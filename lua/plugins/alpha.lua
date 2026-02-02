return {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local theme = require('core.theme')

        if theme and theme.colors then
            vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = theme.colors.red })
            vim.api.nvim_set_hl(0, 'AlphaButtons', { fg = theme.colors.yellow })
            vim.api.nvim_set_hl(0, 'AlphaShortcut', { fg = theme.colors.yellow, italic = true, bold = true })
            vim.api.nvim_set_hl(0, 'AlphaFooter', { fg = theme.colors.green, italic = true, bold = true })
        end

        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        dashboard.section.header.opts.hl = "AlphaHeader"

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Buscar Archivo", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Recientes", ":Telescope oldfiles<CR>"),
            dashboard.button("g", "  Buscar Texto", ":Telescope live_grep<CR>"),
            dashboard.button("e", "  Explorador", ":Neotree toggle<CR>"),
            dashboard.button("c", "  Configuración", ":Telescope find_files { cwd = '~/.config/nvim/' }<CR>"),
            dashboard.button("q", "  Salir", ":qa<CR>"),
        }


        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end


        dashboard.section.footer.val = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return "⚡ Neovim cargado en " .. ms .. "ms"
        end
        dashboard.section.footer.opts.hl = "AlphaFooter"

        dashboard.config.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            dashboard.section.footer,
        }

        require("alpha").setup(dashboard.config)
    end,
}
