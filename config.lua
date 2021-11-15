-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
--lvim.format_on_save = true
lvim.lint_on_save = false
lvim.format_on_save = true
lvim.debug = false
lvim.log.level = "warn"
lvim.lsp.automatic_servers_installation = true

lvim.builtin.orgmode = { active = true } -- change to true if you want orgmode.nvim
lvim.builtin.ZFvim = { active = true}  -- change to ture if you want ZFvim
lvim.builtin.autosave = { active = false } -- change to true if you want to autosave file
lvim.builtin.fancy_dashboard = {active = true} --change to true if you want to fancy_dashboard
lvim.builtin.easy_align = {active = false} -- change to true if you want easy_align
lvim.builtin.tabnine = {active = true}  --change to true if you want tabnine
lvim.builtin.dashboard.active = not lvim.builtin.fancy_dashboard.active
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.notify.active = true
-- Customization
-- =========================================
require("user.lua_snip")
vim.cmd[[source ~/.config/lvim/textobjects.vim]]
--textobjects
require("user.builtin").config()
require("user.cmp-comparator")

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
-- exe value can be "clang_format" or "uncrustify"
--C or C++
lvim.lang.c.formatters = { { exe = "clang-format" } }
lvim.lang.cpp.formatters = lvim.lang.c.formatters
--html
lvim.lang.html.formatters = {{exe = "prettier"}}
--go
lvim.lang.go.formatters = {{exe = "gofmt"}}
--Python
--lvim.lang.html.linters = {{exe = "tidy"}}
lvim.lang.json.formatters = {{exe = "prettier"}}
lvim.lang.python.linters = { { exe = "flake8" } }
lvim.lang.python.formatters = {{exe = "black"}}
--markdown
--lvim.lang.markdown.formatters = {{exe="prettier"}}
--if you want to use markdown linters
--lvim.lang.markdown.linters ={ {exe = "markdownlint" } }

--lua
--lvim.lang.lua.formatters = {{exe="lua-format"}}
--lvim.lang.lua.linters = {{exe="luacheck"}} --useful
--lvim.lang.go.linters = { { exe = "golangci-lint" } }
--lvim.lang.go.linters = {{exe = "golangci-lint"}}
-- exe value can be "black", "yapf", or "isort"
-- lvim.lang.python.formatters = { { exe = "black" } }
--lvim.colorscheme = "gruvbox"


--theme
--lvim.colorscheme = "gruvbox"
-- lvim.colorscheme = "onedarker"
-- vim.cmd [[
-- colorscheme gruvbox
-- ]]
