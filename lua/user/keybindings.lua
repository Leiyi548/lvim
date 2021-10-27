local M={}

M.config = function()
   -- INFO:基础设置
   vim.opt.relativenumber = true
   vim.opt.cmdheight = 1
   vim.opt.timeoutlen = 500
   vim.opt.encoding = "utf-8"
   --vim.opt.clipboard = nil

   --基与treesitter的代码折叠
   vim.o.foldmethod = "expr"
   vim.o.foldexpr = "nvim_treesitter#foldexpr()" --为每行折叠的设置等级
   vim.o.foldlevel = 4 --设置折叠等级高于4 就会关闭这个折叠片段
   vim.o.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
   vim.o.foldnestmax = 3 --设置“缩进”和“语法”的最大折叠嵌套方法。这样可以避免创建过多的折叠。使用更多大于20不起作用，因为内部限制为20。
   vim.o.foldminlines = 1 --设置可以显示折叠的屏幕行数 关闭也适用于手动闭合的折叠。默认值为 只有在占用两条或多条屏幕线时，才能关闭一个折叠。 设置为零可以关闭一条屏幕线的折叠。 请注意，这仅对显示内容产生影响。使用后 “zc”关闭折叠，因为折叠较小，所以显示为打开 除了“折叠线”，后面的“zc”可以关闭包含折叠的部分。
   vim.g.dashboard_disable_statusline = 1


   lvim.leader = "space"
   -- INFO: add your own keymapping
   -- INFO: normal_mode
   lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
   lvim.keys.normal_mode["<Tab>"] = ":bnext<CR>"
   lvim.keys.normal_mode["<S-Tab>"] = ":bprevious<CR>"
   lvim.keys.normal_mode["Q"]=":qa!<cr>"
   lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"
   lvim.keys.normal_mode["H"] = "0"
   lvim.keys.normal_mode["L"] = "$"
   lvim.keys.normal_mode["<leader>sc"] = "<cmd>nohlsearch<cr>"
   lvim.keys.normal_mode["<leader>wv"] = "<cmd>vsplit<cr>"
   lvim.keys.normal_mode["<leader>ws"] = "<cmd>split<cr>"
   lvim.keys.normal_mode["<leader>wd"] = "<C-w>c"
   lvim.keys.normal_mode["<leader>wh"] = "<C-w>h"
   lvim.keys.normal_mode["<leader>wj"] = "<C-w>j"
   lvim.keys.normal_mode["<leader>wk"] = "<C-w>k"
   lvim.keys.normal_mode["<leader>wl"] = "<C-w>l"
   -- INFO: visula_mode
   lvim.keys.visual_mode["H"] = "0"
   lvim.keys.visual_mode["L"] = "$"
   -- INFO:fix jk to Escape
   lvim.keys.insert_mode["jk"] = nil
   lvim.keys.insert_mode["kj"] = nil
   lvim.keys.insert_mode["jj"] = nil
    -- INFO:quickcopy
   lvim.keys.normal_mode["Y"] = "y$"
-- lvim.keys.normal_mode["<leader>y"] = '"+y'
-- lvim.keys.normal_mode["<leader>yy"] = '"+yy'
-- lvim.keys.normal_mode["<leader>p"] = '"+p"'

   -- X closes a buffer
   lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"
   -- accelerated-jk
   vim.api.nvim_set_keymap('n','j','<Plug>(accelerated_jk_gj)',{ silent=true })
   vim.api.nvim_set_keymap('n','k','<Plug>(accelerated_jk_gk)',{ silent=true })
   -- vim-easy-align
   vim.api.nvim_set_keymap('n','ga','<Plug>(EasyAlign)',{ silent=true })
   vim.api.nvim_set_keymap('x','ga','<Plug>(EasyAlign)',{ silent=true })
   -- run 保持终端
   vim.api.nvim_set_keymap('t','<Esc>',"<C-\\><C-n>",{silent=true})
   --lspsaga
   lvim.keys.normal_mode["<leader>ca"] = "<CMD>lua require('lspsaga.codeaction').code_action()<CR>"
   lvim.keys.normal_mode["<leader>rm"] = "<CMD>lua require('lspsaga.rename').rename()<CR>"
   lvim.keys.normal_mode["gp"] = "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>"
   --lvim.keys.normal_mode["K"] = "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>"
   lvim.keys.normal_mode["<C-j>"] = "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"
   lvim.keys.normal_mode["<C-k>"] = "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"
   --tmux navigation
   lvim.keys.normal_mode["<C-h>"] = "<CMD>lua require('Navigator').left()<CR>";
   lvim.keys.normal_mode["<C-j>"] = "<CMD>lua require('Navigator').down()<CR>"
   lvim.keys.normal_mode["<C-k>"] = "<CMD>lua require('Navigator').up()<CR>"
   lvim.keys.normal_mode["<C-l>"] = "<CMD>lua require('Navigator').right()<CR>"
   --whichkey
   lvim.builtin.which_key.mappings = {
      ["q"] = { "<cmd>q!<CR>", "Quit" },
      --["/"] = { "<cmd>lua require('Comment').toggle()<CR>", "Comment" },
      ["c"] = { "<cmd>BufferClose!<CR>", "Close Buffer" },
      --["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
      --["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      --Whichkey-b
  --lvim.builtin.which_key.mappings[";"] = { "<cmd>Dashboard<CR>", "Dashboard" }
      [";"] = { "<cmd>Alpha<CR>","Dashboard"},
  --lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }
      ["e"] = { "<cmd>NvimTreeToggle<CR>","Explorer"},
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
        i = { "<cmd>PackerInstall<cr>", "Install" },
        r = { "<cmd>lua require('lvim.utils').reload_lv_config()<cr>", "Reload" },
        s = { "<cmd>PackerStatus<cr>", "Status" },
        S = { "<cmd>PackerSync<cr>", "Sync" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      },
      --Whichkey-E
      E = {
        name = "Hello",
        v = { "<cmd>Vista<CR>", "Vista" },
	      u = { "<cmd>UndotreeToggle<CR>","UndoTree"},
        s = { "<cmd>SymbolsOutline<CR>","SymbolsOutline"},
      },
      --Whichkey-t
      t = {
        name = "Terminal",
        r = { "<cmd>RnvimrToggle<CR>", "ranger" },
	      a = { "<cmd>RnvimrResize<CR>", "resize"},
      },
      --Whichkey-r
      r = {
        name = "Run",
         t = { "<cmd>AsyncTask file-run<CR>", "Run on default terminal" },
	       f = { "<cmd>AsyncTask file-run-floaterm<CR>","Run on floaterm" }
      },
      --Whichkey-f
      f = {
        name = "+File",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<CR>", "Change colorscheme" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
	      f = { "<cmd>Telescope find_files<CR>", "Find File" },
        H = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        n = { "<cmd>enew<cr>", "New File" },
        r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
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
        j = {
          "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
          "Next Diagnostic",
        },
        k = {
          "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
          "Prev Diagnostic",
        },
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
        p = {"<cmd>MarkdownPreview<CR>","Preview"},
	      g = {"<cmd>Glow<CR>","Glow"}
      },
      --WhichKey-m
      n ={
        name="Neogen",
         c = { "<cmd>lua require('neogen').generate({ type = 'class'})<CR>", "Class Documentation" },
         f = { "<cmd>lua require('neogen').generate({ type = 'func'})<CR>", "Function Documentation" },
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
        p = { "<cmd>HopPattern<CR>", "search like /" },
	      s = { "<cmd>HopChar2<CR>","search by char2" },
        S = { "<cmd>HopChar1<CR>","search by char1" },
        w = { "<cmd>HopWord<CR>", "search word" },
	      l = { "<cmd>HopLine<CR>","search line" },
      },
        T = {
        name = "Treesitter",
        i = { ":TSConfigInfo<cr>", "Info" },
      },
}

end

return M
