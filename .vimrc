" A self descriptive vim tutorial
" :help vi-differences

" Vim is charityware
" :help uganda

" global vimrc file location
" :echo $VIM
" personal vimrc file location, overrides global
" :echo $HOME
" :echo $MYVIMRC

" keep vimrc clean and structured
" source /path/to/external/file


" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

set nocompatible              " be iMproved, required
filetype plugin on
filetype off                  " required
" :set filetype sh

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'elzr/vim-json.git'
" Plugin 'JamshedVesuna/vim-markdown-preview'
"Plugin 'suan/vim-instant-markdown'
" Plugin 'edkolev/promptline.vim'
"Plugin 'edkolev/tmuxline.vim'
"Plugin 'xuhdev/SingleCompile.git'
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'bling/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim.git'

"Plugin 'enomsg/vim-haskellConcealPlus'

"Plugin 'vim-scripts/c.vim.git'
Plugin 'easymotion/vim-easymotion.git'
"Plugin 'altercation/vim-colors-solarized'  
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'Valloric/YouCompleteMe.git'
Plugin 'scrooloose/nerdtree.git'
"Plugin 'vim-scripts/a.vim.git'
Plugin 'fholgado/minibufexpl.vim.git'
Plugin 'scrooloose/nerdcommenter.git'
"Plugin 'scrooloose/syntastic.git'
"Plugin 'majutsushi/tagbar.git'
"Plugin 'SirVer/ultisnips.git'
"Plugin 'klen/python-mode.git'
"Plugin 'davidhalter/jedi-vim.git'
"Plugin 'derekwyatt/vim-scala'


" toggle comments - gc{motion}, gcc, gcap, {visual}gc, gcgc for adjacent lines
Plugin 'tpope/vim-commentary.git'
Plugin 'jiangmiao/auto-pairs.git'

Plugin 'tpope/vim-repeat.git'

" java auto complete
"Plugin 'dansomething/vim-eclim'
Plugin 'tpope/vim-surround.git'


" Ruby
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-bundler'
"Plugin 'tpope/vim-cucumber'
"Plugin 'slim-template/vim-slim.git'
"Plugin 'skalnik/vim-vroom'
"Plugin 'tpope/vim-endwise'
"Plugin 'ervandew/supertab'


" Go
"Plugin 'fatih/vim-go'

" :Godoc  => open doc window
" :Fmt    => format current buffer
" :Import => add import statement
"Plugin 'vim-jp/vim-go-extra'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" colorscheme solarized
set background=dark
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline, Courier\ New\ 12
" set font based on file extensions
" autocmd BufEnter *.txt set guifont=Arial\ 12
" set guifont=Hasklig:h13

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
set nobackup
set noswapfile

set autoindent 
set nowrap

set modeline
set modelines=4
set exrc
set secure
set number
syntax on
set tabstop=4 " width of tab is 4, still it is a \t
set shiftwidth=4 " set indent width as 4
set softtabstop=4 " set column number for a tab as 4
set expandtab " expand tabs to spaces
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set nolist
set hlsearch
set ignorecase
set incsearch
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" set colorcolumn=80,160

" :match ColorColumn /^set/
" :match NONE
" :2match
" :3match
highlight ColorColumn ctermbg=magenta guibg=Magenta
call matchadd('ColorColumn', '\%81v', 100)
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
set cursorline
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif


syntax on
filetype plugin indent on


"""""""""""""""""""""" Vim Setup"""""""""""""""""""""""
let mapleader=";"
:imap ii <Esc>
":nnoremap <C-n> :bnext<CR>
":nnoremap <C-p> :bprevious<CR>

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
nnoremap <silent> [b :bprevious<CR> 
nnoremap <silent> ]b :bnext<CR> 
nnoremap <silent> [B :bfirst<CR> 
nnoremap <silent> ]B :blast<CR>

"""""""""""""""""""" SingleCompileRun """""""""""""""""""
nmap <F5> :SCCompile<cr>
nmap <F6> :SCCompileRun<cr>
"map <F9> :w<CR> :!g++ % -Wall -g -std=c++11 -o %< -Wall -Wextra 2>errors.err; cat errors.err \|\| ./%<<CR>
"map <F10> :w<CR> :!g++ % -Wall -g -std=c++14 -o %< -Wall -Wextra 2>errors.err; cat errors.err \|\| ./%<<CR>


"""""""""""""""""""""" Tagbar """""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" " show hidden files in NERDTree
let NERDTreeShowHidden=1
" " Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" " expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>


" Set YCM
let g:ycm_global_ycm_extra_conf = ".ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <F4> :YcmForceCompileAndDiagnostics<CR>

"""""""""""""""""""""" easymotion """""""""""""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)


"""""""""""""""""""""" vim-cpp-enhanced-hightlisht """""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1


" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator
" modes)
" ]]            Jump on next class or function (normal, visual, operator
" modes)
" [M            Jump on previous class or method (normal, visual, operator
" modes)
" ]M            Jump on next class or method (normal, visual, operator
" modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Disable vim markdown auto folding
" :set [no]foldenable
" gx: open the link under the cursor in the same browser as the standard gx command.
" ge: open the link under the cursor in Vim for editing. Useful for relative markdown links
" ]]: go to next header |  [[: go to previous header.
" ][: go to next sibling header if any | []: go to previous sibling header if any
" ]c: go to Current header.            | ]u: go to parent header(Up)
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:markdown_fenced_languages = ['java', 'css', 'ruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']
let g:vim_markdown_conceal = 0

" Easy expansion of the active file director, %% is automatically converted as `pwdi`
" when we type %% on Vim’s : command-line prompt, it automatically expands to
" the path of the active buffer, just as though we had typed %:h<Tab>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" Write a better commit message
" Never use the -m <msg> / --message=<msg> flag to git commit
" Write  a story in your git log
autocmd Filetype gitcommit setlocal spell textwidth=80

if (has("gui_running"))
    :let macvim_skip_colorscheme=1
    " set guioptions=egmrt
    " colorscheme solarized
    set background=dark
    set macligatures
endif


" vim-instant-markdown
let g:instant_markdown_slow = 1
" set shell=bash\ -i

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0




" vim-surround
" https://github.com/tpope/vim-surround
" e.g. "[Hello] World!"
" cs"'
" cs"<q>
" ds"
" cs[}
" cs{]
"visual mode. Press a capital V (for linewise visual mode) followed by S<p class="important"> 
