local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		exe = "eslint",
	},
})
-- linter
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({ { exe = "eslint", filetypes = { "typescript" } } })
