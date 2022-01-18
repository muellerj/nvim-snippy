if has('vim_starting')
  set encoding=utf-8
endif
scriptencoding utf-8

if &compatible
  set nocompatible
endif

let s:plug_dir = expand('/tmp/plugged/vim-plug')
if !filereadable(s:plug_dir .. '/plug.vim')
  execute printf('!curl -fLo %s/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', s:plug_dir)
end

execute 'set runtimepath+=' . s:plug_dir
call plug#begin(s:plug_dir)
Plug '~/sandbox/snippy/nvim-snippy'
Plug 'honza/vim-snippets'
call plug#end()
PlugInstall | quit

imap <expr> <Tab> snippy#expand_or_advance('<Tab>')
imap <expr> <S-Tab> snippy#previous('<S-Tab>')
smap <expr> <Tab> snippy#next('<Tab>')
smap <expr> <S-Tab> snippy#previous('<Tab>')
xmap <Tab> <Plug>(snippy-cut-text)

lua << EOF
    require('snippy').setup({
        hl_group = 'Search',
        -- Change this
        snippet_dirs = '',
    })
EOF
