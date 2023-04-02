function! BasicSettings()
    set number
    set showmatch
    set tabstop=4
    set expandtab
    set shiftwidth=4
    set encoding=utf-8
    set noerrorbells
    set autoindent
    syntax on
    set scrolloff=5
    filetype plugin indent on
    hi DiffAdd    ctermfg=black ctermbg=2
    hi DiffChange ctermfg=black ctermbg=3
    hi DiffDelete ctermfg=black ctermbg=6
    hi DiffText   ctermfg=black ctermbg=7
endfunction

" LSP settings
function! LSPSettings()
    call plug#begin('~/.vim/plugged')
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    call plug#end()
endfunction

" LSP settings
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
endif

" Function to automatically close brackets for given filetypes
function! AutoCloseBracketsForFiletypes(filetypes)
    for filetype in a:filetypes
        execute 'autocmd FileType ' . filetype . ' inoremap <buffer> ( ()<Left>'
        execute 'autocmd FileType ' . filetype . ' inoremap <buffer> [ []<Left>'
        execute 'autocmd FileType ' . filetype . ' inoremap <buffer> { {}<Left>'
        execute 'autocmd FileType ' . filetype . ' inoremap <buffer> " ""<Left>'
        execute 'autocmd FileType ' . filetype . ' inoremap <buffer> ' "'" " ''<Left>"
    endfor
endfunction

function! NoreMapping()
    nnoremap gd :LspDefinition<CR>

    let fileTypes = ['go', 'python', 'rust', 'vim']
    call AutoCloseBracketsForFiletypes(fileTypes)
endfunction

" main
call BasicSettings()
call LSPSettings()
call NoreMapping()
