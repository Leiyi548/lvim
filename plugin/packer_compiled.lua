-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/macos/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/macos/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/macos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/macos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/macos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Catppuccino.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\16catppuccino\15user.theme\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/Catppuccino.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/LuaSnip"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/Navigator.nvim"
  },
  ZFVimIM = {
    after = { "ZFVimIM_openfly" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/ZFVimIM"
  },
  ZFVimIM_openfly = {
    load_after = {
      ZFVimIM = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/ZFVimIM_openfly"
  },
  ZFVimJob = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/ZFVimJob"
  },
  ["accelerated-jk"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/accelerated-jk"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19user.dashboard\frequire\0" },
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/alpha-nvim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    config = { "\27LJ\2\n�\1\0\0\2\0\t\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1<\0=\1\4\0006\0\0\0009\0\1\0)\1\f\0=\1\5\0006\0\0\0009\0\1\0)\1\6\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\nmacos\22asynctasks_system\18asyncrun_open\25asynctasks_term_rows\25asynctasks_term_cols\vbottom\24asynctasks_term_pos\6g\bvim\0" },
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/asynctasks.vim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/cmp-under-comparator"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/cmp_luasnip"
  },
  ["doom-one.nvim"] = {
    config = { "\27LJ\2\nq\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0&      colorscheme doom-one\n      \bcmd\bvim\tdoom\15user.theme\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/doom-one.nvim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/emmet-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/glow.nvim"
  },
  hop = {
    commands = { "HopWord", "HopLine", "HopChar1", "HopChar2", "HopPattern" },
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/hop"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\23user.lsp_signature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.lualine\frequire\0" },
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0f    source ~/.config/nvim/md-snippets.vim\n    autocmd BufRead,BufNewFile *.md setlocal spell\n    \bcmd\20mkdp_auto_close,~/.config/nvim/colorscheme/markdown.css\22mkdp_markdown_css\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  neogen = {
    config = { "\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\vneogen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/neogen"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\5\22respect_scrolloff\1\24use_local_scrolloff\1\rstop_eof\2\16hide_cursor\2\25cursor_scrolls_alone\2\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/neoscroll.nvim"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19user.colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.nvimtree\frequire\0" },
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-rainbow" },
    loaded = true,
    only_config = true
  },
  ["nvim-ts-rainbow"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedarkpro.nvim"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/onedarkpro.nvim"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.project\frequire\0" },
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/project.nvim"
  },
  rnvimr = {
    commands = { "RnvimrToggle" },
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vrnvimr\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/rnvimr"
  },
  smartim = {
    config = { "\27LJ\2\nI\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\28com.apple.keylayout.ABC\20smartim_default\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/smartim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.telescope\frequire\0" },
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.terminal\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\ny\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0(      colorscheme tokyonight\n      \bcmd\bvim\15tokyonight\15user.theme\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/trouble.nvim"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-startuptime"] = {
    commands = { "Startuptime" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/vim-startuptime"
  },
  ["vim-surround"] = {
    keys = { { "", "c" }, { "", "d" }, { "", "y" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/vim-table-mode"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    config = { "\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim"
  },
  ["zephyr-nvim"] = {
    config = { "\27LJ\2\nE\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0&       colorscheme zephyr\n       \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/macos/.local/share/lunarvim/site/pack/packer/opt/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26user.indent_blankline\frequire\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: asynctasks.vim
time([[Config for asynctasks.vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\t\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1<\0=\1\4\0006\0\0\0009\0\1\0)\1\f\0=\1\5\0006\0\0\0009\0\1\0)\1\6\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\nmacos\22asynctasks_system\18asyncrun_open\25asynctasks_term_rows\25asynctasks_term_cols\vbottom\24asynctasks_term_pos\6g\bvim\0", "config", "asynctasks.vim")
time([[Config for asynctasks.vim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rcore.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19user.dashboard\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Conditional loads
time("Condition for { 'zephyr-nvim' }", true)
if
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\0166\0\0\0009\0\1\0'\2\2\0B\0\2\0029\1\3\0)\2\5\0\3\2\1\0X\1\4�9\1\3\0)\2\b\0\0\1\2\0X\1\2�+\1\1\0X\2\1�+\1\2\0L\1\2\0\thour\a*t\tdate\aos\0", "condition", '{ "zephyr-nvim" }')
then
time("Condition for { 'zephyr-nvim' }", false)
time([[packadd for zephyr-nvim]], true)
		require("packer.load")({"zephyr-nvim"}, {}, _G.packer_plugins)
	time([[packadd for zephyr-nvim]], false)
	-- Config for: zephyr-nvim
	time([[Config for zephyr-nvim]], true)
	try_loadstring("\27LJ\2\nE\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0&       colorscheme zephyr\n       \bcmd\bvim\0", "config", "zephyr-nvim")
	time([[Config for zephyr-nvim]], false)
else
time("Condition for { 'zephyr-nvim' }", false)
end
time("Condition for { 'doom-one.nvim' }", true)
if
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\0166\0\0\0009\0\1\0'\2\2\0B\0\2\0029\1\3\0)\2\17\0\3\2\1\0X\1\4�9\1\3\0)\2\21\0\0\1\2\0X\1\2�+\1\1\0X\2\1�+\1\2\0L\1\2\0\thour\a*t\tdate\aos\0", "condition", '{ "doom-one.nvim" }')
then
time("Condition for { 'doom-one.nvim' }", false)
time([[packadd for doom-one.nvim]], true)
		require("packer.load")({"doom-one.nvim"}, {}, _G.packer_plugins)
	time([[packadd for doom-one.nvim]], false)
	-- Config for: doom-one.nvim
	time([[Config for doom-one.nvim]], true)
	try_loadstring("\27LJ\2\nq\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0&      colorscheme doom-one\n      \bcmd\bvim\tdoom\15user.theme\frequire\0", "config", "doom-one.nvim")
	time([[Config for doom-one.nvim]], false)
else
time("Condition for { 'doom-one.nvim' }", false)
end
time("Condition for { 'tokyonight.nvim' }", true)
if
try_loadstring("\27LJ\2\nw\0\0\3\0\4\0\0246\0\0\0009\0\1\0'\2\2\0B\0\2\0029\1\3\0)\2\0\0\3\2\1\0X\1\4�9\1\3\0)\2\5\0\0\1\2\0X\1\n�9\1\3\0)\2\v\0\3\2\1\0X\1\4�9\1\3\0)\2\17\0\0\1\2\0X\1\2�+\1\1\0X\2\1�+\1\2\0L\1\2\0\thour\a*t\tdate\aos\0", "condition", '{ "tokyonight.nvim" }')
then
time("Condition for { 'tokyonight.nvim' }", false)
time([[packadd for tokyonight.nvim]], true)
		require("packer.load")({"tokyonight.nvim"}, {}, _G.packer_plugins)
	time([[packadd for tokyonight.nvim]], false)
	-- Config for: tokyonight.nvim
	time([[Config for tokyonight.nvim]], true)
	try_loadstring("\27LJ\2\ny\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0(      colorscheme tokyonight\n      \bcmd\bvim\15tokyonight\15user.theme\frequire\0", "config", "tokyonight.nvim")
	time([[Config for tokyonight.nvim]], false)
else
time("Condition for { 'tokyonight.nvim' }", false)
end
time("Condition for { 'Catppuccino.nvim' }", true)
if
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\0166\0\0\0009\0\1\0'\2\2\0B\0\2\0029\1\3\0)\2\b\0\3\2\1\0X\1\4�9\1\3\0)\2\v\0\0\1\2\0X\1\2�+\1\1\0X\2\1�+\1\2\0L\1\2\0\thour\a*t\tdate\aos\0", "condition", '{ "Catppuccino.nvim" }')
then
time("Condition for { 'Catppuccino.nvim' }", false)
time([[packadd for Catppuccino.nvim]], true)
		require("packer.load")({"Catppuccino.nvim"}, {}, _G.packer_plugins)
	time([[packadd for Catppuccino.nvim]], false)
	-- Config for: Catppuccino.nvim
	time([[Config for Catppuccino.nvim]], true)
	try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\16catppuccino\15user.theme\frequire\0", "config", "Catppuccino.nvim")
	time([[Config for Catppuccino.nvim]], false)
else
time("Condition for { 'Catppuccino.nvim' }", false)
end
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-ts-rainbow ]]
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.autopairs\frequire\0", "config", "nvim-autopairs")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopLine lua require("packer.load")({'hop'}, { cmd = "HopLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopChar1 lua require("packer.load")({'hop'}, { cmd = "HopChar1", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopChar2 lua require("packer.load")({'hop'}, { cmd = "HopChar2", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopPattern lua require("packer.load")({'hop'}, { cmd = "HopPattern", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Vista lua require("packer.load")({'vista.vim'}, { cmd = "Vista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Startuptime lua require("packer.load")({'vim-startuptime'}, { cmd = "Startuptime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RnvimrToggle lua require("packer.load")({'rnvimr'}, { cmd = "RnvimrToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> c <cmd>lua require("packer.load")({'vim-surround'}, { keys = "c", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> y <cmd>lua require("packer.load")({'vim-surround'}, { keys = "y", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> d <cmd>lua require("packer.load")({'vim-surround'}, { keys = "d", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'vista.vim', 'neogen'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vista.vim', 'emmet-vim', 'markdown-preview.nvim', 'glow.nvim', 'vim-table-mode'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'vista.vim', 'neogen'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'neogen'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'vista.vim', 'neogen'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsp ++once lua require("packer.load")({'emmet-vim'}, { ft = "jsp" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'vista.vim', 'neogen'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet-vim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType org ++once lua require("packer.load")({'orgmode.nvim'}, { ft = "org" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vista.vim', 'neogen'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'neogen'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'vista.vim'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'vista.vim'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'vista.vim', 'emmet-vim'}, { ft = "php" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-comment', 'todo-comments.nvim', 'lsp_signature.nvim', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au WinScrolled * ++once lua require("packer.load")({'neoscroll.nvim'}, { event = "WinScrolled *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'smartim', 'ZFVimJob', 'neogen', 'ZFVimIM'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'toggleterm.nvim', 'which-key.nvim', 'barbar.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/macos/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]], true)
vim.cmd [[source /Users/macos/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]]
time([[Sourcing ftdetect script at: /Users/macos/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]], false)
time([[Sourcing ftdetect script at: /Users/macos/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]], true)
vim.cmd [[source /Users/macos/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]]
time([[Sourcing ftdetect script at: /Users/macos/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
