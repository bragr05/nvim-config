return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.setup({
            plugins = {
                spelling = {
                    enabled = true,
                },
            },
        })

        -- Registrar grupos de teclas
        wk.add({
            { "<leader>b", group = "Buffers" },
            { "<leader>g", group = "Git" },
            { "<leader>c", group = "Code" },
            { "<leader>r", group = "Rename" },
        })
    end,
}
