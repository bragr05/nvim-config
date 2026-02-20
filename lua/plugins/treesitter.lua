return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
        if not ok then
            return
        end

        treesitter.setup({
            ensure_installed = {
                'lua',
                'vim',
                'vimdoc',
                'markdown',
                'markdown_inline',
                'javascript',
                'typescript',
                'html',
                'css',
                'json',
                'python',
                'bash',
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            auto_install = true,
        })
    end
}
