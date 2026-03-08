return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            search = {
                enabled = false,
            },
            char = {
                enabled = false,
            },
        },
    },
    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
        {
            "S",
            mode = { "n", "x", "o" },
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
        },
    },
    config = function(_, opts)
        local theme = require("core.theme")
        local colors = theme.colors

        vim.api.nvim_set_hl(0, "FlashLabel", { fg = colors.bg, bg = colors.pink, bold = true })
        vim.api.nvim_set_hl(0, "FlashCurrent", { fg = colors.bg, bg = colors.bright_cyan, bold = true })
        vim.api.nvim_set_hl(0, "FlashMatch", { fg = colors.lavender })
        vim.api.nvim_set_hl(0, "FlashPrompt", { fg = colors.pink })

        require("flash").setup(opts)
    end,
}
