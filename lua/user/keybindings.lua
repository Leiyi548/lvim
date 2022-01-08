local M = {}

M.set_terminal_keymaps = function()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

M.config = function()
	-- leader key
	lvim.leader = "space"
	-- run 保持终端
	vim.api.nvim_set_keymap("t", "<esc>", "<C-\\><C-n>", { silent = true })
	-- normal_mode
	if lvim.builtin.fancy_bufferline.active then
		lvim.keys.normal_mode["<Tab>"] = "<cmd>BufferLineCycleNext<cr>"
		lvim.keys.normal_mode["<S-Tab>"] = "<cmd>BufferLineCyclePrev<cr>"
	end
	lvim.keys.normal_mode["Q"] = ":qa!<cr>"
	lvim.keys.normal_mode["<S-h>"] = "^"
	lvim.keys.normal_mode["<S-l>"] = "$"
	lvim.keys.normal_mode["<leader>sc"] = "<cmd>nohlsearch<cr>"
	lvim.keys.normal_mode["sv"] = "<cmd>vsplit<cr>"
	lvim.keys.normal_mode["sg"] = "<cmd>split<cr>"
	lvim.keys.normal_mode["sc"] = "<C-w>c"
	-- nice N and n navigation
	lvim.keys.normal_mode["n"] = "nzzzv"
	lvim.keys.normal_mode["N"] = "Nzzzv"
	-- nice J
	lvim.keys.normal_mode["J"] = "mzJ`zmdz"
	-- better indent
	lvim.keys.normal_mode["<"] = "<<"
	lvim.keys.normal_mode[">"] = ">>"
	-- visula_mode
	lvim.keys.visual_mode["H"] = "^"
	lvim.keys.visual_mode["L"] = "$"
	lvim.keys.visual_mode["<leader>lr"] = "<Cmd>lua require('renamer').rename()<CR>"
	-- cmd mode
	lvim.keys.command_mode["<C-b>"] = "<Left>"
	lvim.keys.command_mode["<C-f>"] = "<Right>"
	lvim.keys.command_mode["<C-a>"] = "<Home>"
	lvim.keys.command_mode["<C-e>"] = "<End>"
	lvim.keys.command_mode["<C-d>"] = "<Del>"
	lvim.keys.command_mode["<C-h>"] = "<BS>"
	-- delete jk to escape
	lvim.keys.insert_mode["jk"] = false
	lvim.keys.insert_mode["kj"] = false
	lvim.keys.insert_mode["jj"] = false
	-- some emacs keymapping
	lvim.keys.insert_mode["<C-a>"] = "<HOME>"
	lvim.keys.insert_mode["<C-e>"] = "<END>"
	lvim.keys.insert_mode["<C-b>"] = "<LEFT>"
  -- quickcopy
	lvim.keys.insert_mode["<C-f>"] = "<RIGHT>"
	lvim.keys.normal_mode["Y"] = "y$"
	lvim.keys.normal_mode["<leader>Y"] = 'gg"+yG'
	lvim.keys.normal_mode["<leader>y"] = '"+y'
	lvim.keys.visual_mode["<leader>y"] = '"+y'
	lvim.keys.normal_mode["<leader>yy"] = '"+yy'
	lvim.keys.normal_mode["<leader>p"] = '"+p"'
	lvim.keys.visual_mode["<leader>p"] = '"+p'
	-- better :q
	vim.cmd([[
   nnoremap q: :q
   ]])
	-- HTML preview in Google Chrome
	-- =========================================
  lvim.keys.normal_mode["<M-b>"] = "<cmd>AsyncTask Application<cr>"
  lvim.keys.insert_mode["<M-b>"] = "<cmd>AsyncTask Application<cr>"
	-- Neogen
	-- =========================================
  lvim.keys.normal_mode["<C-]>"] = "<cmd>lua require('neogen').jump_next()<CR>"
	-- hop
	-- =========================================
	lvim.keys.normal_mode["E"] = "<cmd>HopChar1<cr>"
	lvim.keys.visual_mode["E"] = "<cmd>HopChar1<cr>"
	lvim.keys.normal_mode["sl"] = "<cmd>HopLineStart<cr>"
	lvim.keys.visual_mode["sl"] = "<cmd>HopLineStart<cr>"
	lvim.keys.normal_mode["ss"] = "<cmd>HopChar2<cr>"
	lvim.keys.visual_mode["ss"] = "<cmd>HopChar2<cr>"
	lvim.keys.normal_mode["sw"] = "<cmd>HopWord<cr>"
	lvim.keys.visual_mode["sw"] = "<cmd>HopWord<cr>"
	-- place this in one of your configuration file(s)
	vim.api.nvim_set_keymap(
		"n",
		"f",
		"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
		{}
	)
	vim.api.nvim_set_keymap(
		"n",
		"F",
		"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
		{}
	)
	vim.api.nvim_set_keymap(
		"o",
		"f",
		"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
		{}
	)
	vim.api.nvim_set_keymap(
		"o",
		"F",
		"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
		{}
	)
	vim.api.nvim_set_keymap(
		"",
		"t",
		"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
		{}
	)
	vim.api.nvim_set_keymap(
		"",
		"T",
		"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
		{}
	)
	-- Luasnip
	-- =========================================
	vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
	vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
	-- X closes a buffer
	lvim.keys.normal_mode["<S-x>"] = ":bdelete!<cr>"
	-- tmuxNavigation
	-- =========================================
	if lvim.builtin.tmuxNavigator.active then
		lvim.keys.normal_mode["<C-h>"] = "<CMD>lua require('Navigator').left()<cr>"
		lvim.keys.normal_mode["<C-j>"] = "<CMD>lua require('Navigator').down()<cr>"
		lvim.keys.normal_mode["<C-k>"] = "<CMD>lua require('Navigator').up()<cr>"
		lvim.keys.normal_mode["<C-l>"] = "<CMD>lua require('Navigator').right()<cr>"
		lvim.keys.visual_mode["<C-h>"] = "<CMD>lua require('Navigator').left()<cr>"
		lvim.keys.visual_mode["<C-j>"] = "<CMD>lua require('Navigator').down()<cr>"
		lvim.keys.visual_mode["<C-k>"] = "<CMD>lua require('Navigator').up()<cr>"
		lvim.keys.visual_mode["<C-l>"] = "<CMD>lua require('Navigator').right()<cr>"
	end
	-- Whichkey
	-- =========================================
	lvim.builtin.which_key.vmappings = {
		s = {
			name = "Search",
			c = { name = "clear search result" },
			p = { "<cmd>HopPattern<cr>", "search like /" },
			s = { "<cmd>HopChar1<cr>", "search by char1" },
			w = { "<cmd>HopWord<cr>", "search word" },
			l = { "<cmd>HopLine<cr>", "search line" },
      v = { "<cmd>lua require('user.telescope').grep_string_visual()<cr>","search visual word"}
		},
		y = { name = "CopyClipboard" },
		p = { name = "Paste" },
	}
	lvim.builtin.which_key.mappings = {
		[";"] = { "<cmd>Alpha<cr>", "Dashboard" },
		["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		["u"] = { "<cmd>UndotreeToggle<cr>", "Undotree" },
		-- ["o"] = { "<cmd>Vista!!<cr>","Outline"},
		["o"] = { "<cmd>SymbolsOutline<cr>", "Outline" },
		["Y"] = { "CopyAll" },
		["y"] = { "CopyClipboard" },
		["z"] = { "<cmd>ZenMode<cr>","ZenMode" },
		b = {
			name = "Buffers",
			j = { "<cmd>BufferPick<cr>", "Jump" },
			f = { "<cmd>Telescope buffers<cr>", "Find" },
			b = { "<cmd>b#<cr>", "Previous" },
			w = { "<cmd>BufferWipeout<cr>", "Wipeout" },
			e = {
				"<cmd>BufferCloseAllButCurrent<cr>",
				"Close all but current",
			},
			h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
			l = {
				"<cmd>BufferCloseBuffersRight<cr>",
				"Close all to the right",
			},
			D = {
				"<cmd>BufferOrderByDirectory<cr>",
				"Sort by directory",
			},
			L = {
				"<cmd>BufferOrderByLanguage<cr>",
				"Sort by language",
			},
		},
		--Whichkey-p
		p = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			C = { "<cmd>PackerClean<cr>", "Clean" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			r = { "<cmd>lua require('lvim.utils').reload_lv_config()<cr>", "Reload" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},
		--Whichkey-r
		r = {
			name = "Run",
			a = { "<cmd>RnvimrToggle<cr>", "Ranger" },
			r = { "<cmd>AsyncTask file-run<cr>", "Run on Terminal" },
			f = { "<cmd>AsyncTask file-run-floaterm<cr>", "Run on floaterm" },
		},
		--Whichkey-F
		F = {
			name = "Custom Find",
			i = { "<cmd>lua require('user.telescope').installed_plugins()<cr>", "Installed Plugins" },
			b = { "<cmd>lua require('user.telescope').builtin()<cr>", "Builtin" },
			f = { "<cmd>lua require('user.telescope').curbuf()<cr>", "Current Buffer" },
			g = { "<cmd>lua require('user.telescope').git_files()<cr>", "Git Files" },
			p = { "<cmd>lua require('user.telescope').project_search()<cr>", "Project" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			s = { "<cmd>lua require('user.telescope').git_status()<cr>", "Git Status" },
			z = { "<cmd>lua require('user.telescope').search_only_certain_files()<cr>", "Certain Filetype" },
		},
		-- Whichkey-f
		f = {
			name = "Find",
			b = {
				"<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr>",
				"Buffer",
			},
			c = { "<cmd>luafile" .. "~/.config/lvim/lua/user/colors.lua" .. "<cr>", "Colorscheme" },
			C = { "<cmd>Telescope commands<cr>", "Commands" },
			d = {
				"<cmd>lua require'telescope'.extensions.dotfiles.dotfiles(require('telescope.themes').get_dropdown({}))<cr>",
				"Dotfiles",
			},
			-- e = { "<cmd>Telescope emoji<cr>", "emoji" },
			f = {
				"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>",
				"File",
			},
			H = { "<cmd>Telescope help_tags<cr>", "Help" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			p = { "<cmd>Telescope projects<cr>", "Keymaps" },
			N = { "<cmd>enew<cr>", "New File" },
			r = {
				"<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({}))<cr>",
				"Recent File",
			},
			j = {
				"<cmd>lua require'telescope.builtin'.jumplist(require('telescope.themes').get_dropdown({}))<cr>",
				"Jumplist",
			},
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			g = {
				"<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({}))<cr>",
				"Grep",
			},
			m = {
				"<cmd>lua require'telescope.builtin'.marks(require('telescope.themes').get_dropdown({}))<cr>",
				"Marks",
			},
			n = {
				"<cmd>lua require('user.telescope').find_note()<cr>",
				"Notes",
			},
			s = {
				"<cmd>lua require'telescope'.extensions.luasnip.luasnip(require('telescope.themes').get_cursor({}))<cr>",
				"Snippet",
			},
		},
		--whichkey-x
		x = {
			name = "Diagnostics",
			t = { "<cmd>TroubleToggle<cr>", "trouble" },
			w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
			d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
			q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
			l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
			r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
		},
		--Whichkey-g
		g = {
			name = "Git",
			g = { "Lazygit"},
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			t = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle blame" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = {
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
				"Undo Stage Hunk",
			},
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			C = {
				"<cmd>Telescope git_bcommits<cr>",
				"Checkout commit(for current file)",
			},
			d = {
				"<cmd>Gitsigns diffthis HEAD<cr>",
				"Git Diff",
			},
		},
		--Whichkey-l
		l = {
			name = "LSP",
			a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
			d = {
				"<cmd>Telescope lsp_document_diagnostics<cr>",
				"Document Diagnostics",
			},
			w = {
				"<cmd>Telescope lsp_workspace_diagnostics<cr>",
				"Workspace Diagnostics",
			},
			f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
			i = { "<cmd>LspInfo<cr>", "Info" },
			I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
			j = {
				"<cmd>lua vim.diagnostic.goto_next()<cr>",
				"Next Diagnostic",
			},
			k = {
				"<cmd>lua vim.diagnostic.goto_prev()<cr>",
				"Prev Diagnostic",
			},
			l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			p = {
				name = "Peek",
				d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
				t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
				i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
			},
			q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
			-- r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			r = { "<cmd>lua require('renamer').rename()<cr>", "Rename" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
		},
		--WhichKey-m
		m = {
			name = "Markdown",
			p = { "<cmd>MarkdownPreview<cr>", "Preview" },
			g = { "<cmd>Glow<cr>", "Glow" },
			r = { "<cmd>TableModeRealign<cr>", "Tablealign" },
			-- o = {"<cmd>Vista!!<cr>","outline"},
		},
		--WhichKey-n
		n = {
			name = "Neogen",
			c = { "<cmd>lua require('neogen').generate({ type = 'class'})<cr>", "Class Documentation" },
			f = { "<cmd>lua require('neogen').generate({ type = 'func'})<cr>", "Function Documentation" },
		},
		--Whichkey-L
		L = {
			name = "+LunarVim",
			c = {
				"<cmd>edit" .. get_config_dir() .. "/config.lua<cr>",
				"Edit config.lua",
			},
			f = {
				"<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
				"Find LunarVim files",
			},
			g = {
				"<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
				"Grep LunarVim files",
			},
			k = { "<cmd>lua require('lvim.keymappings').print()<cr>", "View LunarVim's default keymappings" },
			i = {
				"<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
				"Toggle LunarVim Info",
			},
			I = {
				"<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
				"View LunarVim's changelog",
			},
			l = {
				name = "+logs",
				d = {
					"<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
					"view default log",
				},
				D = {
					"<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
					"Open the default logfile",
				},
				l = {
					"<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>",
					"view lsp log",
				},
				L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
				n = {
					"<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
					"view neovim log",
				},
				N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
				p = {
					"<cmd>lua require('lvim.core.terminal').toggle_log_view('packer.nvim')<cr>",
					"view packer log",
				},
				P = { "<cmd>exe 'edit '.stdpath('cache').'/packer.nvim.log'<cr>", "Open the Packer logfile" },
			},
			r = { "<cmd>lua require('lvim.utils').reload_lv_config()<cr>", "Reload configurations" },
			u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
		},
		-- Whichkey-s
		s = {
			name = "Search",
			c = { "clear search result" },
			p = { "<cmd>HopPattern<cr>", "search like /" },
			--s = { "<cmd>HopChar2<cr>","search by char2" },
			s = { "<cmd>HopChar1<cr>", "search by char1" },
			w = { "<cmd>HopWord<cr>", "search word" },
			l = { "<cmd>HopLine<cr>", "search line" },
		},
		T = {
			name = "Treesitter",
			i = { ":TSConfigInfo<cr>", "Info" },
		},
	}
	-- plugins keybindings
	if lvim.builtin.fancy_bufferline.active then
		-- Whichkey-b
		lvim.builtin.which_key.mappings.b = {
			name = "Buffers",
			["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "goto 1" },
			["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "goto 2" },
			["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "goto 3" },
			["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "goto 4" },
			["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "goto 5" },
			["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "goto 6" },
			["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "goto 7" },
			["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "goto 8" },
			["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "goto 9" },
			f = { "<cmd>lua require('user.telescope').curbuf()<cr>", "FuzzyFind" },
			c = { "<Cmd>BufferLinePickClose<CR>", "delete buffer" },
			p = { "<Cmd>BufferLinePick<CR>", "pick buffer" },
			t = { "<Cmd>BufferLineGroupToggle docs<CR>", "toggle groups" },
			b = { "<cmd>b#<cr>", "Previous" },
		}
	end
	if lvim.builtin.fancy_telescope.active then
		-- Whichkey-f
		lvim.builtin.which_key.mappings.f = {
			name = "Find",
			b = {
				"<cmd>lua require'telescope.builtin'.buffers()<cr>",
				"Buffer",
			},
			c = { "<cmd>luafile" .. "~/.config/lvim/lua/user/colors.lua" .. "<cr>", "Colorscheme" },
			C = { "<cmd>Telescope commands<cr>", "Commands" },
			d = {
				"<cmd>lua require'telescope'.extensions.dotfiles.dotfiles(require('telescope.themes').get_dropdown({}))<cr>",
				"Dotfiles",
			},
			-- e = { "<cmd>Telescope emoji<cr>", "emoji" },
			f = {
				"<cmd>lua require'telescope.builtin'.find_files()<cr>",
				"File",
			},
			p = { "<cmd>Telescope projects<cr>", "Keymaps" },
			H = { "<cmd>Telescope help_tags<cr>", "Help" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			N = { "<cmd>enew<cr>", "New File" },
			r = {
				"<cmd>lua require'telescope.builtin'.oldfiles()<cr>",
				"Recent File",
			},
			j = {
				"<cmd>lua require'telescope.builtin'.jumplist(require('telescope.themes').get_dropdown({}))<cr>",
				"Jumplist",
			},
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			g = {
				"<cmd>lua require'telescope.builtin'.live_grep()<cr>",
				"Grep",
			},
			m = {
				"<cmd>lua require'telescope.builtin'.marks(require('telescope.themes').get_dropdown({}))<cr>",
				"Marks",
			},
			n = {
				"<cmd>lua require('user.telescope').find_note()<cr>",
				"Notes",
			},
			s = {
				"<cmd>lua require'telescope'.extensions.luasnip.luasnip(require('telescope.themes').get_cursor({}))<cr>",
				"Snippet",
			},
		}
	end
	local Terminal = require("toggleterm.terminal").Terminal
	local toggle_horizontal = function()
		local horizontal = Terminal:new({
			direction = "horizontal",
			float_opts = { border = "double" },
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
			---@diagnostic disable-next-line: unused-local
			on_close = function(term)
				vim.cmd("Closing terminal")
			end,
		})
		horizontal:toggle()
	end
	lvim.builtin.which_key.mappings.t = {
		name = "Terminal",
		t = { toggle_horizontal, "Terminal" },
	}

	function WhichkeyMarkdown()
		lvim.builtin.which_key.mappings["o"] = {
			"<cmd>Vista!!<cr>",
			"Outline",
		}
	end
	-- filetype whichkey
	vim.cmd("autocmd FileType markdown lua WhichkeyMarkdown()")
end

return M
