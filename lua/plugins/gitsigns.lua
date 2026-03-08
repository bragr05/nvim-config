return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add          = { text = "│" },
                change       = { text = "│" },
                delete       = { text = "_" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
                untracked    = { text = "┆" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                vim.keymap.set("n", "<leader>gb", gs.blame_line, { buffer = bufnr, desc = "Git blame línea" })
                vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview cambio" })
                vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Revertir cambio" })
                vim.keymap.set("n", "]c", gs.next_hunk, { buffer = bufnr, desc = "Siguiente cambio" })
                vim.keymap.set("n", "[c", gs.prev_hunk, { buffer = bufnr, desc = "Cambio anterior" })
            end
        })
    end,
}
