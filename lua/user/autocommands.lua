local M = {}
M.config = function()
	lvim.autocommands.custom_groups = {
		--terminal
		{ "FileType", "terminal", "nnoremap <silent> <buffer> q :q<CR>" },
		-- quickfix
		{ "FileType", "quickfix", "nnoremap <silent> <buffer> q :q<CR>" },
		-- dashboard
		{ "FileType", "alpha", "nnoremap <silent> <buffer> q :q<CR>" },
		{
			"FileType",
			"alpha",
			"setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ",
		},
		-- { "FileType", "alpha", "set laststatus=0" },
		-- {
		-- 	"FileType",
		-- 	"alpha",
		-- 	"set showtabline=0 | autocmd BufLeave <buffer> set showtabline=" .. vim.opt.showtabline._value,
		-- },
		-- python
		-- { "FileType", "python", "inoremap <silent> <buffer> ,, <++>"},
		-- { "FileType", "python", "inoremap <silent> <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l"},
		-- c, cpp
		-- {
		--   "Filetype",
		--   "c,cpp",
		--   "nnoremap <leader>m <cmd>lua require('lvim.core.terminal')._exec_toggle('make ;read')<CR>",
		-- },
		-- {
		--   "Filetype",
		--   "c,cpp",
		--   "nnoremap <leader>rg <cmd>lua require('lvim.core.terminal')._exec_toggle('make run;read')<CR>",
		-- },
		-- { "Filetype", "c,cpp", "nnoremap <leader>H <Cmd>ClangdSwitchSourceHeader<CR>" },

		-- lua
		-- { "FileType", "lua", "inoremap <silent> <buffer> ,, <++>"},
		-- { "FileType", "lua", "inoremap <silent> <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l"},
		-- go
		-- { "FileType", "go", "inoremap <silent> <buffer> ,, <++>"},
		-- { "FileType", "go", "inoremap <silent> <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l"},
		-- {
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
