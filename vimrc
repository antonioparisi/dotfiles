""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------
" VIM configuration file
" ----------------------
"
" Maintainer: Antonio Parisi <ant.parisi@gmail.com>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent off "disable file type detection for loading specific options
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  " Elixir
  Plugin 'elixir-lang/vim-elixir'

  Plugin 'SirVer/ultisnips'
  Plugin 'Townk/vim-autoclose'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-scripts/darkspectrum'
  Plugin 'nono/vim-handlebars'
  Plugin 'othree/html5.vim'
  Plugin 'yueyoum/vim-linemovement'
  Plugin 'itchyny/lightline.vim'
  Plugin 'Lokaltog/powerline'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'digitaltoad/vim-jade'
  Plugin 'kien/ctrlp.vim'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'tpope/vim-rvm'
  Plugin 'scrooloose/syntastic'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'skalnik/vim-vroom'
  Plugin 'bronson/vim-trailing-whitespace'
  Plugin 'tpope/vim-rails'
  Plugin 'kablamo/vim-git-log'
  Plugin 't9md/vim-ruby-xmpfilter'
  Plugin 'junegunn/goyo.vim'
  Plugin 'morhetz/gruvbox'

  " Clojure
  "Plugin 'tpope/vim-fireplace'
  "Plugin 'guns/vim-clojure-static'
  "Plugin 'tpope/vim-salve'
  "Plugin 'tpope/vim-projectionist'
  "Plugin 'tpope/vim-dispatch'
  "Plugin 'dgrnbrg/vim-redl'

call vundle#end()

filetype plugin indent on "enable loading plugins and indents based on file type (required for Vundle)

" => General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
set encoding=utf-8
set nocompatible "drop compatibility for Vi
set ignorecase "ignore case on searches and everywhere else
set infercase "make insert-matching preserve the already written characters
set mouse= "disable mouse
set number "enable line numbers
set smartcase "enable case sensitive search if pattern contains upper case
set wildmenu "show possible completion matches
set wildmode=list:longest "list all matches and complete to longest common string
set scrolloff=3 "minimal number of screen lines to keep above/below the cursor
set number
set list
set listchars=tab:→→,extends:>,precedes:<,trail:.
set nowrap
set linebreak
set hlsearch
set incsearch
set switchbuf=useopen
set noswapfile

" => Appearence options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "turn on syntax highlighting
set ruler "show the line and column number of the cursor position
set laststatus=2 "always show statusline
set t_Co=256
"let g:solarized_termcolors=256
set background=dark

colorscheme gruvbox

" => Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pumheight=10 "maximum number of popup menu items for Insert mode completion
set completeopt=menuone,longest "show menu and complete longest, don't show preview window

" => Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start "intuitive backspacing in insert mode

" => Indenting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent "copy indent from current line when starting a new line
set tabstop=2 "number of spaces that a <Tab> in the file counts for
set softtabstop=2 "number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=2 "number of spaces to use for each step of (auto)indent
set expandtab "use the appropriate number of spaces to insert a <Tab>.
"set smarttab "makes a <Tab> in front of a line insert blanks according to 'shiftwidth'

" => CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*

" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "," "change map leader (<Leader>)

" Quick Escape
inoremap jk <Esc>

" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ack
""""""""""""""""""""""""""""""
let g:ackprg="ack-grep --with-filename --nocolor --nogroup --column"

" Buffet
""""""""""""""""""""""""""""""
noremap <leader>bl :Bufferlistsw<cr>

" CtrlP
""""""""""""""""""""""""""""""
nnoremap <C-B> :<C-U>CtrlPBuffer<CR>
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_match_window = 'min:5,max:10,results:100'
let g:ctrlp_show_hidden = 0
let g:ctrlp_working_path_mode = 0

" delimitMate
""""""""""""""""""""""""""""""
let delimitMate_excluded_ft = "xml"

" NERD Tree
""""""""""""""""""""""""""""""
"Toggle NERD Tree on/off
nmap <C-n> :NERDTreeToggle<CR>

"Filter uninteresting files
let NERDTreeIgnore = ['\.class$']
let g:NERDTreeWinSize = 40

" Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_c_config_file='.clang_complete'
let g:syntastic_cpp_config_file='.clang_complete'

" RSpec.vim mappings
let g:rspec_runner = "os_x_iterm2"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" => Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:linemovement_up="<c-k>"
let g:linemovement_down="<c-j>"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

highlight clear SignColumn
let g:gitgutter_highlight_lines = 0
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

let g:xmpfilter_cmd = "seeing_is_believing"

"autocmd FileType ruby nmap <buffer> <C-m> <Plug>(seeing_is_believing-mark)
"autocmd FileType ruby xmap <buffer> <C-m> <Plug>(seeing_is_believing-mark)
"autocmd FileType ruby imap <buffer> <C-m> <Plug>(seeing_is_believing-mark)

autocmd FileType ruby nmap <buffer> <C-c> <Plug>(seeing_is_believing-clean)
autocmd FileType ruby xmap <buffer> <C-c> <Plug>(seeing_is_believing-clean)
autocmd FileType ruby imap <buffer> <C-c> <Plug>(seeing_is_believing-clean)

" xmpfilter compatible
autocmd FileType ruby nmap <buffer> <C-r> <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby xmap <buffer> <C-r> <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby imap <buffer> <C-r> <Plug>(seeing_is_believing-run_-x)

" auto insert mark at appropriate spot.
autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing_is_believing-run)
autocmd FileType ruby xmap <buffer> <F5> <Plug>(seeing_is_believing-run)
autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing_is_believing-run)

" vim-redl
let g:redl_use_vsplit = 1
imap <silent> <C-S-K> <Plug>clj_repl_uphist.
