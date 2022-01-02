local M = {}
M.config = function()
	lvim.autocommands.custom_groups = {
		-- toggleterm
		{ "TermOpen", "term://*", "lua require('user.keybindings').set_terminal_keymaps()" },
		{ "TermOpen", "term://*", "nnoremap <silent> <buffer> q :q<CR>" },
		-- quickfix
		{ "FileType", "quickfix", "nnoremap <silent> <buffer> q :q<CR>" },
		-- dashboard
		-- { "FileType", "alpha", "nnoremap <silent> <buffer> q :q<CR>" },
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
		-- g++  -std=c++17 -g -Wall "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/a.out" && "$(VIM_FILEDIR)/a.out"
		--  $(VIM_FILEPATH)    # 当前 buffer 的文件名全路径
		--  $(VIM_FILEDIR)     # 当前 buffer 的文件所在路径
		-- {
		-- 	"Filetype",
		-- 	"c,cpp",
		-- 	"nnoremap <leader>rr <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='g++ -std=c++17 -g -Wall "
		-- 		.. vim.fn.expand("%")
		-- 		.. "',count=2,direction='float'})<CR>",
		-- },
		{
			"Filetype",
			"python",
			"nnoremap <leader>rr <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='python " .. vim.fn.expand(
				"%"
			) .. "',count=2,direction='float'})<CR>",
		},
		{
			"Filetype",
			"lua",
			"nnoremap <leader>rr <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='lua "
				.. vim.fn.expand("%")
				.. "',count=2,direction='float'})<CR>",
		},
		{
			"Filetype",
			"typescript",
			"nnoremap <leader>rr <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='ts-node " .. vim.fn.expand(
				"%"
			) .. "',count=2,direction='float'})<CR>",
		},
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
