local M = {}

M.config = function()
	local kind = require("user.lsp_kind")
	-- =========================================
	lvim.builtin.cmp.sources = {
		{ name = "nvim_lsp", max_item_count = 10 },
		{ name = "cmp_tabnine", max_item_count = 3 },
		{
			name = "buffer",
			max_item_count = 10,--[[ , keyword_length = 5  ]]
		},
		{ name = "path", max_item_count = 5 },
		{ name = "luasnip", priority = 9, max_item_count = 3 },
		{ name = "nvim_lua" },
		{ name = "calc" },
		{ name = "emoji" },
		{ name = "tmux", max_item_count = 3 },
		{ name = "treesitter" },
		{ name = "crates" },
		{ name = "spell", max_item_count = 3 },
		{ name = "orgmode" },
	}
	lvim.builtin.cmp.documentation.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
	lvim.builtin.cmp.experimental = {
		ghost_text = true,
		native_menu = false,
		-- custom_menu = true,
	}
	lvim.builtin.cmp.formatting.kind_icons = kind.cmp_kind
	lvim.builtin.cmp.formatting.source_names = {
		buffer = "  ", -- ﬘     "[Buf]" 
		nvim_lsp = "  ",
		luasnip = "  ", -- "(LuaSnip)"
		org = "[Org]",
		treesitter = "  ",
		nvim_lua = "  ", -- "(NvLua)"
		spell = " 暈",
		look = "  ",
		emoji = "  ",
		path = "  ", -- 率
		calc = "  ", -- 
		cmp_tabnine = " ﮧ ", -- "  "
		tmux = "[tmux]", -- 
	}
	require("cmp").setup.cmdline(":", { sources = { { name = "cmdline" } } })
	-- fancy_cmp
	if lvim.builtin.fancy_cmp.active then
		lvim.builtin.cmp.formatting.source_names = {
			buffer = "[BUF]", -- ﬘     "[Buf]" 
			nvim_lsp = "[LSP]",
			luasnip = "[SNIP]", -- "(LuaSnip)"
			org = "[ORG]",
			treesitter = "  ",
			nvim_lua = "[NVLUA]", -- "(NvLua)"
			spell = " 暈",
			look = "  ",
			emoji = "  ",
			path = "[PATH]", -- 率
			calc = "  ", -- 
			cmp_tabnine = " ﮧ ", -- "  "
			tmux = "[TMUX]", -- 
		}
		local status_cmp_ok, cmp = pcall(require, "cmp")
		if not status_cmp_ok then
			return
		end
		lvim.builtin.cmp.formatting.format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", lvim.builtin.cmp.formatting.kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = lvim.builtin.cmp.formatting.source_names[entry.source.name]
			vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name]
				or lvim.builtin.cmp.formatting.duplicates_default
			return vim_item
		end
		lvim.builtin.cmp.formatting.fields = { "abbr", "kind", "menu" } -- Organise the layout of the menu
		-- lvim.builtin.cmp.documentation.border = nil
		lvim.builtin.cmp.documentation.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
		lvim.builtin.cmp.mapping["<C-d>"] = cmp.mapping.scroll_docs(4)
		lvim.builtin.cmp.mapping["<C-u>"] = cmp.mapping.scroll_docs(-4)
	end
	-- Remove <C-j> <C-k> select snippets
	lvim.builtin.cmp.mapping["<C-j>"] = nil
	lvim.builtin.cmp.mapping["<C-k>"] = nil
	-- Add <C-j> <C-k> to jump in luasnippts
	lvim.keys.insert_mode["<C-j>"] = "<cmd>lua require('luasnip').jump(1)<cr>"
	lvim.keys.insert_mode["<C-k>"] = "<cmd>lua require('luasnip').jump(-1)<cr>"

	-- LSP
	-- =========================================
	-- icon                       既             
	lvim.lsp.diagnostics.signs.values = {
		{ name = "DiagnosticSignError", text = kind.icons.error },
		{ name = "DiagnosticSignWarn", text = kind.icons.warn },
		{ name = "DiagnosticSignInfo", text = kind.icons.info },
		{ name = "DiagnosticSignHint", text = kind.icons.hint },
	}
	vim.diagnostic.config({
		virtual_text = {
			prefix = "■", -- Could be '●', '▎', 'x' ■ 
		},
	})

	if lvim.builtin.orginal_lsp.active == true then
		lvim.lsp.diagnostics.signs.values = {
			{ name = "DiagnosticSignError", text = "E" },
			{ name = "DiagnosticSignWarn", text = "W" },
			{ name = "DiagnosticSignInfo", text = "I" },
			{ name = "DiagnosticSignHint", text = "H" },
		}
		vim.diagnostic.config({
			virtual_text = {
				prefix = "■", -- Could be '●', '▎', 'x' ■ 
			},
		})
	end

	-- Gitsigns
	-- =========================================
	lvim.builtin.gitsigns.opts.current_line_blame = true
	lvim.builtin.gitsigns.opts.current_line_blame_formatter_opts = {
		relative_time = true,
	}

	-- Notify
	-- =========================================
	-- vim.notify = require("notify")
	lvim.builtin.notify.opts.timeout = 2000
	lvim.builtin.notify.opts.icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	}

	-- Lualine
	-- =========================================
	lvim.builtin.lualine.active = true
	lvim.builtin.lualine.style = "default"
	lvim.builtin.lualine.options.theme = "auto"
  lvim.builtin.lualine.options.disabled_filetypes = { "dashboard", "NvimTree", "Outline", "alpha" }

	-- Vscode theme
	-- =========================================
	vim.g.vscode_style = "dark"

	-- Comment.nvim
	-- =========================================
	lvim.builtin.comment.mappings.extra = true

	-- NvimTree
	-- =========================================
	lvim.builtin.nvimtree.setup.auto_open = 0
	lvim.builtin.nvimtree.setup.view.side = "left"
	lvim.builtin.nvimtree.show_icons.git = 1
	lvim.builtin.nvimtree.setup.diagnostics = {
		enable = true,
		icons = {
			hint = kind.icons.hint,
			info = kind.icons.info,
			warning = kind.icons.warn,
			error = kind.icons.error,
		},
	}
	lvim.builtin.nvimtree.icons = kind.nvim_tree_icons
	-- Project
	-- =========================================
	lvim.builtin.project.active = true
	-- Manual mode doesn't automatically change your root directory, so you have
	-- the option to manually do so using `:ProjectRoot` command.
	-- lvim.builtin.project.detection_methods = { "lsp" }
	lvim.builtin.project.manual_mode = true

	-- lvim.builtin.nvimtree.hide_dotfiles = 0
	-- Dashboard
	vim.g.dashboard_disable_statusline = 1

	-- treesitter
	-- =========================================
	lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } } -- treesitter is buggy :(
	lvim.builtin.treesitter.matchup.enable = true
	lvim.builtin.treesitter.textsubjects = { enable = true }
	lvim.builtin.treesitter.playground = { enable = true }
	lvim.builtin.treesitter.context_commentstring = { enable = true }
	lvim.builtin.treesitter.highlight = { enable = true, additional_vim_regex_highlighting = { "org" } }
	lvim.builtin.treesitter.playground = { enable = true }
	lvim.builtin.treesitter.rainbow = { enable = true }
	lvim.builtin.treesitter.ensure_installed = {}
	lvim.builtin.treesitter.ignore_install = { "haskell" }
	lvim.builtin.treesitter.highlight.enabled = true
	lvim.builtin.treesitter.autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"typescript",
			"markdown",
		},
	}
	lvim.builtin.treesitter.query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	}
	lvim.builtin.treesitter.on_config_done = function()
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.solidity = {
			install_info = {
				url = "https://github.com/JoranHonig/tree-sitter-solidity",
				files = { "src/parser.c" },
				requires_generate_from_grammar = true,
			},
			filetype = "solidity",
		}
		parser_config.jsonc.used_by = "json"
		parser_config.markdown = {
			install_info = {
				url = "https://github.com/ikatyang/tree-sitter-markdown",
				files = { "src/parser.c", "src/scanner.cc" },
			},
		}
		parser_config.org = {
			install_info = {
				url = "https://github.com/milisims/tree-sitter-org",
				revision = "main",
				files = { "src/parser.c", "src/scanner.cc" },
			},
			filetype = "org",
		}
	end

	lvim.builtin.treesitter.textobjects = {
		lookahead = true,
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["aC"] = "@conditional.outer",
				["iC"] = "@conditional.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["]w"] = "@parameter.inner",
			},
			swap_previous = {
				["[w"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
		},
		lsp_interop = {
			enable = true,
			border = "rounded",
			peek_definition_code = {
				["df"] = "@function.outer",
				["dF"] = "@class.outer",
			},
		},
	}

	-- Telescope
	-- =========================================
	-- lvim.builtin.telescope.defaults.path_display = { "smart", "absolute", "truncate" }
	-- icon                       既            
	lvim.builtin.telescope.extensions.fzf = nil
	lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
	lvim.builtin.telescope.defaults.winblend = 0 -- Transparency
	lvim.builtin.telescope.defaults.layout_strategy = "horizontal" -- flex horizontal
	lvim.builtin.telescope.defaults.selection_caret = nil --       "❯ "
	lvim.builtin.telescope.defaults.prompt_prefix = nil -- "❯ "
	lvim.builtin.telescope.defaults.layout_config = {
		width = 0.95,
		height = 0.85,
		prompt_position = "top", -- bottom top
		flex = {
			flip_columns = 140,
		},
		vertical = {
			preview_cutoff = 40,
			prompt_position = "bottom",
		},
		horizontal = {
			preview_width = function(_, cols, _)
				if cols > 200 then
					return math.floor(cols * 0.4)
				else
					return math.floor(cols * 0.6)
				end
			end,
		},
	}
	lvim.builtin.telescope.defaults.file_ignore_patterns = {
		"vendor/*",
		"fonts/*",
		"node_modules",
		"%.jpg",
		"%.jpeg",
		"%.png",
		"%.svg",
		"%.otf",
		"%.ttf",
		".git",
		"%.jfif%",
		"%.zip%",
		"openfly.txt",
	}
	local actions = require("telescope.actions")
	lvim.builtin.telescope.defaults.mappings = {
		i = {
			["?"] = actions.which_key,
			["<C-c>"] = actions.close,
		},
		n = {
			["q"] = actions.close,
			["<C-c>"] = actions.close,
			["?"] = actions.which_key,
		},
	}
	local telescope_actions = require("telescope.actions.set")
	lvim.builtin.telescope.defaults.pickers.find_files = {
		theme = "dropdown",
		attach_mappings = function(_)
			telescope_actions.select:enhance({
				post = function()
					vim.cmd(":normal! zx")
				end,
			})
			return true
		end,
		find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
	}
	require("telescope").load_extension("dotfiles")
	-- require("telescope").load_extension('emoji')
	-- require("telescope").load_extension("file_create")
	require("telescope").load_extension("luasnip")
	-- Terminal
	-- =========================================
	lvim.builtin.terminal.active = true
  lvim.builtin.terminal.open_mapping = [[<C-t>]]
	lvim.builtin.terminal.close_on_exit = false
	-- lvim.builtin.terminal.hide_numbers = false
	-- horizontal_size
	lvim.builtin.terminal.size = function(term)
		if term.direction == "horizontal" then
			return 10
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end
	lvim.builtin.terminal.execs[2] = nil
	--WhichKey
	-- =========================================
	lvim.builtin.which_key.setup.triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k", ";" },
		v = { "j", "k", ";" },
	}
	lvim.builtin.which_key.setup.window.winblend = 10
	lvim.builtin.which_key.setup.window.border = "none"
	lvim.builtin.which_key.on_config_done = function(wk)
		local keys = {
			["ga"] = { "<cmd>lua require('user.telescope').code_actions()<CR>", "Code Action" },
			["gR"] = { "<cmd>Trouble lsp_references<CR>", "Goto References" },
			["gI"] = { "<cmd>lua require('user.telescope').lsp_implementations()<CR>", "Goto Implementation" },
			-- ["gh"] = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "lspsaga_finder"},
			-- ["gp"] = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>","preview_definition"},
		}

		-- better keybindings for ts and tsx files
		local langs = { "typescript", "typescriptreact" }
		local ftype = vim.bo.filetype
		if vim.tbl_contains(langs, ftype) then
			local ts_keys = {
				["gA"] = { "<cmd>TSLspImportAll<CR>", "Import All" },
				["gr"] = { "<cmd>TSLspRenameFile<CR>", "Rename File" },
				--["gr"] = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename File" },
				["gS"] = { "<cmd>TSLspOrganize<CR>", "Organize Imports" },
			}
			wk.register(ts_keys, { mde = "n" })
		end
		wk.register(keys, { mode = "n" })
	end
end

return M
