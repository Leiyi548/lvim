local M = {}
local kind = require("user.lsp_kind")

local function lsp_progress()
	local messages = vim.lsp.util.get_progress_messages()
	if #messages == 0 then
		return ""
	end
	local status = {}
	for _, msg in pairs(messages) do
		table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
	end
	local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
	local ms = vim.loop.hrtime() / 1000000
	local frame = math.floor(ms / 120) % #spinners
	return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

vim.cmd([[autocmd User LspProgressUpdate let &ro = &ro]])

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local function testing()
	if vim.g.testing_status == "running" then
		return " "
	end
	if vim.g.testing_status == "fail" then
		return ""
	end
	if vim.g.testing_status == "pass" then
		return " "
	end
	return nil
end
local function using_session()
	return (vim.g.using_persistence ~= nil)
end

local mode = function()
	local mod = vim.fn.mode()
	if mod == "n" or mod == "no" or mod == "nov" then
		return "-- NORMAL --"
	elseif mod == "i" or mod == "ic" or mod == "ix" then
		return "-- INSERT --"
	elseif mod == "V" or mod == "v" or mod == "vs" or mod == "Vs" or mod == "cv" then
		return "-- VISUAL --"
	elseif mod == "c" or mod == "ce" then
		return "-- COMMMAND --"
	elseif mod == "r" or mod == "rm" or mod == "r?" then
		return "-- NORMAL --"
	elseif mod == "R" or mod == "Rc" or mod == "Rv" or mod == "Rv" then
		return "-- REPLACE --"
	end
	return "-- NORMAL --"
end

local default_colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	purple = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
	git = { change = "#0c7d9d", add = "#587c0c", delete = "#94151b", conflict = "#bb7a61" },
}

M.config = function()
	local colors
	colors = default_colors
	-- Color table for highlights
	local mode_color = {
		n = colors.fg,
		i = colors.fg,
		v = colors.fg,
		[" "] = colors.fg,
		V = colors.fg,
		c = colors.fg,
		no = colors.fg,
		s = colors.fg,
		S = colors.fg,
		[""] = colors.fg,
		ic = colors.fg,
		R = colors.fg,
		Rv = colors.fg,
		cv = colors.fg,
		ce = colors.fg,
		r = colors.fg,
		rm = colors.fg,
		["r?"] = colors.fg,
		["!"] = colors.fg,
		t = colors.fg,
	}
	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		hide_in_width_lsp = function()
			return vim.fn.winwidth(0) > 60
		end,
		hide_small = function()
			return vim.fn.winwidth(0) > 150
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand("%:p:h")
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	-- Config
	local config = {
		options = {
			icons_enabled = true,
			theme = "auto",
			-- Disable sections and component separators
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "dashboard", "Outline", "alpha", "NvimTree" },
		},
		sections = {
			-- these are to remove the defaults
			lualine_a = {},

			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = {},
			lualine_x = {},
		},
		inactive_sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_v = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {
				{
					function()
						vim.api.nvim_command(
							"hi! LualineModeInactive guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg_alt
						)
						return ""
						-- return mode()
					end,
					-- color = "LualineModeInactive",
					padding = { left = 0, right = 0 },
					-- left_padding = 1,
				},
				{
					"filename",
					color = {},
					cond = conditions.buffer_not_empty,
					-- color = { fg = colors.fg, gui = "bold" },
				},
			},
			lualine_x = {},
		},
	}

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x ot right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left({
		function()
			return ""
		end,
		cond = conditions.check_git_workspace,
		color = {},
		left_padding = 1,
	})
	ins_left({
		"b:gitsigns_head",
		cond = conditions.check_git_workspace,
		color = {},
		padding = 0,
	})

	ins_left({
		function()
			return ""
		end,
		padding = 0,
	})
	local ok, _ = pcall(require, "vim.diagnostic")
	if ok then
		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = {
				error = kind.icons.error,
				warn = kind.icons.warn,
				info = kind.icons.info,
				hint = kind.icons.hint,
			},
			sections = { "error", "warn" },
			-- sections = {'error', 'warn', 'info', 'hint'},
			-- cond = conditions.hide_in_width,
			colored = false,
			color = {},
			always_visible = true,
			padding = { left = 2, right = 2 },
		})
	else
		ins_left({
			"diagnostics",
			sources = { "nvim_lsp" },
			sections = { "error", "warn" },
			-- sections = {'error', 'warn', 'info', 'hint'},
			symbols = {
				error = kind.icons.error,
				warn = kind.icons.warn,
				info = kind.icons.info,
				hint = kind.icons.hint,
			},
			-- cond = conditions.hide_in_width,
			colored = false,
			color = {},
			always_visible = true,
			padding = { left = 2, right = 2 },
		})
	end
	ins_left({
		-- mode component
		function()
			return mode()
		end,
		color = {},
		padding = { left = 0, right = 0 },
		always_visible = true,
		-- left_padding = 1,
	})
	ins_left({
		function()
			local utils = require("lvim.core.lualine.utils")
			if vim.bo.filetype == "python" then
				local venv = os.getenv("CONDA_DEFAULT_ENV")
				if venv then
					return string.format("  (%s)", utils.env_cleanup(venv))
				end
				venv = os.getenv("VIRTUAL_ENV")
				if venv then
					return string.format("  (%s)", utils.env_cleanup(venv))
				end
				return ""
			end
			return ""
		end,
		color = {},
		cond = conditions.hide_in_width,
	})

	ins_left({
		provider = function()
			return testing()
		end,
		enabled = function()
			return testing() ~= nil
		end,
		hl = {
			fg = colors.fg,
		},
		left_sep = " ",
		right_sep = {
			str = " |",
			hl = { fg = colors.fg },
		},
	})

	ins_left({
		provider = function()
			if vim.g.using_persistence then
				return "  |"
			elseif vim.g.using_persistence == false then
				return "  |"
			end
		end,
		enabled = function()
			return using_session()
		end,
		hl = {
			fg = colors.fg,
		},
	})

	ins_left({
		lsp_progress,
		cond = conditions.hide_small,
		color = {},
	})

	-- Insert mid section. You can make any number of sections in neovim :)
	-- for lualine it's any number greater then 2
	ins_left({
		function()
			return "%="
		end,
	})

	ins_right({
		function()
			if not vim.bo.readonly or not vim.bo.modifiable then
				return ""
			end
			return "" -- """
		end,
		color = {},
	})

	ins_right({
		"diff",
		source = diff_source,
		symbols = { added = " ", modified = "柳", removed = " " },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.yellow },
			removed = { fg = colors.red },
		},
		color = {},
		cond = nil,
	})
	ins_right({
		function()
			if next(vim.treesitter.highlighter.active) then
				return "  "
			end
			return ""
		end,
		padding = 0,
		color = { fg = colors.green },
		cond = conditions.hide_in_width,
	})

	ins_right({
		function()
			return "Spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
		end,
		always_visible = true,
		color = {},
	})


	ins_right({
		"encoding",
		cond = conditions.hide_in_width,
		color = {},
	})

	ins_right({
		"filetype",
		cond = conditions.hide_in_width,
		color = {},
		icon = "",
	})

	ins_right({
		"location",
		padding = 0,
		color = { fg = colors.yellow },
	})

	ins_right({
		function()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end,
		padding = 1,
		color = { fg = colors.yellow },
		cond = nil,
	})

	-- Now don't forget to initialize lualine
	lvim.builtin.lualine.options = config.options
	lvim.builtin.lualine.sections = config.sections
	lvim.builtin.lualine.inactive_sections = config.inactive_sections
end

return M
