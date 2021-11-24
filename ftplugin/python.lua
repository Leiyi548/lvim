local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup{
  {
    exe = "black"
  }
}
-- linter
local linters = require "lvim.lsp.null-ls.linters"
linters.setup({{exe = "flake8", filetypes = { "python" } }})

-- debug
local dap_install = require("dap-install")
dap_install.config("python",{})
