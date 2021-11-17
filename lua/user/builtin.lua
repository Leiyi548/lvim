local M = {}

M.config = function()

  -- Lualine
  --lvim.builtin.lualine.options.theme='gruvbox-material'
  -- local _time = os.date "*t"
  -- if _time<16  then
  --  lvim.builtin.lualine.options.theme ="Tomorrow"
  -- end
  lvim.builtin.lualine.style = "default"
  -- CMP
--require('lualine').setup {options = {theme = gruvbox}}
  -- local vscode = require("lualine.themes.vscode")
  -- vscode.insert_b = { fg = vscode.insert.a.bg, gui= "bold"}

  -- =========================================
  lvim.builtin.cmp.sources = {
    { name = "nvim_lsp" },
    --{ name = "cmp_tabnine", max_item_count = 3 },
    { name = "buffer", max_item_count = 10, keyword_length = 5 },
    { name = "path", max_item_count = 5 },
    { name = "luasnip", max_item_count = 3  },
    { name = "nvim_lua" },
    { name = "calc" },
    { name = "emoji" },
    { name = "tmux",max_item_count = 3},
    { name = "treesitter" },
    { name = "crates" },
    { name = "spell", max_item_count = 3},
    { name = 'cmp_tabnine' },
    { name = "orgmode"},
  }
  lvim.builtin.cmp.documentation.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
  lvim.builtin.cmp.experimental = {
    ghost_text = true,
    native_menu = false,
    custom_menu = true,
  }
  lvim.builtin.cmp.formatting.kind_icons = require("user.lsp_kind").symbols()
  lvim.builtin.cmp.formatting.source_names = {
    buffer = "(Buffer)",
    nvim_lsp = "(LSP)",
    luasnip = "(LuaSnip)",
    org = "(org)",
    treesitter = " ",
    nvim_lua = "(NvLua)",
    spell = " 暈",
    emoji = "  ",
    path = "  ",
    calc = "  ",
    cmp_tabnine = "  ",
    tmux = "(tmux)",
  }

  -- LSP
  -- =========================================
  -- icon                       既           
  lvim.lsp.diagnostics.signs.values = {
    { name = "LspDiagnosticsSignError", text = " " },
    { name = "LspDiagnosticsSignWarning", text = " " },
    { name = "LspDiagnosticsSignHint", text = "" },
    { name = "LspDiagnosticsSignInformation", text = "" },
  }


  --Comment.nvim
  -- =========================================
  lvim.builtin.comment.mappings.extra = true
  --Project
  -- =========================================
  lvim.builtin.project.active = true

  lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } } -- treesitter is buggy :(
  lvim.builtin.treesitter.matchup.enable = true
  --treesitter
  lvim.builtin.treesitter.textsubjects = { enable = true }
  lvim.builtin.treesitter.playground = { enable = true }
  lvim.builtin.treesitter.context_commentstring = { enable = true }
  lvim.builtin.treesitter.highlight = { enable = true,additional_vim_regex_highlighting = {'org'} }
  lvim.builtin.treesitter.autotag = { enable = true }
  lvim.builtin.treesitter.playground = { enable = true }
  lvim.builtin.treesitter.rainbow = { enable = true }
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
      url = 'https://github.com/milisims/tree-sitter-org',
      revision = 'main',
      files = {'src/parser.c', 'src/scanner.cc'},
    },
    filetype = 'org',
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

  --Telescope
  -- =========================================
  -- lvim.builtin.telescope.defaults.path_display = { "smart", "absolute", "truncate" }
  -- icon                       既            
  lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
  lvim.builtin.telescope.defaults.winblend = 6
  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  --lvim.builtin.telescope.defaults.selection_caret = " "
  --lvim.builtin.telescope.defaults.selection_caret = ""
  lvim.builtin.telescope.defaults.selection_caret = ""
  lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "vendor/*",
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
  }
  --lvim.builtin.telescope.defaults.layout_config = require("user.telescope").layout_config()
  lvim.builtin.telescope.defaults.mappings = {
    i = {
      --["<esc>"] = require("telescope.actions").close,
      ["<C-y>"] = require("telescope.actions").which_key,
    },
  }
  local telescope_actions = require "telescope.actions.set"
  lvim.builtin.telescope.defaults.pickers.find_files = {
  attach_mappings = function(_)
      telescope_actions.select:enhance {
        post = function()
          vim.cmd ":normal! zx"
        end,
      }
      return true
    end,
  find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
  }
  require("telescope").load_extension('dotfiles')
  require("telescope").load_extension('emoji')
  require("telescope").load_extension('file_create')
  --Terminal
  -- =========================================
  lvim.builtin.terminal.active = true
  --using lazygit
  lvim.builtin.terminal.execs = {
    { "lazygit", "gg", "LazyGit" },
  }
  --WhichKey
  -- =========================================
  lvim.builtin.which_key.setup.triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = {"j","k",";"},
    v = {"j","k",";"}
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
