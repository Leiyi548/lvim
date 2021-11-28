local M = {}
M.config = function()
	vim.g.vim_markdown_frontmatter = 1
	vim.g.vim_markdown_strikethrough = 1
	vim.g.vim_markdown_folding_level = 6
	vim.g.vim_markdown_override_foldtext = 1
	vim.g.vim_markdown_folding_style_pythonic = 1
	vim.g.vim_markdown_conceal = 2 -- 1
	vim.g.vim_markdown_conceal_code_blocks = 1
	vim.g.vim_markdown_new_list_item_indent = 0
	vim.g.vim_markdown_toc_autofit = 0
	vim.g.vim_markdown_edit_url_in = "tab"
	vim.g.vim_markdown_strikethrough = 1
	vim.g.vim_markdown_fenced_languages = { -- highlight language
		"c++=javascript",
		"js=javascript",
		"json=javascript",
		"jsx=javascript",
		"tsx=javascript",
	}
end
return M
