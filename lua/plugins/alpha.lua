return {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        -- 1. HEADER: El logo ASCII
        dashboard.section.header.val = {
            [[                                   ]],
            [[                                   ]],
            [[   ███╗   ██╗███████╗ ██████╗    ]],
            [[   ████╗  ██║██╔════╝██╔═══██╗   ]],
            [[   ██╔██╗ ██║█████╗  ██║   ██║   ]],
            [[   ██║╚██╗██║██╔══╝  ██║   ██║   ]],
            [[   ██║ ╚████║███████╗╚██████╔╝   ]],
            [[   ╚═╝  ╚═══╝╚══════╝ ╚═════╝    ]],
            [[                                   ]],
            [[   v0.10.0      MACBOOK AIR M4     ]],
        }
        -- Color del logo (Azul de tu paleta)
        dashboard.section.header.opts.hl = "Number"

        -- 2. BOTONES DEL MENÚ
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Buscar Archivo", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Recientes", ":Telescope oldfiles<CR>"),
            dashboard.button("g", "  Buscar Texto", ":Telescope live_grep<CR>"),
            dashboard.button("e", "  Explorador", ":Neotree toggle<CR>"),
            dashboard.button("c", "  Configuración", ":Telescope find_files { cwd = '~/.config/nvim/' }<CR>"),
            dashboard.button("q", "  Salir", ":qa<CR>"),
        }

        -- Estilos de los botones para que se vean bien en Night Owl
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "Function"      -- Icono y tecla
            button.opts.hl_shortcut = "Type" -- El atajo (f, r, etc)
        end

        -- 3. FOOTER: Estadísticas de carga (Estilo LazyVim)
        dashboard.section.footer.val = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return "⚡ Neovim cargado en " .. ms .. "ms"
        end
        dashboard.section.footer.opts.hl = "Comment"

        -- 4. Márgenes y configuración final
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
