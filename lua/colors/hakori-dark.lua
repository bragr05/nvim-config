local M = {}

M.colors = {
    bg = "#0a0a0a",
    fg = "#cccccc",
    cursor = "#ff8a00",

    black = "#1e1e1e",
    red = "#f44747",
    green = "#02D46B",
    yellow = "#ffc23d",
    blue = "#569cd6",
    magenta = "#af87ff",
    cyan = "#4ec9b0",
    white = "#d4d4d4",

    bright_black = "#858585",
    bright_red = "#ff8a00",
    bright_yellow = "#fcde65",
    bright_blue = "#9cdcfe",
    bright_magenta = "#b0b9f9",
    bright_cyan = "#70e1ca",
    bright_white = "#ffffff",

    gray = "#858585",
    orange = "#ff8a00",
    comment = "#858585",
    line_number = "#4a4a4a",
    visual = "#1e1e1e",
    border = "#858585",
    pmenu_bg = "#1e1e1e",
}

function M.setup()
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "hakori-dark"

    local config = require("core.config")
    local transparent = config.theme.transparent

    local c = M.colors

    local bg_normal = transparent and "NONE" or c.bg
    local bg_float = transparent and "NONE" or c.black
    local bg_visual = c.visual

    local highlights = {
        Normal = { fg = c.fg, bg = bg_normal },
        NormalFloat = { fg = c.fg, bg = bg_float },
        FloatBorder = { fg = c.border, bg = bg_float },
        SignColumn = { bg = bg_normal },

        Cursor = { fg = c.bg, bg = c.cursor },
        CursorLine = { bg = transparent and "NONE" or c.black },
        CursorLineNr = { fg = c.bright_magenta, bold = true },
        LineNr = { fg = c.line_number },

        Visual = { bg = bg_visual, fg = c.bright_magenta },

        Search = { fg = c.bg, bg = c.bright_yellow },
        IncSearch = { fg = c.bg, bg = c.bright_magenta },

        StatusLine = { fg = c.fg, bg = bg_normal },
        StatusLineNC = { fg = c.gray, bg = bg_normal },

        TabLine = { fg = c.gray, bg = bg_normal },
        TabLineFill = { bg = bg_normal },
        TabLineSel = { fg = c.fg, bg = c.blue },

        Pmenu = { fg = c.fg, bg = transparent and "NONE" or c.pmenu_bg },
        PmenuSel = { fg = c.bright_white, bg = c.visual },
        PmenuSbar = { bg = transparent and "NONE" or c.black },
        PmenuThumb = { bg = c.gray },

        DiffAdd = { fg = c.green },
        DiffChange = { fg = c.yellow },
        DiffDelete = { fg = c.red },
        DiffText = { fg = c.bright_yellow },

        Comment = { fg = c.comment, italic = true },

        Constant = { fg = c.orange },
        String = { fg = c.green },
        Character = { fg = c.green },
        Number = { fg = c.orange },
        Boolean = { fg = c.bright_magenta },
        Float = { fg = c.orange },

        Identifier = { fg = c.bright_blue },
        Function = { fg = c.bright_yellow },

        Statement = { fg = c.magenta },
        Conditional = { fg = c.magenta },
        Repeat = { fg = c.magenta },
        Label = { fg = c.bright_magenta },
        Operator = { fg = c.bright_magenta },
        Keyword = { fg = c.magenta },
        Exception = { fg = c.bright_magenta },

        PreProc = { fg = c.bright_magenta },
        Include = { fg = c.magenta },
        Define = { fg = c.bright_magenta },
        Macro = { fg = c.bright_magenta },
        PreCondit = { fg = c.bright_magenta },

        Type = { fg = c.cyan },
        StorageClass = { fg = c.bright_cyan },
        Structure = { fg = c.bright_cyan },
        Typedef = { fg = c.cyan },

        Special = { fg = c.bright_magenta },
        SpecialChar = { fg = c.orange },
        Tag = { fg = c.bright_cyan },
        Delimiter = { fg = c.fg },
        SpecialComment = { fg = c.gray },
        Debug = { fg = c.red },

        Underlined = { underline = true },
        Ignore = { fg = c.gray },
        Error = { fg = c.red, bold = true },
        Todo = { fg = c.bright_yellow, bold = true },

        ["@variable"] = { fg = c.bright_blue },
        ["@variable.builtin"] = { fg = c.bright_magenta },
        ["@variable.parameter"] = { fg = c.blue },
        ["@variable.member"] = { fg = c.bright_cyan },

        ["@constant"] = { fg = c.orange },
        ["@constant.builtin"] = { fg = c.orange },
        ["@constant.macro"] = { fg = c.bright_magenta },

        ["@string"] = { fg = c.green },
        ["@string.escape"] = { fg = c.bright_cyan },
        ["@string.special"] = { fg = c.orange },

        ["@character"] = { fg = c.green },
        ["@number"] = { fg = c.orange },
        ["@boolean"] = { fg = c.bright_magenta },
        ["@float"] = { fg = c.orange },

        ["@function"] = { fg = c.bright_yellow },
        ["@function.builtin"] = { fg = c.bright_yellow },
        ["@function.macro"] = { fg = c.bright_magenta },
        ["@function.call"] = { fg = c.bright_yellow },
        ["@method"] = { fg = c.bright_yellow },
        ["@method.call"] = { fg = c.bright_yellow },

        ["@constructor"] = { fg = c.bright_cyan },
        ["@parameter"] = { fg = c.blue },

        ["@keyword"] = { fg = c.magenta },
        ["@keyword.function"] = { fg = c.magenta },
        ["@keyword.operator"] = { fg = c.bright_magenta },
        ["@keyword.return"] = { fg = c.bright_magenta },

        ["@conditional"] = { fg = c.magenta },
        ["@repeat"] = { fg = c.magenta },
        ["@label"] = { fg = c.bright_magenta },
        ["@operator"] = { fg = c.bright_magenta },
        ["@exception"] = { fg = c.bright_magenta },

        ["@type"] = { fg = c.cyan },
        ["@type.builtin"] = { fg = c.bright_cyan },
        ["@type.qualifier"] = { fg = c.magenta },

        ["@property"] = { fg = c.bright_cyan },
        ["@field"] = { fg = c.bright_blue },

        ["@punctuation.delimiter"] = { fg = c.gray },
        ["@punctuation.bracket"] = { fg = c.bright_magenta },
        ["@punctuation.special"] = { fg = c.bright_magenta },

        ["@comment"] = { fg = c.comment, italic = true },
        ["@tag"] = { fg = c.magenta },
        ["@tag.attribute"] = { fg = c.bright_cyan },
        ["@tag.delimiter"] = { fg = c.bright_magenta },

        DiagnosticError = { fg = c.red },
        DiagnosticWarn = { fg = c.yellow },
        DiagnosticInfo = { fg = c.blue },
        DiagnosticHint = { fg = c.cyan },

        DiagnosticUnderlineError = { undercurl = true, sp = c.red },
        DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
        DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue },
        DiagnosticUnderlineHint = { undercurl = true, sp = c.cyan },

        GitSignsAdd = { fg = c.green },
        GitSignsChange = { fg = c.yellow },
        GitSignsDelete = { fg = c.red },

        NeoTreeNormal = { fg = c.fg, bg = bg_normal },
        NeoTreeNormalNC = { fg = c.fg, bg = bg_normal },
        NeoTreeDirectoryIcon = { fg = c.blue },
        NeoTreeDirectoryName = { fg = c.blue },
        NeoTreeFileName = { fg = c.fg },
        NeoTreeFileIcon = { fg = c.fg },
        NeoTreeFileNameOpened = { fg = c.orange },
        NeoTreeIndentMarker = { fg = c.gray },
        NeoTreeRootName = { fg = c.magenta, bold = true },
        NeoTreeSymbolicLinkTarget = { fg = c.cyan },
        NeoTreeGitAdded = { fg = c.green },
        NeoTreeGitConflict = { fg = c.red },
        NeoTreeGitDeleted = { fg = c.red },
        NeoTreeGitIgnored = { fg = c.gray },
        NeoTreeGitModified = { fg = c.yellow },
        NeoTreeGitUnstaged = { fg = c.yellow },
        NeoTreeGitUntracked = { fg = c.green },
        NeoTreeGitStaged = { fg = c.green },

        TelescopeNormal = { fg = c.fg, bg = bg_float },
        TelescopeBorder = { fg = c.bright_magenta, bg = bg_float },
        TelescopePromptNormal = { fg = c.fg, bg = bg_float },
        TelescopePromptBorder = { fg = c.magenta, bg = bg_float },
        TelescopePromptTitle = { fg = c.bright_magenta, bold = true },
        TelescopePreviewTitle = { fg = c.bright_cyan, bold = true },
        TelescopeResultsTitle = { fg = c.bright_magenta, bold = true },
        TelescopeSelection = { fg = c.bright_white, bg = c.visual },
        TelescopeSelectionCaret = { fg = c.bright_magenta },
        TelescopeMatching = { fg = c.bright_yellow, bold = true },

        AlphaHeader = { fg = c.bright_magenta },
        AlphaButtons = { fg = c.bright_cyan },
        AlphaShortcut = { fg = c.bright_magenta, bold = true },
        AlphaFooter = { fg = c.magenta, italic = true },

        IblIndent = { fg = c.black },
        IblScope = { fg = c.gray },
    }

    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

return M
