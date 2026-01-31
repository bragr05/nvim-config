local M = {}

M.colorscheme = "night-owl"

M.colors = {
    bg        = '#011627',
    fg        = '#d6deeb',
    selection = '#1d3b53',
    blue      = '#82aaff',
    green     = '#22da6e',
    magenta   = '#c792ea',
    red       = '#ef5350',
    orange    = '#f78c6c',
    cyan      = '#7fdbca',
    grey      = '#637777',
    black     = '#011627',
    none      = 'NONE',
}

M.lualine_theme = {
    normal = {
        a = { fg = M.colors.bg, bg = M.colors.blue, gui = 'bold' },
        b = { fg = M.colors.fg, bg = M.colors.selection },
        c = { fg = M.colors.fg, bg = M.colors.none },
    },
    command = {
        a = { fg = M.colors.bg, bg = M.colors.green, gui = 'bold' },
        b = { fg = M.colors.fg, bg = M.colors.selection },
        c = { fg = M.colors.fg, bg = M.colors.none },
    },
    visual = {
        a = { fg = M.colors.bg, bg = M.colors.magenta, gui = 'bold' },
        b = { fg = M.colors.fg, bg = M.colors.selection },
        c = { fg = M.colors.fg, bg = M.colors.none },
    },
    replace = {
        a = { fg = M.colors.bg, bg = M.colors.red, gui = 'bold' },
        b = { fg = M.colors.fg, bg = M.colors.selection },
        c = { fg = M.colors.fg, bg = M.colors.none },
    },
    insert = {
        a = { fg = M.colors.bg, bg = M.colors.orange, gui = 'bold' },
        b = { fg = M.colors.fg, bg = M.colors.selection },
        c = { fg = M.colors.fg, bg = M.colors.none },
    },
    inactive = {
        a = { fg = M.colors.grey, bg = M.colors.none },
        b = { fg = M.colors.grey, bg = M.colors.none },
        c = { fg = M.colors.grey, bg = M.colors.none },
    },
}

return M
