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

    dark_blue = "#313C47",
    dark_red = "#4F1F1F",
    dark_yellow = "#4A3A1E",

    gray = "#858585",
    orange = "#ff8a00",
    comment = "#6a6a6a",
    line_number = "#4a4a4a",
    visual = "#1e1e1e",

    lavender = "#bfa5ff",
    pink = "#ff8fc7",
    peach = "#ffb380",
    soft_purple = "#9d7cd8",
    teal = "#5fd7af",
    gold = "#e0af68",
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
        CursorLineNr = { fg = c.pink, bold = true },
        LineNr = { fg = c.line_number },

        Visual = { bg = bg_visual, fg = c.lavender },

        Search = { fg = c.bg, bg = c.gold },
        IncSearch = { fg = c.bg, bg = c.pink },

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

        Constant = { fg = c.peach },
        String = { fg = c.green },
        Character = { fg = c.green },
        Number = { fg = c.orange },
        Boolean = { fg = c.lavender },
        Float = { fg = c.peach },

        Identifier = { fg = c.bright_blue },
        Function = { fg = c.gold },

        Statement = { fg = c.soft_purple },
        Conditional = { fg = c.magenta },
        Repeat = { fg = c.magenta },
        Label = { fg = c.lavender },
        Operator = { fg = c.lavender },
        Keyword = { fg = c.soft_purple },
        Exception = { fg = c.bright_magenta },

        PreProc = { fg = c.pink },
        Include = { fg = c.soft_purple },
        Define = { fg = c.pink },
        Macro = { fg = c.pink },
        PreCondit = { fg = c.lavender },

        Type = { fg = c.cyan },
        StorageClass = { fg = c.teal },
        Structure = { fg = c.bright_cyan },
        Typedef = { fg = c.cyan },

        Special = { fg = c.pink },
        SpecialChar = { fg = c.peach },
        Tag = { fg = c.bright_cyan },
        Delimiter = { fg = c.fg },
        SpecialComment = { fg = c.gray },
        Debug = { fg = c.red },

        Underlined = { underline = true },
        Ignore = { fg = c.gray },
        Error = { fg = c.red, bold = true },
        Todo = { fg = c.bright_yellow, bold = true },

        ["@variable"] = { fg = c.bright_blue },
        ["@variable.builtin"] = { fg = c.lavender },
        ["@variable.parameter"] = { fg = c.blue },
        ["@variable.member"] = { fg = c.bright_cyan },

        ["@constant"] = { fg = c.peach },
        ["@constant.builtin"] = { fg = c.orange },
        ["@constant.macro"] = { fg = c.pink },

        ["@string"] = { fg = c.green },
        ["@string.escape"] = { fg = c.teal },
        ["@string.special"] = { fg = c.peach },

        ["@character"] = { fg = c.green },
        ["@number"] = { fg = c.orange },
        ["@boolean"] = { fg = c.lavender },
        ["@float"] = { fg = c.peach },

        ["@function"] = { fg = c.gold },
        ["@function.builtin"] = { fg = c.bright_yellow },
        ["@function.macro"] = { fg = c.pink },
        ["@function.call"] = { fg = c.gold },
        ["@method"] = { fg = c.gold },
        ["@method.call"] = { fg = c.bright_yellow },

        ["@constructor"] = { fg = c.bright_cyan },
        ["@parameter"] = { fg = c.blue },

        ["@keyword"] = { fg = c.soft_purple },
        ["@keyword.function"] = { fg = c.magenta },
        ["@keyword.operator"] = { fg = c.lavender },
        ["@keyword.return"] = { fg = c.bright_magenta },

        ["@conditional"] = { fg = c.magenta },
        ["@repeat"] = { fg = c.magenta },
        ["@label"] = { fg = c.lavender },
        ["@operator"] = { fg = c.lavender },
        ["@exception"] = { fg = c.bright_magenta },

        ["@type"] = { fg = c.cyan },
        ["@type.builtin"] = { fg = c.teal },
        ["@type.qualifier"] = { fg = c.soft_purple },

        ["@property"] = { fg = c.bright_cyan },
        ["@field"] = { fg = c.bright_blue },

        ["@punctuation.delimiter"] = { fg = c.gray },
        ["@punctuation.bracket"] = { fg = c.lavender },
        ["@punctuation.special"] = { fg = c.pink },

        ["@comment"] = { fg = c.comment, italic = true },
        ["@tag"] = { fg = c.soft_purple },
        ["@tag.attribute"] = { fg = c.bright_cyan },
        ["@tag.delimiter"] = { fg = c.lavender },

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
        TelescopeBorder = { fg = c.lavender, bg = bg_float },
        TelescopePromptNormal = { fg = c.fg, bg = bg_float },
        TelescopePromptBorder = { fg = c.magenta, bg = bg_float },
        TelescopePromptTitle = { fg = c.pink, bold = true },
        TelescopePreviewTitle = { fg = c.teal, bold = true },
        TelescopeResultsTitle = { fg = c.lavender, bold = true },
        TelescopeSelection = { fg = c.bright_white, bg = c.visual },
        TelescopeSelectionCaret = { fg = c.pink },
        TelescopeMatching = { fg = c.bright_yellow, bold = true },

        AlphaHeader = { fg = c.lavender },
        AlphaButtons = { fg = c.bright_cyan },
        AlphaShortcut = { fg = c.pink, bold = true },
        AlphaFooter = { fg = c.soft_purple, italic = true },

        CmpItemAbbrDeprecated = { fg = c.gray, strikethrough = true },
        CmpItemAbbrMatch = { fg = c.pink, bold = true },
        CmpItemAbbrMatchFuzzy = { fg = c.peach, bold = true },
        CmpItemKindVariable = { fg = c.bright_blue },
        CmpItemKindInterface = { fg = c.bright_cyan },
        CmpItemKindText = { fg = c.fg },
        CmpItemKindFunction = { fg = c.gold },
        CmpItemKindMethod = { fg = c.bright_yellow },
        CmpItemKindKeyword = { fg = c.magenta },
        CmpItemKindProperty = { fg = c.bright_cyan },
        CmpItemKindUnit = { fg = c.teal },

        IblIndent = { fg = c.black },
        IblScope = { fg = c.gray },
    }

    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

return M
