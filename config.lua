-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
--lvim.format_on_save = true
lvim.lint_on_save = false
lvim.format_on_save = true
lvim.debug = false
lvim.log.level = "warn"
lvim.lsp.automatic_servers_installation = true

lvim.builtin.orgmode = { active = true } -- change to true if you want orgmode.nvim
lvim.builtin.ZFvim = { active = false}  -- change to ture if you want ZFvim
lvim.builtin.autosave = { active = false } -- change to true if you want to autosave file
lvim.builtin.fancy_statusline = { active = false } -- enable/disable fancy statusline
lvim.builtin.global_status_line = { active = true } -- use the global status line
lvim.builtin.fancy_bufferline = { active = true } -- enable/disable fancy bufferline
lvim.builtin.bufferline.active = not lvim.builtin.fancy_bufferline.active
lvim.builtin.fancy_dashboard = {active = true} --change to true if you want to fancy_dashboard
lvim.builtin.easy_align = {active = false} -- change to true if you want easy_align
lvim.builtin.tabnine = {active = true}  --change to true if you want tabnine
lvim.builtin.dashboard.active = not lvim.builtin.fancy_dashboard.active
lvim.builtin.terminal.active = true
lvim.builtin.notify.active = true
lvim.builtin.fancy_number = {active = false} --change to true if you want fancy number
-- Customization
-- =========================================
require("user.luasnipConfig")
vim.cmd[[source ~/.config/lvim/textobjects.vim]]
--textobjects
require("user.builtin").config()
--require("user.cmp-comparator")

if lvim.builtin.fancy_statusline.active then
require("user.lualine").config()
end
-- Additional Plugins
-- =========================================
require("user.plugins").config()
-- Additional keybindings
-- =========================================
require("user.keybindings").config()

-- Autocommands
-- =========================================
require("user.autocommands").config()
-- Additional Formatters
-- =========================================
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup{
  {
    exe = "prettier",
    filetypes = { "html", "markdown"}
  }
}
formatters.setup{
  {
    exe = "black",
    filetypes = {"python"}
  }
}

--theme
--lvim.colorscheme = "gruvbox"
--lvim.colorscheme = "onedarker"
-- vim.cmd [[
-- colorscheme gruvbox
-- ]]
