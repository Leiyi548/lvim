local M = {}

M.config = function ()
  lvim.autocommands.custom_groups = {
    -- dashboard
    { "FileType", "alpha", "nnoremap <silent> <buffer> q :q<CR>" },
    -- python
    {
      "Filetype",
      "python",
      "nnoremap <leader>ru <cmd>lua require('lvim.core.terminal')._exec_toggle('python "
        .. vim.fn.expand "%"
        .. ";read')<CR>",
    }
  }
end
return M
