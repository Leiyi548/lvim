local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup{
  {
    exe = "stylua"
  }
}
-- linter
local linters = require "lvim.lsp.null-ls.linters"
linters.setup({{exe = "luacheck", filetypes = { "lua" } }})

