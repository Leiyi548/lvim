local M = {}

M.config = function ()
  lvim.autocommands.custom_groups = {
    -- dashboard
    { "FileType", "alpha", "nnoremap <silent> <buffer> q :q<CR>" },
    -- python
    { "FileType", "python", "inoremap <silent> <buffer> ,, <++>"},
    { "FileType", "python", "inoremap <silent> <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>_c4l"}
  }
end
return M
