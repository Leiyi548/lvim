local M = {}
M.config = function()
	lvim.autocommands.custom_groups = {
		-- toggleterm
		{ "TermOpen", "term://*", "lua require('user.keybindings').set_terminal_keymaps()" },
		{ "TermOpen", "term://*", "nnoremap <silent> <buffer> q :q<CR>" },
		-- quickfix
		{ "FileType", "quickfix", "nnoremap <silent> <buffer> q :q<cr>" },
		-- dashboard
		-- { "FileType", "alpha", "nnoremap <silent> <buffer> q :q<CR>" },
	}
end
if lvim.builtin.fancy_number.active then
	vim.cmd([[
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END
  ]])
end
return M
