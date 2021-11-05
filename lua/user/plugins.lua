---@diagnostic disable: duplicate-index
local M ={}

M.config = function ()
lvim.plugins={
    {
      "abzcoding/tokyonight.nvim",
      branch = "feature/vim-diagnostics",
      config = function()
        require("user.theme").tokyonight()
        vim.cmd [[
      colorscheme tokyonight
      ]]
      end,
      cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 0 and _time.hour < 5) or (_time.hour >= 11 and _time.hour < 17)
      end,
    },
    {
      "abzcoding/zephyr-nvim",
      config = function()
        vim.cmd [[
       colorscheme zephyr
       ]]
      end,
      cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 5 and _time.hour < 8)
      end,
    },
    {
      "Pocco81/Catppuccino.nvim",
      config = function()
        require("user.theme").catppuccino()
      end,
      cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 8 and _time.hour < 11)
      end,
    },
    {
      "abzcoding/doom-one.nvim",
      branch = "feat/nvim-cmp-floating",
      config = function()
        require("user.theme").doom()
        vim.cmd [[
      colorscheme doom-one
      ]]
      end,
      cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 17 and _time.hour < 21)
      end,
    },
    {
      "olimorris/onedarkpro.nvim"
    },
    {
      "ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"},
    },
    {
      "rhysd/accelerated-jk"
    },

    {
    "tpope/vim-surround",
    keys = {"c","d","y"},
    },

    --markdown
    {
    'iamcco/markdown-preview.nvim',
    run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = "markdown",
    config = function ()
    vim.g.mkdp_markdown_css = "~/.config/nvim/colorscheme/markdown.css"
    vim.g.mkdp_auto_close =0
    vim.cmd([[
    source ~/.config/lvim/md-snippets.vim
    autocmd BufRead,BufNewFile *.md setlocal spell
    ]])
    end
    },
    {
    "npxbr/glow.nvim",
    ft = {"markdown"},
    },
    {
    "dhruvasagar/vim-table-mode",
    ft = "markdown"
    },

    --run
    {
      'skywind3000/asyncrun.vim'
    },
    {
      'skywind3000/asynctasks.vim',
      config = function ()
      vim.g.asynctasks_term_pos = 'bottom'
      vim.g.asynctasks_term_cols = 60
      vim.g.asynctasks_term_rows= 12
      vim.g.asyncrun_open = 6
      vim.g.asynctasks_system = 'macos'
      end
    },
    {
      "voldikss/vim-floaterm",
      config = function ()
        vim.g.floaterm_width=0.7
        vim.g.floaterm_height=0.8
        vim.g.floaterm_title=""
        vim.g.floaterm_borderchars   = {'─','│','─','│','╭','╮','╯','╰'}
      end
    },

    --search file
    {
    'phaazon/hop.nvim',
    as = 'hop',
    cmd = {
           "HopWord",
           "HopLine",
           "HopChar1",
           "HopChar2",
           "HopPattern",
        },
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup {
      keys = 'etovxqpdygfblzhckisuran'
    }
    end
    },

    --orgmode.nvim
    {
    'kristijanhusak/orgmode.nvim',
    ft = {'org'},
    branch = "tree-sitter",
    config = function()
    require('orgmode').setup(require("user.orgmode_config"))
    end,
    disable = not lvim.builtin.orgmode.active,
	  },
    {
    "akinsho/org-bullets.nvim",
    ft = {'org'},
    config = function()
    require("org-bullets").setup {
---@diagnostic disable-next-line: duplicate-index
      symbols = { "◉", "○", "✸", "✿" },
      -- or a function that receives the defaults and returns a list
      symbols = function(default_list)
        table.insert(default_list, "♥")
        return default_list
      end
      }
    end
    },
    {
    'lukas-reineke/headlines.nvim',
    ft = {'org'},
    config = function()
      vim.cmd [[highlight Headline1 guibg=#1e2718]]
      vim.cmd [[highlight Headline2 guibg=#21262d]]
      vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
      vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]
      vim.fn.sign_define("Headline1", { linehl = "Headline1" })
      vim.fn.sign_define("Headline2",  { linehl = "Headline2" })
      require('headlines').setup{
        org = {
        headline_signs = { "Headline1", "Headline2" },
        },
        }
    end,
    --disable = true,
    },
    --Startup time
    {
	  "dstein64/vim-startuptime",
    opt =true,
    cmd = "Startuptime",
    },

    --Vista.vim
   {
   'liuchengxu/vista.vim',
    cmd = "Vista",
    ft = {'markdown','go','php','python','c','cpp','lua','java','vim'},
    config = function()
    vim.g.vista_default_executive = "nvim_lsp"
  end
   },
   --indent_blankline
   {
      "lukas-reineke/indent-blankline.nvim",
      setup = function()
        require("user.indent_blankline").setup()
      end,
      event = "BufRead",
    },
    --colorizer
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.colorizer").config()
      end,
    },
    --todo-comments
    {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup()
      end,
      event = "BufRead",
    },
    --ts-rainbow
    {
    'p00f/nvim-ts-rainbow',
    after = "nvim-treesitter",
    },
    --ranger
    {
      'kevinhwang91/rnvimr',
      cmd = "RnvimrToggle",
      config = function ()
      -- vim.g.rnvimr_ex_enable = 1
      -- Make Ranger replace netrw and be the file explorer
      vim.g.rnvimr_draw_border = 1
      --Make Ranger to be hidden after picking a file
      --vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
      vim.api.nvim_set_keymap("n", "<leader>tr", ":RnvimrToggle<CR>", { noremap = true, silent = true })
      --vim.api.nvim_set_keymap("t", "<C-a>", ":RnvimrResize", { noremap = true, silent = true })
      end
    },
    --smartim
    {
      'ybian/smartim',
      event = {"InsertEnter"},
      --cmd = {"helloworld"},
      config = function ()
        vim.g.smartim_default = 'com.apple.keylayout.ABC'
      end,
    },
    --trouble
    {
      "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    --lsp_signature
    {
      "ray-x/lsp_signature.nvim",
      --event = "BufRead",
      config = function()
        require("user.lsp_signature").config()
      end,
    },
    --Emmet-vim
    {
      "mattn/emmet-vim",
      ft = {"html","css","php","jsp","markdown"},
      config = function ()
        vim.cmd([[
        source ~/.config/lvim/html-snippets.vim
        autocmd BufRead,BufNewFile *.md setlocal spell
        ]])
      end
    },
    {
    "Pocco81/AutoSave.nvim",
    config = function()
      require("autosave").setup()
    end,
    disable = not lvim.builtin.autosave.active,
    },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
    require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
          hide_cursor = true,          -- Hide cursor while scrolling
          stop_eof = true,             -- Stop at <EOF> when scrolling downwards
          use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
          respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil,        -- Default easing function
          pre_hook = nil,              -- Function to run before the scrolling animation starts
          post_hook = nil,              -- Function to run after the scrolling animation ends
          })
    end
  },
  {
    "Leiyi548/ZFVimIM",
    --after = "ZFVimJob",
    disable = not lvim.builtin.ZFvim.active,
    config = function ()
        vim.cmd[[
        let g:ZFVimIM_cloudAsync_outputTo = {}
        ]]
    end
  },
  {
    'ZSaberLv0/ZFVimJob',
    --event = "InsertEnter",
    disable = not lvim.builtin.ZFvim.active,
  },
  {
    'Leiyi548/ZFVimIM_openfly',
    --event = "InsertEnter",
    disable = not lvim.builtin.ZFvim.active,
  },
  {
    'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup()
    end
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("user.dashboard").config()
    end,
    --disable = not lvim.builtin.fancy_dashboard.active,
  },
  -- {
  --     "simrat39/symbols-outline.nvim",
  --     config = function()
  --       vim.g.symbols_outline.auto_preview = false
  --     end,
  --     cmd = "SymbolsOutline",
  -- },
  {
    "machakann/vim-sandwich",

  },
  {
      "danymat/neogen",
      config = function()
        require("neogen").setup {
          enabled = true,
        }
      end,
      ft = { "lua", "python", "javascript", "typescriptreact", "c", "cpp", "go" },
      event = "InsertEnter",
      requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    'junegunn/vim-easy-align',
    disable = not lvim.builtin.easy_align.active,
  },
  -- {
  --     'tami5/lspsaga.nvim',
  --     branch = 'nvim51'
  -- },
  {
    "lukas-reineke/cmp-under-comparator",
  },
  {
    "chentau/marks.nvim",
    keys ={"m"},
    config = function ()
      require("user.mark")
    end
  },
  {
    'prettier/vim-prettier',
    ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'},
    disable = "true",
  },
  {
    'mbbill/undotree',
	  cmd = {"UndotreeToggle"},
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    before = "nvim-treesitter",
  },
  {
    'romgrk/nvim-treesitter-context',
    after = "nvim-treesitter",
  },
  {
	'itchyny/vim-cursorword',
	event = {"BufReadPre","BufNewFile"},
  },
  {
  'hrsh7th/cmp-calc',
  requires = "hrsh7th/nvim-cmp",
  --event = {"InsertEnter"},
  },
  -- {
  -- 'f3fora/cmp-spell',
  -- --event = {"InsertEnter"},
  -- requires = "hrsh7th/nvim-cmp",
  -- config = function ()
  --   vim.opt.spell = true
  --   vim.opt.spelllang = { 'en_us'}
  -- end,
  -- disable = true,
  -- },
  {
    'andersevenrud/compe-tmux',
    branch = "cmp"
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'},
  },
}
end
return M
