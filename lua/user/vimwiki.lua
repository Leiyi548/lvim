local M = {}
M.config = function()
	vim.cmd([[
    let g:vimwiki_list = [{'path': '~/test/wiki',
                          \ 'syntax': 'markdown', 'ext': '.md'}]
    let g:wiki_mappings_use_default = 0
    nnoremap <leader>wn <Plug>VimwikiNextLink
    nnoremap <leader>wp <Plug>VimwikiPrevLink
    nnoremap <leader>wg <Plug>VimwikiGoto
    nnoremap <leader>wr <Plug>VimwikiRenameFile
    nnoremap <leader>md <Plug>VimwikiDeleteFile
    ]])
end
return M
