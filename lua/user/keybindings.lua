local M={}

--local actions = require "user.actions"
M.config = function()
   -- INFO:basic setting
   vim.opt.relativenumber = true
   vim.opt.cmdheight = 1
   vim.opt.timeoutlen = 500
   vim.opt.encoding = "utf-8"
   vim.opt.clipboard = ""
   --vim.opt.showmode = true

   --vim.opt.clipboard = nil

   --基与treesitter的代码折叠
   vim.o.foldmethod = "expr"
   vim.o.foldexpr = "nvim_treesitter#foldexpr()" --为每行折叠的设置等级
   vim.o.foldlevel = 4 --设置折叠等级高于4 就会关闭这个折叠片段
   vim.o.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
   vim.o.foldnestmax = 3 --设置“缩进”和“语法”的最大折叠嵌套方法。这样可以避免创建过多的折叠。使用更多大于20不起作用，因为内部限制为20。
   vim.o.foldminlines = 1 --设置可以显示折叠的屏幕行数 关闭也适用于手动闭合的折叠。默认值为 只有在占用两条或多条屏幕线时，才能关闭一个折叠。 设置为零可以关闭一条屏幕线的折叠。 请注意，这仅对显示内容产生影响。使用后 “zc”关闭折叠，因为折叠较小，所以显示为打开 除了“折叠线”，后面的“zc”可以关闭包含折叠的部分。
   vim.g.dashboard_disable_statusline = 1
   -- FIX: delete H L to move buffer
   lvim.builtin.bufferline.keymap={
     normal_mode = {
       ["<S-h>"] = nil;
       ["<S-l>"] = nil;
    }
  }
   --leader key
   lvim.leader = "space"
   -- INFO: add your own keymapping
   -- INFO: normal_mode
   lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
   lvim.keys.normal_mode["<Tab>"] = ":BufferNext<cr>"
   lvim.keys.normal_mode["<S-Tab>"] = ":BufferPrevious<cr>"
   lvim.keys.normal_mode["Q"]=":qa!<cr>"
   --lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"
   lvim.keys.normal_mode["<S-h>"] = "0"
   lvim.keys.normal_mode["<S-l>"] = "$"
   lvim.keys.normal_mode["<leader>sc"] = "<cmd>nohlsearch<cr>"
   lvim.keys.normal_mode["<leader>wv"] = "<cmd>vsplit<cr>"
   lvim.keys.normal_mode["<leader>ws"] = "<cmd>split<cr>"
   lvim.keys.normal_mode["<leader>wd"] = "<C-w>c"
   lvim.keys.normal_mode["<leader>wh"] = "<C-w>h"
   lvim.keys.normal_mode["<leader>wj"] = "<C-w>j"
   lvim.keys.normal_mode["<leader>wk"] = "<C-w>k"
   lvim.keys.normal_mode["<leader>wl"] = "<C-w>l"
   -- nice N and n navigation
   lvim.keys.normal_mode["n"] = "nzzzv"
   lvim.keys.normal_mode["N"] = "Nzzzv"
   -- nice J
   lvim.keys.normal_mode["J"] = "mzJ`zmdz"
   -- better indent
   lvim.keys.normal_mode["<"] = "<<"
   lvim.keys.normal_mode[">"] = ">>"
   -- easymotion(hop)
   lvim.keys.normal_mode["ss"] = "<cmd>HopChar2<cr>"
   lvim.keys.visual_mode["ss"] = "<cmd>HopChar2<cr>"
   -- quickly replace
   -- 一口气这是替换全部
   lvim.keys.normal_mode["<leader>rr"] = ":%s///g<Left><Left>"
   -- 依次进行替换并进行询问
   lvim.keys.normal_mode["<leader>rc"] = ":%s///gc<Left><Left><Left>"
   -- lvim.keys.normal_mode["s*"] = ":let @/='\<'.expand('<cword>').'\>'<CR>cgn"
   -- lvim.keys.visual_block_mode["s*"] = ":let @/='\<'.expand('<cword>').'\>'<CR>cgn"
   --先点击* 选中需要替换的代码快后在 visual模式下进行替换
   lvim.keys.visual_block_mode["<leader>rr"] = ":s///g<Left><Left>"
   lvim.keys.visual_block_mode["<leader>rc"] = ":s///gc<Left><Left><Left>"

   --lvim.keys.normal_mode["<C-s>"] = actions.save_colorscheme
   -- INFO: visula_mode
   lvim.keys.visual_mode["H"] = "0"
   lvim.keys.visual_mode["L"] = "$"
   -- FIX: delete jk to escape
   lvim.keys.insert_mode["jk"] = nil
   lvim.keys.insert_mode["kj"] = nil
   lvim.keys.insert_mode["jj"] = nil
    -- INFO:quickcopy
   lvim.keys.normal_mode["Y"] = "y$"
   lvim.keys.normal_mode["<leader>Y"] = 'gg"+yG'
   lvim.keys.normal_mode["<leader>y"] = '"+y'
   lvim.keys.visual_mode["<leader>y"] = '"+y'
   lvim.keys.normal_mode["<leader>yy"] = '"+yy'
   lvim.keys.normal_mode["<leader>p"] = '"+p"'
   lvim.keys.visual_mode["<leader>p"] = '"+p'

   --Luasnip
   vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
   vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
   --IntelliTab
   -- lvim.keys.insert_mode["<Tab>"] = "<CMD>lua require('intellitab').indent<cr>"
   -- X closes a buffer
   lvim.keys.normal_mode["<S-x>"] = ":bdelete!<cr>"
   -- accelerated-jk
   -- vim.api.nvim_set_keymap('n','j','<Plug>(accelerated_jk_gj)',{ silent=true })
   -- vim.api.nvim_set_keymap('n','k','<Plug>(accelerated_jk_gk)',{ silent=true })
   -- vim-easy-align
   --vim.api.nvim_set_keymap('n','ga','<Plug>(EasyAlign)',{ silent=true })
   --vim.api.nvim_set_keymap('x','ga','<Plug>(EasyAlign)',{ silent=true })
   -- run 保持终端
   vim.api.nvim_set_keymap('t','<Esc>',"<C-\\><C-n>",{silent=true})
   --lspsaga
   --lvim.keys.normal_mode["<leader>ca"] = "<CMD>lua require('lspsaga.codeaction').code_action()<cr>"
   -- lvim.keys.normal_mode["<leader>rn"] = "<CMD>lua require('lspsaga.rename').rename()<cr>"
   --lvim.keys.normal_mode["gp"] = "<cmd>lua require'lspsaga.provider'.preview_definition()<cr>"
   --lvim.keys.normal_mode["K"] = "<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>"
   -- lvim.keys.normal_mode["<C-f>"] = "<CMD>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>"
   -- lvim.keys.normal_mode["<C-b>"] = "<CMD>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>"
   --tmux navigation
   lvim.keys.normal_mode["<C-h>"] = "<CMD>lua require('Navigator').left()<cr>";
   lvim.keys.normal_mode["<C-j>"] = "<CMD>lua require('Navigator').down()<cr>"
   lvim.keys.normal_mode["<C-k>"] = "<CMD>lua require('Navigator').up()<cr>"
   lvim.keys.normal_mode["<C-l>"] = "<CMD>lua require('Navigator').right()<cr>"
   lvim.keys.visual_mode["<C-h>"] = "<CMD>lua require('Navigator').left()<cr>";
   lvim.keys.visual_mode["<C-j>"] = "<CMD>lua require('Navigator').down()<cr>"
   lvim.keys.visual_mode["<C-k>"] = "<CMD>lua require('Navigator').up()<cr>"
   lvim.keys.visual_mode["<C-l>"] = "<CMD>lua require('Navigator').right()<cr>"
   --whichkey
   lvim.builtin.which_key.vmappings = {
      s = {
        name = "Search",
        c = {name="clear-search-result"},
        p = { "<cmd>HopPattern<cr>", "search like /" },
	      --s = { "<cmd>HopChar2<cr>","search by char2" },
        s = { "<cmd>HopChar1<cr>","search by char1" },
        w = { "<cmd>HopWord<cr>", "search word" },
	      l = { "<cmd>HopLine<cr>","search line" },
      },
      y = {name = "CopyClipboard"},
      p = {name = "Paste"}
  }
   lvim.builtin.which_key.mappings = {
      --["q"] = { "<cmd>q!<cr>", "Quit" },
      --["/"] = { "<cmd>lua require('Comment').toggle()<cr>", "Comment" },
      --["f"] = { "<cmd>Telescope find_files<cr>", "Find File" },
      --["h"] = { "<cmd>nohlsearch<cr>", "No Highlight" },
      --Whichkey-b
  --lvim.builtin.which_key.mappings[";"] = { "<cmd>Dashboard<cr>", "Dashboard" }
      [";"] = { "<cmd>Alpha<cr>","Dashboard"},
      --[";"] = { ':lua NTGlobal["terminal"]:toggle()<cr>',"Vscodeterm" },
  --lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }
      ["e"] = { "<cmd>NvimTreeToggle<cr>","Explorer"},
      ["c"] = { "<cmd>BufferClose!<cr>", "Close Buffer" },
      ["u"] = { "<cmd>UndotreeToggle<cr>","Undotree"},
      ["o"] = { "<cmd>Vista!!<cr>","Outline"},
      ["Y"] = { "CopyAll"},
      ["y"] = { "CopyClipboard"},
      ["w"] = { "Windows"},
      b = {
        name = "Buffers",
        j = { "<cmd>BufferPick<cr>", "Jump" },
        f = { "<cmd>Telescope buffers<cr>", "Find" },
        b = { "<cmd>b#<cr>", "Previous" },
        w = { "<cmd>BufferWipeout<cr>", "Wipeout" },
        e = {
          "<cmd>BufferCloseAllButCurrent<cr>",
          "Close all but current",
        },
        h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
        l = {
          "<cmd>BufferCloseBuffersRight<cr>",
          "Close all to the right",
        },
        D = {
          "<cmd>BufferOrderByDirectory<cr>",
          "Sort by directory",
        },
        L = {
          "<cmd>BufferOrderByLanguage<cr>",
          "Sort by language",
        },
      },
      --Whichkey-p
      p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        C = { "<cmd>PackerClean<cr>", "Clean" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        r = { "<cmd>lua require('lvim.utils').reload_lv_config()<cr>", "Reload" },
        s = { "<cmd>PackerStatus<cr>", "Status" },
        S = { "<cmd>PackerSync<cr>", "Sync" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      },
      --Whichkey-E
      --Whichkey-t
      t = {
        name = "Terminal",
      },
      --Whichkey-r
      r = {
        name = "Run",
         a = { "<cmd>RnvimrToggle<cr>", "ranger" },
         --a = { "<cmd>FloatermNew ranger<cr>", "ranger" },
         t = { "<cmd>AsyncTask file-run<cr>", "Run on default terminal" },
	       f = { "<cmd>AsyncTask file-run-floaterm<cr>","Run on floaterm" }
      },
      --Whichkey-f
      f = {
        name = "+File",
        --b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
        b = { "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr>","Find buffer"},
        c = { "<cmd>Telescope colorscheme<cr>", "Change colorscheme" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        d = { "<cmd>Telescope dotfiles<cr>", "Find dotfiles" },
        e = { "<cmd>Telescope emoji<cr>", "Find emoji" },
	      f = { "<cmd>Telescope find_files<cr>", "Find File" },
        H = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        n = { "<cmd>enew<cr>", "New File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        m = { "<cmd>Telescope marks<cr>","Marks"},
      },
      --which_key-x
      x = {
        name = "Diagnostics",
        t = { "<cmd>TroubleToggle<cr>", "trouble" },
        w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
        d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
        q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
        l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
        r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
      },
      --Whichkey-g
      g = {
        name = "Git",
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
          "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
          "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        C = {
          "<cmd>Telescope git_bcommits<cr>",
          "Checkout commit(for current file)",
        },
        d = {
          "<cmd>Gitsigns diffthis HEAD<cr>",
          "Git Diff",
        },
      },
      --Whichkey-l
      l = {
        name = "LSP",
        a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
        d = {
          "<cmd>Telescope lsp_document_diagnostics<cr>",
          "Document Diagnostics",
        },
        w = {
          "<cmd>Telescope lsp_workspace_diagnostics<cr>",
          "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        -- j = {
        --   "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
        --   "Next Diagnostic",
        -- },
        -- k = {
        --   "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
        --   "Prev Diagnostic",
        -- },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        p = {
          name = "Peek",
          d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
          t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
          i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
        },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
      },
      --WhichKey-m
      m ={
        name="Markdown",
        p = {"<cmd>MarkdownPreview<cr>","Preview"},
	      g = {"<cmd>Glow<cr>","Glow"},
        r = {"<cmd>TableModeRealign<cr>","Tablealign"},
      },
      --WhichKey-n
      n ={
        name="Neogen",
         c = { "<cmd>lua require('neogen').generate({ type = 'class'})<cr>", "Class Documentation" },
         f = { "<cmd>lua require('neogen').generate({ type = 'func'})<cr>", "Function Documentation" },
      },
      --Whichkey-L
      L = {
        name = "+LunarVim",
        c = {
          "<cmd>edit" .. get_config_dir() .. "/config.lua<cr>",
          "Edit config.lua",
        },
        f = {
          "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
          "Find LunarVim files",
        },
        g = {
          "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
          "Grep LunarVim files",
        },
        k = { "<cmd>lua require('lvim.keymappings').print()<cr>", "View LunarVim's default keymappings" },
        i = {
          "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
          "Toggle LunarVim Info",
        },
        I = {
          "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
          "View LunarVim's changelog",
        },
        l = {
          name = "+logs",
          d = {
            "<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
            "view default log",
          },
          D = {
            "<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
            "Open the default logfile",
          },
          l = { "<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>", "view lsp log" },
          L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
          n = {
            "<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
            "view neovim log",
          },
          N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
          p = {
            "<cmd>lua require('lvim.core.terminal').toggle_log_view('packer.nvim')<cr>",
            "view packer log",
          },
          P = { "<cmd>exe 'edit '.stdpath('cache').'/packer.nvim.log'<cr>", "Open the Packer logfile" },
        },
        r = { "<cmd>lua require('lvim.utils').reload_lv_config()<cr>", "Reload configurations" },
        u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
      },
      --Whichkey-s
      s = {
        name = "Search",
        c = {name="clear-search-result"},
        p = { "<cmd>HopPattern<cr>", "search like /" },
	      --s = { "<cmd>HopChar2<cr>","search by char2" },
        s = { "<cmd>HopChar1<cr>","search by char1" },
        w = { "<cmd>HopWord<cr>", "search word" },
	      l = { "<cmd>HopLine<cr>","search line" },
      },
        T = {
        name = "Treesitter",
        i = { ":TSConfigInfo<cr>", "Info" },
      },
}

end

return M
