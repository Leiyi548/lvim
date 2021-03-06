-- fortune printing (from vim-startify)

-- To add this to the footer, simply add the following lines to the config:
-- use {
--     'goolord/alpha-nvim',
--     config = function ()
--         require'alpha.themes.dashboard'.section.footer.val = require'alpha.fortune'()
--         require'alpha'.setup(require'alpha.themes.dashboard'.opts)
--     end
-- }

local list_extend = vim.list_extend

--- @param line string
--- @param max_width number
--- @return table
local format_line = function(line, max_width)
	if line == "" then
		return { " " }
	end

	local formatted_line = {}

	-- split line by spaces into list of words
	local words = {}
	local target = "%S+"
	for word in line:gmatch(target) do
		table.insert(words, word)
	end

	local bufstart = " "
	local buffer = bufstart
	for i, word in ipairs(words) do
		if (#buffer + #word) <= max_width then
			buffer = buffer .. word .. " "
			if i == #words then
				table.insert(formatted_line, buffer:sub(1, -2))
			end
		else
			table.insert(formatted_line, buffer:sub(1, -2))
			buffer = bufstart .. word .. " "
			if i == #words then
				table.insert(formatted_line, buffer:sub(1, -2))
			end
		end
	end
	-- right-justify text if the line begins with -
	if line:sub(1, 1) == "-" then
		for i, val in ipairs(formatted_line) do
			local space = string.rep(" ", max_width - #val - 2)
			formatted_line[i] = space .. val:sub(2, -1)
		end
	end
	return formatted_line
end

--- @param fortune table
--- @param max_width number
--- @return table
local format_fortune = function(fortune, max_width)
	-- Converts list of strings to one formatted string (with linebreaks)
	local formatted_fortune = { " " } -- adds spacing between alpha-menu and footer
	for _, line in ipairs(fortune) do
		local formatted_line = format_line(line, max_width)
		formatted_fortune = list_extend(formatted_fortune, formatted_line)
	end
	return formatted_fortune
end

local get_fortune = function(fortune_list)
	-- selects an entry from fortune_list randomly
	math.randomseed(os.time())
	local ind = math.random(1, #fortune_list)
	return fortune_list[ind]
end

-- Credit to @mhinz for compiling this list in vim-startify
-- Chinese text
local fortune_list = {
	{
		"????????????????????????????????????????????????",
		"????????????????????????????????????????????????",
		"- ????????????",
	},
	{
		"?????????????????????????????????????????????",
		"?????????????????????????????????????????????",
		"- ??????",
	},
	{
		"???????????????????????????????????????",
		"?????????????????????????????????",
		"- ????????? ",
	},
	{
		"?????????????????????????????????",
		"????????????????????????????????????",
		"????????????????????????",
		"- ????????????",
	},
	{
		"???????????????????????????????????????????????????",
		"????????????????????????????????????????????????",
		"- ????????????",
	},
	{ "????????????????????????????????????", "- ????????????" },
	{ "????????????????????????????????????????????????", "- ????????????" },
	{ "??????????????? ??????????????????", "- ????????????" },
	{ "????????????????????????????????????", "????????????????????????????????????", "- ????????????" },
	{
		"????????????????????????????????????????????????",
		"????????????????????????????????????????????????",
		"- ????????????",
	},
	{
		"????????????????????????????????????",
		"????????????????????????????????????",
		"????????????????????????????????????",
		"- ????????????",
	},
	{ "??????????????????????????????????????????????????? ", "- ????????????" },
  {
    "???????????????,??????????????????",
    "?????????????????????,?????????????????????",
    "?????????????????????,???????????????,??????????????????"
  },
  {
    "????????????????????????????????????????????????",
    "- ??????"
  }
}

--- @return table
--- @param max_width number optional
--- returns an array of strings
local main = function(max_width)
	max_width = max_width or 54
	local fortune = get_fortune(fortune_list)
	local formatted_fortune = format_fortune(fortune, max_width)

	return formatted_fortune
end

return main
