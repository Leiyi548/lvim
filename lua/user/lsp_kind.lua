local M = {}

M.cmp_kind_back = {
	Class = " ",
	Color = " ",
	Constant = "",
	Constructor = " ",
	Default = " ",
	Enum = "練",
	EnumMember = " ",
	Event = " ",
	Field = "ﰠ ",
	File = " ",
	Folder = " ",
	Function = " ", --   ƒ
	Interface = " ",
	Keyword = " ",
	Method = " ", -- ƒ
	Module = "", -- "" " "
	Operator = " ",
	Property = " ",
	Reference = "",
	Snippet = " ", -- " "," " ""
	Struct = "פּ",
	Text = " ", -- "" 
	TypeParameter = "  ",
	Unit = "塞",
	Value = " ",
	Variable = " ", -- ""
}

M.cmp_kind = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

M.icons = {
	error = " ", --   
	--warn = " ",
	warn = " ", -- 
	info = "", --   
	hint = " ", -- 
	code_action = "", --   
	test = "",
	docs = "",
	clock = " ",
	calendar = " ",
	buffer = " ",
	settings = " ",
	ls_inactive = "轢",
	ls_active = "歷",
	question = "",
}

M.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
		-- unstaged = "",
		-- staged = "",
		-- unmerged = "",
		-- renamed = "➜",
		-- untracked = "",
		-- deleted = "",
		-- ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		arrow_closed = "",
		arrow_open = "",
		-- default = "",
		-- open = "",
		-- empty = "",
		-- empty_open = "",
		-- symlink = "",
		-- symlink_open = "",
	},
}

M.symbols_outline = {
	File = "",
	Module = "",
	Namespace = "",
	Package = "",
	Class = "",
	Method = " ",
	Property = "",
	Field = "",
	Constructor = "",
	Enum = "練",
	Interface = "ﰮ",
	Function = "", -- 
	Variable = "",
	Constant = "",
	String = "𝓐",
	Number = "#",
	Boolean = "⊨",
	Array = "",
	Object = "⦿",
	Key = "",
	Null = "NULL",
	EnumMember = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "𝙏",
}

M.todo_comments = {
	FIX = "律",
	TODO = " ",
	HACK = " ",
	-- warn = " ",
	WARN = "裂",
	PERF = "龍",
	NOTE = " ",
	ERROR = " ",
	REFS = "",
}

M.numbers = {
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
}

M.file_icons = {
	Brown = { "" },
	Aqua = { "" },
	LightBlue = { "", "" },
	Blue = { "", "", "", "", "", "", "", "", "", "", "", "", "" },
	Darkblue = { "", "" },
	Purple = { "", "", "", "", "" },
	Red = { "", "", "", "", "", "" },
	Beige = { "", "", "" },
	Yellow = { "", "", "λ", "", "" },
	Orange = { "", "" },
	Darkorange = { "", "", "", "", "" },
	Pink = { "", "" },
	Salmon = { "" },
	Green = { "", "", "", "", "", "" },
	Lightgreen = { "", "", "", "﵂" },
	White = { "", "", "", "", "", "" },
}

return M
