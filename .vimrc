" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Tab settings
set tabstop=4
set shiftwidth=4
set smarttab

" Display line numbers on the left
set number

" Enable syntax highlighting
syntax on

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set listchars=tab:»\ ,trail:·,eol:¶
set list

" Always display the status line, even if only one window is displayed
set laststatus=2

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Show partial commands in the last line of the screen
set showcmd

