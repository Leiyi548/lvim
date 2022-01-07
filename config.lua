-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
lvim.lint_on_save = false
lvim.format_on_save = false
lvim.debug = false
lvim.log.level = "warn"
lvim.lsp.automatic_servers_installation = true

lvim.builtin.orgmode = { active = false } -- change to true if you want orgmode.nvim
lvim.builtin.ZFvim = { active = false } -- change to ture if you want ZFvim
lvim.builtin.autosave = { active = false } -- change to true if you want to autosave file
lvim.builtin.fancy_statusline = { active = false } -- enable/disable fancy statusline
lvim.builtin.global_status_line = { active = false } -- use the global status line
lvim.builtin.vscode_line = { active = false } -- enable if you want to use lualine style like vscode
lvim.builtin.fancy_bufferline = { active = true } -- enable/disable fancy bufferline
lvim.builtin.bufferline.active = not lvim.builtin.fancy_bufferline.active
lvim.builtin.fancy_rename = { active = true } -- enable open like vscode rename style
lvim.builtin.fancy_dashboard = { active = true } --change to true if you want to fancy_dashboard
lvim.builtin.fancy_cmp = { active = true } -- enable open fancy_cmp style
lvim.builtin.easy_align = { active = false } -- change to true if you want easy_align
lvim.builtin.tabnine = { active = true } -- change to true if you want tabnine
lvim.builtin.dashboard.active = not lvim.builtin.fancy_dashboard.active
lvim.builtin.dap.active = false
lvim.builtin.notify.active = true
lvim.builtin.tmuxNavigator = { active = true } -- enable use tmuxNavigator
lvim.builtin.fancy_number = { active = false } -- change to true if you want fancy number
lvim.builtin.orginal_lsp = { active = false } -- orginal lsp diagnostic
lvim.builtin.fancy_telescope = { active = true } -- use orginal telescope
lvim.builtin.fancy_mark = { active = false } -- enable use marks.nvim plugins
lvim.builtin.neogen = {active = true } -- enable use neogen to comment function

-- Customization
-- =========================================
require("user.luasnipConfig")
-- Textobjects
vim.cmd([[source ~/.config/lvim/textobjects.vim]])
-- Lvim builtin setting
require("user.builtin").config()

if lvim.builtin.fancy_statusline.active and not lvim.builtin.vscode_line.active then
	require("user.lualine").config()
end

if lvim.builtin.vscode_line.active and not lvim.builtin.fancy_statusline.active then
	require("user.vscodeLualine").config()
end
-- Additional Plugins
-- =========================================
require("user.plugins").config()
-- Options
-- =========================================
require("user.options").config()
-- Additional keybindings
-- =========================================
require("user.keybindings").config()
-- Autocommands
-- =========================================
require("user.autocommands").config()
-- Colorscheme
-- =========================================
require("user.lvimColorScheme")
