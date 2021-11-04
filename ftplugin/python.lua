-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup({{exe = "flake8", filetypes = { "python" } }})

-- python
lvim.lang.python.formatters = {
  {
    exe = "black",
  },
}

lvim.lang.python.linters = {
  {
    exe = "flake8",
  },
}
