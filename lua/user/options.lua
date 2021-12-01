local M = {}

M.config = function()
	vim.opt.backup = false -- creates a backup file
	vim.opt.clipboard = "" -- allows neovim to access the system clipboard
	vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
	vim.opt.colorcolumn = "99999" -- fixes indentline for now
	vim.opt.completeopt = { "menuone", "noselect" }
	vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
	vim.opt.fileencoding = "utf-8" -- the encoding written to a file
	vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
	vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
	vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
	vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
	vim.opt.hlsearch = true -- highlight all matches on previous search pattern
	vim.opt.ignorecase = true -- ignore case in search patterns
	vim.opt.mouse = "a" -- allow the mouse to be used in neovim
	vim.opt.pumheight = 10 -- pop up menu height
	vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
	vim.opt.showtabline = 2 -- always show tabs
	vim.opt.smartcase = true -- smart case
	vim.opt.smartindent = true -- make indenting smarter again
	vim.opt.splitbelow = true -- force all horizontal splits to go below current window
	vim.opt.splitright = true -- force all vertical splits to go to the right of current window
	vim.opt.swapfile = false -- creates a swapfile
	vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
	vim.opt.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
	vim.opt.title = true -- set the title of window to the value of the titlestring
	vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
	vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
	vim.opt.undofile = true -- enable persistent undo
	vim.opt.updatetime = 300 -- faster completion
	vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
	vim.opt.expandtab = true -- convert tabs to spaces
	vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
	vim.opt.tabstop = 2 -- insert 2 spaces for a tab
	vim.opt.cursorline = true -- highlight the current line
	vim.opt.number = true -- set numbered lines
	vim.opt.relativenumber = true -- set relative numbered lines
	vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
	vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
	vim.opt.wrap = false -- display lines as one long line
	vim.opt.spell = false
	vim.opt.spelllang = "en"
	vim.opt.scrolloff = 8 -- is one of my fav
	vim.opt.sidescrolloff = 8
	vim.opt.encoding = "utf-8"
	--基与treesitter的代码折叠
	vim.o.foldmethod = "expr"
	vim.o.foldexpr = "nvim_treesitter#foldexpr()" --为每行折叠的设置等级
	vim.o.foldlevel = 4 --设置折叠等级高于4 就会关闭这个折叠片段
	vim.o.foldtext =
		[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
	vim.o.foldnestmax = 3 --设置“缩进”和“语法”的最大折叠嵌套方法。这样可以避免创建过多的折叠。使用更多大于20不起作用，因为内部限制为20。
	vim.o.foldminlines = 1 --设置可以显示折叠的屏幕行数 关闭也适用于手动闭合的折叠。默认值为 只有在占用两条或多条屏幕线时，才能关闭一个折叠。 设置为零可以关闭一条屏幕线的折叠。 请注意，这仅对显示内容产生影响。使用后 “zc”关闭折叠，因为折叠较小，所以显示为打开 除了“折叠线”，后面的“zc”可以关闭包含折叠的部分。
end

return M
