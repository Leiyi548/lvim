local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local make_entry = require('telescope.make_entry')
local conf =  require('telescope.config').values

local notes_list = function ()
  -- 目前用ranger打开更好体验
  -- local dir = "~/Nutstore\\ Files/我的坚果云/markdown/"
   local list = {}
  --打开文件夹
  -- local p = io.popen('rg --files --hidden '..dir)
  -- for file in p:lines()do
  --   table.insert(list,file)
  -- end
  local nvim_conf = io.popen('rg --files --hidden ~/Dropbox/Orgzly')
  for file in nvim_conf:lines() do
    table.insert(list,file)
  end
  return list
end

local notes = function (opts)
  local results = notes_list()

  pickers.new(opts,{
    prompt_title = "Find in notes",
    results_title = 'My notes',
    finder = finders.new_table {
      results = results,
      entry_maker = make_entry.gen_from_file(opts),
    },
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts)
  }):find()
end

return require("telescope").register_extension({
exports = {
    notes = notes
  }
})
