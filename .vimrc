" Vundle
:set nocompatible

filetype off

:set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Plugin 'chrisbra/vim-commentary'
Plugin 'easymotion/vim-easymotion'

call vundle#end()

filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""

" Abaixo a minha configuração
" TODO: Ajustar a indentação dos laços condicionais no cindent 
syntax on
:set number
:set tabstop=4
:set expandtab
:set shiftwidth=4 " or whatever
:set smarttab autoindent

:inoremap ( ()<Esc>i
:inoremap " ""<Esc>i
:inoremap { {<CR><BS>}<Esc>ko

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set t_Co=256
colorscheme seoul256

autocmd VimEnter * NERDTree Clang 
nmap <F6> :NERDTreeToggle<CR>

autocmd bufnewfile *.c so /home/rogers/Workspace/Clang/header.txt
autocmd bufnewfile *.c exe "1," . 7 . "g/Creation Date:.*/s//Creation Date: " .strftime("%c")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 7. "g/Last Modified:.*/s/Last Modified:.*/Last Modified: " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
