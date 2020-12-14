" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif





"
"
"
" PLUGINS
"
"
"
call plug#begin()

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'

" Files
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Look and feel
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'

" Languages support
Plug 'davidhalter/jedi-vim'
Plug 'tomlion/vim-solidity'
Plug 'posva/vim-vue'

call plug#end()





"
"
"
" GENERAL SETTINGS
"
"
"
" Config with help from:
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" https://www.chrisatmachine.com/Neovim/02-vim-general-settings
"
" NOTE: changed for my style
"
"
" Really, really boring general settings
"
"
" Language
let $LANG='en'
set langmenu=en

" Sets how many lines of history VIM has to remember
set history=200

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" The encoding written to file
set fileencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Support 256 colors
set t_Co=256

" A buffer becomes hidden when it is abandoned
set hid

" Required to keep multiple buffers open
set hidden

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
set nowritebackup

" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Enable your mouse
set mouse=a

" Copy paste between vim and everything else
set clipboard=unnamedplus



"
"
" Editor view settings
"
"
" Enable syntax highlighting
syntax enable

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

"Always show current position
set ruler

" Add a bit extra margin to the left
set foldcolumn=1

" Height of the command bar
set cmdheight=2

" Makes popup menu smaller
set pumheight=10

" Display long lines as just one line
set nowrap

" Linebreak on 500 characters
" set lbr
" set tw=500

" Horizontal splits will automatically be below
set splitbelow

" Vertical splits will automatically be to the right
set splitright

" Enable highlighting of the current line
"set cursorline

" Background color
set background=dark

" Color theme
colorscheme gruvbox

" Relative line number
set relativenumber

" Show current line
set number



"
"
" Search settings
"
"
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch



"
"
" Tabs
"
"
" Insert 4 spaces for a tab
set tabstop=4

" Change the number of space characters inserted for indentation
set shiftwidth=4

" Makes tabbing smarter will realize you have 2 vs 4
set smarttab

" Converts tabs to spaces
set expandtab

" Makes indenting smart
set smartindent

" Good auto indent
set autoindent

" Always show tabs
set showtabline=2

" Auto indent
set ai

" Smart indent
set si





"
"
"
" KEY MAPPINGS
"
"
"
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Better window navigation (with Ctrl only)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l





"
"
"
" JUST WOW
"
"
"
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif





