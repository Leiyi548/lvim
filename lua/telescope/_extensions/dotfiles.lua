local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local make_entry = require('telescope.make_entry')
local conf =  require('telescope.config').values

local dotfiles_list = function (opts)
  -- local dir = opts.path or ''
  local list = {}
  --打开文件夹
  -- local p = io.popen('rg --files --hidden'..dir)
  -- for file in p:lines()do
  --   table.insert(list,file)
  -- end
  local nvim_conf = io.popen('rg --files ~/.config/lvim')
  for file in nvim_conf:lines() do
    table.insert(list,file)
  end
  return list
end

local dotfiles = function (opts)
  opts = opts or {}
  local results = dotfiles_list(opts)

  pickers.new(opts,{
    prompt_title = "Find in dotfiles",
    results_title = 'Dotfiles',
    finder = finders.new_table {
      results = results,
      entry_maker = make_entry.gen_from_file(opts),
    },
      layout_strategy = "vertical",
      layout_config = {
      height = 0.3,
      width = 0.5,
      prompt_position = 'top'
      --prompt_position = 'bottom'
    },
    --previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts)
  }):find()
end

return require("telescope").register_extension({
exports = {
    dotfiles = dotfiles
  }
})
