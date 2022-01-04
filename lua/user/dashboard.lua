local M = {}

M.config = function()
	local present, alpha = pcall(require, "alpha")
	if not present then
		return
	end
	local header = {
		type = "text",
		val = require("user.banners").dashboard(),
		opts = {
			position = "center",
			hl = "Comment",
		},
	}
	local num_plugins_loaded = #vim.fn.globpath(get_runtime_dir() .. "/site/pack/packer/start", "*", 0, 1)

	-- local thingy = io.popen('echo "$(date +%a) $(date +%b) $(date +%d)" | tr -d "\n"')
	local thingy = io.popen('echo "$(date +%a) $(date +%b月)$(date +%d日)" | tr -d "\n"')
	local date = thingy:read("*a")
	thingy:close()
	--local date = os.date("%a")

	--  plugins = plugins:gsub("^%s*(.-)%s*$", "%1")

	local plugin_count = {
		type = "text",
		val = "Lunarvim loading.." .. num_plugins_loaded .. " plugins  ",
		opts = {
			position = "center",
			hl = "String",
		},
	}

	local heading = {
		type = "text",
		-- val = "  Today is " .. date .. "",
		val = " 今天是周" .. date .. "",
		opts = {
			position = "center",
			hl = "String",
		},
	}

	local fortune = require("alpha.fortune")
	local footer = {
		type = "text",
		val = fortune(),
		opts = {
			position = "center",
			hl = "Comment",
		},
	}

	local function button(sc, txt, keybind)
		local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

		local opts = {
			position = "center",
			text = txt,
			shortcut = sc,
			cursor = 5,
			width = 24,
			align_shortcut = "right",
			hl_shortcut = "Number",
			hl = "Type",
		}
		if keybind then
			opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
		end

		return {
			type = "button",
			val = txt,
			on_press = function()
				local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
				vim.api.nvim_feedkeys(key, "normal", false)
			end,
			opts = opts,
		}
	end

	local buttons = {
		type = "group",
		val = {
			button("f", "   Find File ", ":Telescope find_files<CR>"),
			button("n", "    New file", ":ene <BAR> startinsert <CR>"), -- 
			button("w", "   Find word", "<cmd>Telescope live_grep<CR>"),
			button("p", "   Recent Projects", ":Telescope projects<CR>"),
			button("r", "   Recent Files", ":Telescope oldfiles<CR>"),
			button("c", "   Colorscheme", "<cmd>luafile" .. "~/.config/lvim/lua/user/colors.lua" .. "<cr>"),
			button("o", "   Configure", ":e ~/.config/lvim/config.lua <CR>"),
			button("q", "   Quit", ":q<CR>"),
		},
		opts = {
			spacing = 1,
		},
	}

	local section = {
		header = header,
		buttons = buttons,
		plugin_count = plugin_count,
		heading = heading,
		footer = footer,
	}

	local opts = {
		layout = {
			{ type = "padding", val = 1 },
			section.header,
			{ type = "padding", val = 2 },
			section.heading,
			section.plugin_count,
			{ type = "padding", val = 1 },
			-- section.top_bar,
			section.buttons,
			-- section.bot_bar,
			-- { type = "padding", val = 1 },
			section.footer,
		},
		opts = {
			margin = 5,
		},
	}
	alpha.setup(opts)
end

return M
