return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('Comment').setup({
            -- Atajos:
            -- gcc - Comentar/descomentar línea
            -- gbc - Comentar/descomentar bloque
            -- gc  - Comentar en modo visual
        })
    end,
}
