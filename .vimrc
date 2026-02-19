""""""""""""""""""""""""""""""""""""""""""""""""""
" Credits:
"   Kévin "Chewie" Sztern
"   https://github.com/Chewie/dotfiles
"
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" General parameters
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: Switch over to the native Vim 8.0 package
"
" Install vim-plug if we don't already have it
" Credit to github.com/captbaritone
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Autopairs
Plug 'jiangmiao/auto-pairs'

" Mappings
" Plug 'romainl/vim-qf'

" Navigation
" Plug 'tpope/vim-vinegar'
Plug 'mileszs/ack.vim'

" Theming
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Clang-format
" Plug 'rhysd/vim-clang-format'

call plug#end()

" Enable filetype detection for plugins and indentation options
filetype plugin indent on

" Reload a file when it is changed from the outside
set autoread

" Write the file when we leave the buffer
set autowrite

" Disable backups, we have source control for that
set nobackup

" Force encoding to utf-8, for systems where this is not the default (windows
" comes to mind)
" set encoding=utf-8

" Disable swapfiles too
set noswapfile

" Hide buffers instead of closing them
set hidden

""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""""""""""""""""

" Make backspace behave as expected
set backspace=eol,indent,start

" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show line number
set number

" Always show status line
set laststatus=2

" Format the status line
" This status line comes from Pierre Bourdon's vimrc
"set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)

" Enhance command line completion
set wildmenu

" Set completion behavior, see :help wildmode for details
set wildmode=longest:full,list:full

" Enable C completion
autocmd FileType c,cpp setlocal omnifunc=ccomplete#Complete
set completeopt=menu,menuone

" Disable bell completely
set visualbell
set t_vb=

" Color the column after textwidth, usually the 80th
if version >= 703
  set colorcolumn=+1
endif

" Display whitespace characters
set list
set listchars=tab:>─,trail:.,nbsp:¤

set fillchars=vert:│

" Enables syntax highlighting
syntax on

" Allow mouse use in vim
set mouse=a

" Briefly show matching braces, parens, etc
set showmatch

" Enable line wrapping
" set wrap

" Wrap on column 80
set textwidth=79

" Highlight current line
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch

" Don't highlight matched strings
set nohlsearch

" Show number of matches
set shortmess-=S

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options
""""""""""""""""""""""""""""""""""""""""""""""""""

" The length of a tab
" This is for documentation purposes only,
" do not change the default value of 8, ever.
set tabstop=3

" The number of spaces inserted/removed when using < or >
set shiftwidth=3

" The number of spaces inserted when you press tab.
" -1 means the same value as shiftwidth
set softtabstop=-1

" Insert spaces instead of tabs
set expandtab

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set "," as map leader
let mapleader = ","

" Yank from cursor to end of line, to be consistent with C and D
nnoremap Y y$

" Open the quickfix window if there are errors, or close it if there are no
" errors left
" noremap <leader>cw :botright :cw<cr>

" Run make silently, then skip the 'Press ENTER to continue'
" noremap <leader>m :silent! :make! \| :redraw!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistence options
""""""""""""""""""""""""""""""""""""""""""""""""""

" See :h last-position-jump
augroup last_position_jump
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Persistent undo
if version >= 703
    set undofile
    set undodir=~/.vim/undo-dir
    silent !mkdir -p ~/.vim/undo-dir
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin mappings and options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Feel free to switch to another colorscheme
colorscheme onedark

" Disable Ack.vim's mappings on the quickfix and location list windows
" We use vim-qf mappings instead
" let g:ack_apply_qmappings = 0
" let g:ack_apply_lmappings = 0
" let g:qf_mapping_ack_style = 1

" Override unimpaired quickfix and loc-list mappings to use vim-qf wrapparound
" let g:nremap = {"[q": "", "]q": "", "[l": "", "]l": ""}
" nmap [q <Plug>(qf_qf_previous)
" nmap ]q <Plug>(qf_qf_next)
" nmap [l <Plug>(qf_loc_previous)
" nmap ]l <Plug>(qf_loc_next)

" Add the termdebug built-in plugin
if version >= 801
    packadd termdebug
endif

" Clang-Format (cpp for headers)
" let g:clang_format#auto_filetypes = ["c", "cpp"]
" autocmd FileType c,cpp ClangFormatAutoEnable

" Sqlfluff
" autocmd BufWritePost *.sql !sqlfluff fix %

" System clipboard
" vim --version must have clipboard functionality available
set clipboard=unnamedplus
" "+y "+p (literaly the three characters)
