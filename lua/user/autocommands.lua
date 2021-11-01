local M = {}

M.config = function ()
  lvim.autocommands.custom_groups = {
    -- dashboard
    { "FileType", "alpha", "nnoremap <silent> <buffer> q :q<CR>" },
    { "FileType", "alpha", "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= " },
    { "FileType", "alpha", "set laststatus=0" },
    {
      "FileType",
      "alpha",
      "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=" .. vim.opt.showtabline._value,
    },
    -- python
    { "FileType", "python", "inoremap <silent> <buffer> ,, <++>"},
    { "FileType", "python", "inoremap <silent> <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>_c4l"}
  }
end
return M
