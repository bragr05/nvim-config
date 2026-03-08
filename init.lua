local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("core.options")
require("core.keymaps")

require("lazy").setup("plugins")

require("core.theme")

local config = require("core.config")
if config.theme.transparent then
    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
            local highlights = {
                "Normal",
                "NormalFloat",
                "NormalNC",
                "SignColumn",
                "FloatBorder",
                "CursorLine",
                "StatusLine",
                "StatusLineNC",
                "TabLine",
                "TabLineFill",
            }

            if config.ui.transparent_plugins.telescope then
                vim.list_extend(highlights, {
                    "TelescopeNormal",
                    "TelescopeBorder",
                    "TelescopePromptNormal",
                    "TelescopePromptBorder",
                })
            end

            if config.ui.transparent_plugins.neotree then
                vim.list_extend(highlights, {
                    "NeoTreeNormal",
                    "NeoTreeNormalNC",
                })
            end

            if config.ui.transparent_plugins.pmenu then
                vim.list_extend(highlights, {
                    "Pmenu",
                    "PmenuSbar",
                })
            end

            for _, group in ipairs(highlights) do
                vim.api.nvim_set_hl(0, group, { bg = "NONE" })
            end
        end,
    })

    vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")
    vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
    vim.cmd("highlight CursorLine guibg=NONE ctermbg=NONE")
    vim.cmd("highlight StatusLine guibg=NONE ctermbg=NONE")
    vim.cmd("highlight StatusLineNC guibg=NONE ctermbg=NONE")
end
